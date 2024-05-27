---
title: "File Watcher for Neovim"
date: 2022-12-08
tags: [automation]
cssclass: writing
---

For automation purposes, you may want to control neovim via an external application. While neovim has tons of APIs and commands for everything, there are not really many options for communication for outside apps.

To make third-party-apps *read* information about your neovim session, you could [use the `title` option](https://nanotipsforvim.prose.sh/change-vims-window-title). To have third-party-apps *trigger* events in neovim, the only method I could find is to use a file watcher from the luv-library, exposed via `vim.loop`. There, we have [four commands for file-system-events](https://neovim.io/doc/user/luvref.html#luv-fs-event-handle), allowing us to use a designated file as intermediary: The external app writes to the file, the file watcher picks up changes, and in turns triggers a function in neovim. The documentation is pretty sparse, but the minimal code for should be this: 

```lua
-- minimal hello-world-style example
local watchedFile = "/tmp/nvim"
local w = vim.loop.new_fs_event()
local function on_change(err)
	print("file has changed")
end
w:start(watchedFile, {}, on_change)

-- with error-handling
local watchedFile = "/tmp/nvim"
local w = vim.loop.new_fs_event()
local function on_change(err)
	if err then
		print(err)
		return
	end
	print("file has changed")
	if w then 
		w:stop()
		w:start()
	end
end

if w then
	w:start(watchedFile, {}, on_change)
end
```
