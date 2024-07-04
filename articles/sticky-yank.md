---
title: 'Sticky Yank: Keep the cursor position when yanking'
date: 2024-07-04T00:00:00.000Z
tags:
  - keymap
  - yank
---

One of the minor annoyances of vim for me was that yank operations would move
the cursor to the beginning of the affected text, for instance, `yap` would move
the cursor to the beginning of the paragraph.

There are plugins such as
[yanky.nvim](http://github.com/gbprod/yanky.nvim) that solve this problem, but they
have many more features I didn't really need. So I came up with a short snippet
that solves the problem for me.

It works by essentially hooking into any yank operation to save the cursor
position, and then uses the `TextYankPost` autocommand to restore the cursor
after the yank operation.

```lua
local cursorPreYank
vim.keymap.set({ "n", "x" }, "y", function()
	cursorPreYank = vim.api.nvim_win_get_cursor(0)
	return "y"
end, { expr = true })
vim.keymap.set("n", "Y", function()
	cursorPreYank = vim.api.nvim_win_get_cursor(0)
	return "y$"
end, { expr = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		if vim.v.event.operator == "y" and cursorPreYank then
			vim.api.nvim_win_set_cursor(0, cursorPreYank)
		end
	end,
})
```
