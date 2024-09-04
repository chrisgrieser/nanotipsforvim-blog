---
title: A bare bones modern nvim config
date: 2024-09-04T00:00:00.000Z
tags:
  - kickstart
  - plugins
  - config
---

<!-- vale Google.FirstPerson = NO -->

This is a bare-minimum config to get started with your own nvim config. There is
also the excellent [kickstart.nvim](http://github.com/nvim-lua/kickstart.nvim),
but for the sake of simplicity and seeing "just the bare bones" of a modern nvim
config, I wanted to share this more minimal config. This config is meant for
people who already know lua and how to use and configure nvim, but haven't quite
made the jump to their own config yet.

This config includes:

1. a plugin manager (lazy.nvim)
2. LSPs (in this case `lua_ls` and `tsserver`)
3. auto-completions for the LSPs
4. Treesitter for syntax highlighting

Everything is bootstrapped, meaning lazy.nvim, LSPs, and treesitter parsers
are automatically installed on the first run.

**Usage**  
1. Save the code below as: `~/.config/nvim/init.lua` (macOS) or
`$XDG_CONFIG_HOME/nvim/lua/init.lua` (Linux)
2. Run `nvim` in your terminal.

```lua
-- Bootstrap the plugin mananager (lazy.nvim)
-- copypasted from: https://lazy.folke.io/installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

--------------------------------------------------------------------------------

local myPlugins = {
	{ -- install LSPs
		"williamboman/mason.nvim",
		opts = {},
		dependencies = {
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim", -- auto-install capability
				opts = {
					ensure_installed = {
						"lua_ls",
						"tsserver",
						-- add other LSPs here, find the names here: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
					},
					run_on_start = true,
				},
			},
			"williamboman/mason-lspconfig.nvim", -- make mason & lspconfig work together
		},
	},
	{ -- auto-setup LSPs
		"neovim/nvim-lspconfig",
		config = function()
			-- enable completions via nvim-cmp
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			-- run this for each LSP
			require("lspconfig").lua_ls.setup({
				capabilities = capabilities,
				settings = {},
			})
			require("lspconfig").tsserver.setup({
				capabilities = capabilities,
				settings = {},
			})
		end,
	},
	{ -- Completion Engine
		"hrsh7th/nvim-cmp",
		dependencies = "hrsh7th/cmp-nvim-lsp", -- make cmp work with LSPs
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- tell cmp to use LSPs for completion
				}),
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
				}),
			})
		end,
	},
	{ -- Syntax Highlighting
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			auto_install = true, -- auto-install missing parsers when entering buffer
			highlight = { enable = true },
		},
	},
}

--------------------------------------------------------------------------------
-- tell lazy to load the plugins
require("lazy").setup({
	spec = myPlugins,
})
```
