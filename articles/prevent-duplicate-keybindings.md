---
tags:
  - keymap
cssclasses:
  - writing
mdate: 2023-12-30T12:28
title: Prevent Duplicate Keybindings
date: 2023-12-29
---

When you have a lot of keymaps, you will inevitably get to make duplicate keymappings by accident. These are especially annoying, since they can often result in very subtle bugs in your config. However, there is a simple solution to it: the [option `unique` for keymappings](https://neovim.io/doc/user/map.html#%3Amap-unique):

```lua
vim.keymap.set("n", …, …, {unique = true})
```

This simple mapping will check if there is already a user-mapping for `gf` set, and if so throw an error. Overriding builtin mappings from vim does not result in an error. Trying to map a key which a plugin has already mapped to something does throw an error.

Now, since adding `unique = true` to every single keymap is of course tedious, we write a small wrapper around `vim.keymap.set` which basically set `unique = true` as the default, but still respects `unique = false` if you have set it:

```lua
local function uniqueKeymap(modes, lhs, rhs, opts)
	if not opts then opts = {} end
	if opts.unique == nil then opts.unique = true end
	vim.keymap.set(modes, lhs, rhs, opts)
end
```

This is not only an quick and easy method of finding duplicate keymaps, but effectively also a minimal form of testing for your neovim config: as soon as you create a duplicate keymap, you are immediately informed about the issue!

However, there are two small caveats with this:
1. Re-sourcing a buffer (running `:source %`), a common method for reloading a config without having to restart nvim, will results in an error when you have a `unique = true` mapping in that buffer. Since re-sourcing effectively runs the keymap a second time, it correctly throws an error that the mapping is not unique. This issue regrettably cannot be avoided, so you will have to restart neovim.
2. There are [a handful of mappings](https://neovim.io/doc/user/vim_diff.html#default-mappings) neovim maps on top of the vim builtin mappings, such as `nmap Y y$`. Unfortunately, `unique = true` considers those mappings by nvim as "user-mappings", so when you create a mapping for `Y`, it will throw an error, even you have no other mapping for `Y`. There is little you can do about this, other than explicitly setting `unique = false` to avoid the uniqueness check for those mappings.

Keepings these limitations in mind, `unique = true` is a great way to make your config more stable.
