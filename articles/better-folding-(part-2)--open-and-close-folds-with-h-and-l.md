---
tags: [folding, keymap]
cssclass: writing
title: "Better Folding (part 2): Open and Close folds with `h` and `l`"
date: 2023-07-19
---

A not very well known way to open folds is simply using `l` (or any other horizontal movement) on a closed fold. This is due to the `hor` option of [`foldopen`](https://neovim.io/doc/user/options.html#'foldopen'), which is enabled by default. 

So I thought, what if we could also *close* folds `h`? Obviously closing folds is a bit more tricky than opening them, since we want to be able to preserve the ability to move horizontally in a unfolded line. So the trick is to only make `h` fold in a situation where we normally wouldn't use `h` anymore—namely when the cursor is on the first non-blank character in a line or before. If we are anywhere after the first non-blank, `h` will just fallback to its default behavior of moving to the left.

```lua
vim.keymap.set("n", "h", function()
	local onIndentOrFirstNonBlank = vim.fn.virtcol(".") <= vim.fn.indent(".") + 1
	local shouldCloseFold = vim.tbl_contains(vim.opt_local.foldopen:get(), "hor")
	if onIndentOrFirstNonBlank and shouldCloseFold then
		local wasFolded = pcall(vim.cmd.normal, "zc")
		if wasFolded then return end
	end
	vim.cmd.normal{"h", bang = true}
end, { desc = "h (+ close fold at BoL)" })
```

When you are in the habit of staying to the left anyway, this effectively allows you to use `h` and `l` to close and open folds. No more need for `za`, `zc`, `zo`, and similar bindings!

The snippet also pairs well with [`startofline`](https://neovim.io/doc/user/options.html#'startofline'), as this the option moves your cursor to the first non-blank character in a line more often.