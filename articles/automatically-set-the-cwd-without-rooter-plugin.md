---
date: 2024-05-20
tags:
  - config
title: Automatically set the cwd (without rooter plugin)
---

nvim 0.10 introduces
[vim.fs.root](https://neovim.io/doc/user/lua.html#vim.fs.root()), which
basically replaced the need for a rooter-plugin for me. Automatically setting
the root is now trivial: The snippet below sets the cwd to the parent of the
buffer that has a `.git` or `Makefile`.

```lua
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(ctx.buf)
		local root = vim.fs.root(ctx.buf, {".git", "Makefile"})
		if root then vim.uv.chdir(root) end
	end,
})
```
