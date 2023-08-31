# vis-options-backport

This little library for `vis` backports the `vis.options` and
`win.options` Lua API that is coming up in version 0.9 to older
versions. I tested it with version 0.5.

### Installation

Clone this repository to where you install your plugins. (If this
is your first plugin, which it probably isn't, running
`git clone https://github.com/milhnl/vis-options-backport` in
`~/.config/vis/` will probably work).

Then, add `require('vis-options-backport')` to your `visrc`.

### Usage

Configure the options as you would in version 0.9. So replace
`vis:command('set tabwidth 4')` with `win.options.tabwidth = 4`. This
plugin will then update the vis setting, and reading the `options`
table will work as expected. The old `vis:command('set ...')` will work,
but retrieving the value you set won't.

Be careful: some options are window-specific, and set on `win`, others
are global and set on `vis`.
