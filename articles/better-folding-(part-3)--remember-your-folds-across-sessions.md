---
tags: [folds]
cssclass: writing
title: "Better Folding (part 3): Remember your folds across sessions"
date: 2023-07-19
---

When you manually fold a lot of lines, one annoying thing you may have noticed is that these folds to not persist across sessions. However, we can save and load folding with vim's builtin [:mkview](https://neovim.io/doc/user/starting.html#%3Amkvie) and [:loadview](https://neovim.io/doc/user/starting.html#%3Alo). Create autocommands for the two commands, and we are got folds persisting across sessions (or technically, leaving/entering a buffer).

```lua
local function remember(mode)
	-- avoid complications with some special filetypes
	local ignoredFts = { "TelescopePrompt", "DressingSelect", "DressingInput", "toggleterm", "gitcommit", "replacer", "harpoon", "help", "qf" }
	if vim.tbl_contains(ignoredFts, vim.bo.filetype) or vim.bo.buftype ~= "" or not vim.bo.modifiable then return end

	if mode == "save" then
		cmd.mkview(1)
	else
		pcall(function() cmd.loadview(1) end) -- pcall, since new files have no view yet
	end
end
vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "?*",
	callback = function() remember("save") end,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "?*",
	callback = function() remember("load") end,
})
```

However, one thing you might have noticed is that folds are still lost when you search in a file. [Luckily, that, too, can be fixed.](https://nanotipsforvim.prose.sh/better-folding-%28part-1%29--pause-folds-while-searching)
