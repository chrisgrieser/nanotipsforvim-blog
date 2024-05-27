---
aliases: safe require
tags: [config]
mdate: 2023-12-20T13:51
cssclass: writing
title: "Using `pcall` to make your config more stable"
date: 2023-04-16
---

*[This post is an edited version of a response I left to a user being frustrated that their config regularly breaks.](https://www.reddit.com/r/neovim/comments/12o2pzq/comment/jggvt2n/?context=1)*

> any small change in the massive config will suddenly break everything  
> *– user on reddit*

I found wrapping every `require` in my `init.lua` in a `pcall` did help with this problem.

`pcall` works roughly like `try` & `catch` in other languages. Normally, a script will stop execution when it runs into an error, so an error in one of the early required modules will prevent all the modules required afterwards from bring loaded.

```lua
-- init.lua
require("config.options")
require("config.autocmds") -- <- error here
require("config.theme-config") -- <- not loaded
require("config.keybindings") -- <- not loaded
```

With `pcall`, the script will continue execution even if it encounters an error, so a problem in one of your modules does not prevent the following ones from being loaded. This way, when you make a mistake in one of your config files, the other ones are still loaded correctly. Any configuration error will stay isolated and will not cascade into a completely broken configuration:

```lua
-- init.lua
local function safeRequire(module)
	local success, loadedModule = pcall(require, module)
	if success then return loadedModule end
	vim.cmd.echo ("Error loading " .. module)
end

safeRequire("config.options")
safeRequire("config.autocmds") -- <- error here
safeRequire("config.theme-config") -- <- still loaded
safeRequire("config.keybindings") -- <- still loaded
```

Of course, splitting up your config into smaller modules further insulates your modules from issues in other parts of your config. (Apart from being good practice anyway.)
