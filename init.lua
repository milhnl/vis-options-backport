if vis.options == nil then
  local globalOptions = {
    autoindent = false,
    escdelay = 50,
    shell = "/bin/sh", -- or SHELL or /etc/passwd
  }
  local windowOptions = {
    colorcolumn = 0,
    cursorline = false,
    expandtab = false,
    numbers = false,
    relativenumbers = false,
    showeof = true,
    shownewlines = false,
    showspaces = false,
    showtabs = false,
    tabwidth = 8,
  }
  local proxyoptions = function(options)
    local rename = setmetatable({
      showtabs = "show-tabs",
      shownewlines = "show-newlines",
      showspaces = "show-spaces",
      showeof = "show-eof",
    }, { __index = function(_, k) return k; end })
    return setmetatable({}, {
      __index = function(t, k)
        return options[k]
      end,
      __newindex = function(t, k, v)
        if options[k] == nil then
          vis:info("Unknown option: '" .. k .. "'")
        end
        vis:command("set " .. rename[k] .. " " .. tostring(v))
        options[k] = v
      end
    })
  end
  vis.options = proxyoptions(globalOptions)
  vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    win.options = proxyoptions(windowOptions)
  end)
end
