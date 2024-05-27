---
tags: [zsh, shell, lsp, treesitter]
cssclass: writing
mdate: 2023-11-07T14:31
title: "Treesitter and LSP-support for zsh"
date: 2022-11-26
---

Some people prefer zsh over bash. However, using zsh has the problem that it has far less tooling-support: In contrast to bash, there is no Treesitter parser, no linter, and no LSP for zsh.

Even so, we can still get all that nice tools for zsh as well. Since bash and zsh are very similar, the language syntaxes are mostly identical, so most forms of syntax highlighting, linting, or intellisense that work in bash can in principle also work with zsh – we just have to force those tools to treat zsh files as bash files.

```lua
-- use bash-treesitter-parser for zsh
augroup("zshAsBash", {})
autocmd("BufWinEnter", {
	group = "zshAsBash",
	pattern = {"*.sh", "*.zsh"},
	command = "silent! set filetype=sh",
})

-- make bash-lsp work with zsh (nvim builtin-lsp)
require("lspconfig")["bashls"].setup{
	-- on_attach = ...,
	-- completion = ...,
	filetypes = {"sh", "zsh", "bash"},
}
```

The goto-linter for shell scripts, [shellcheck](https://www.shellcheck.net/), can also be forced to work with zsh by passing the argument `--shell=bash`. (Since shellcheck is integrated in the bash-LSP, and [a recent PR](https://github.com/bash-lsp/bash-language-server/pull/536) added `--shell=bash` as default option, there is no need to setup shellcheck in vim.)

---

## Update 2023-11-07
I managed to find a "cleaner" method, namely use vim's `vim.filetype.add` to tell vim to treat all `zsh` files as `sh` files:

```lua
-- make zsh files recognized as sh for bash-ls & treesitter
vim.filetype.add {
	extension = {
		zsh = "sh",
		sh = "sh", -- force sh-files with zsh-shebang to still get sh as filetype
	},
	filename = {
		[".zshrc"] = "sh",
		[".zshenv"] = "sh",
	},
}
```
