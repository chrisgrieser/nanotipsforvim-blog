---
tags: [folding, search]
cssclass: writing
title: "Better Folding (Part 1): Pause Folds while Searching"
date: 2023-07-19
---

*Disabling* search in [`foldopen`](https://neovim.io/doc/user/options.html#'foldopen') has the disadvantage of making search nearly unusable, since you cannot see the search match in a closed fold. *Enabling* search in `foldopen` has the disadvantage of constantly opening all your folds as soon as you search, discouraging the use of many manually opened or closed folds very.

This snippet fixes this by pausing folds while searching, but restoring them when you are done searching:

```lua
vim.opt.foldopen:remove { "search" } -- no auto-open when searching, since the following snippet does that better

vim.keymap.set("n", "/", "zn/", { desc = "Search & Pause Folds" })
vim.on_key(function(char)
	local key = vim.fn.keytrans(char)
	local searchKeys = { "n", "N", "*", "#", "/", "?" }
	local searchConfirmed = (key == "<CR>" and vim.fn.getcmdtype():find("[/?]") ~= nil)
	if not (searchConfirmed or vim.fn.mode() == "n") then return end
	local searchKeyUsed = searchConfirmed or (vim.tbl_contains(searchKeys, key))

	local pauseFold = vim.opt.foldenable:get() and searchKeyUsed
	local unpauseFold = not (vim.opt.foldenable:get()) and not searchKeyUsed
	if pauseFold then
		vim.opt.foldenable = false
	elseif unpauseFold then
		vim.opt.foldenable = true
		vim.cmd.normal("zv") -- after closing folds, keep the *current* fold open
	end
end, vim.api.nvim_create_namespace("auto_pause_folds"))
```

While this snippet ensures that our folds persist even when searching, they are by default only persistent until you end the session. [To make folds persist across sessions as well, you have to use `:mkview` and `:loadview`](https://nanotipsforvim.prose.sh/better-folding-%28part-3%29--remember-your-folds-across-sessions).