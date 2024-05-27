---
title: "Neovim as IDE"
date: 2023-01-13
tags: [IDE, plugins]
cssclass: writing
---

Neovim without plugin is not much more than a simple text editor with vim movements. The way to give neovim "IDE powers" is to set up a system of plugins. I'd say it's about 20 plugins you need to be able to use neovim on the level of an IDE. This can be quite overwhelming at first, but there are some great starting points which help you set everything up swiftly:
- [0 to LSP : Neovim RC From Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE&t=1s) using [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim) 
- [Effective Neovim: Instant IDE](https://www.youtube.com/watch?v=stqUbv-5u2s) using [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) or

The setup is far more modular than with apps like VS Code, but the advantage is that you can customize everything exactly to your needs. After the core setup you get from kickstart or lsp-zero (LSP, completion, and snippets), you might wanna look up various plugins add extra capabilities you might be familiar with from IDEs, depending on what features you like: 
- gitsigns.nvim (signs & hunk interaction)
- neogit (git client)
- diffview.nvim (git merges / file history)
- ChatGPT.nvim (AI support)
- ToggleTerm (embedded terminal)
- SSR (structural search and replace)
- Refactoring.nvim (Refactoring)
- nvim-dap (debugger)
- vim-visual-multi (multiple cursors)
- null-ls (integration of linters and formatters)
- neotest (unit testing) 

And then comes the fun stuff, plugins which offer capabilities that have no equivalent in classic IDEs:
- UndoTree (browsing undo history)
- nvim-various-textobjs (my own <3)
- Harpoon (file switching in big projects)
- Telescope (fuzzy find anything)
- vim-matchup (quick movement to corresponding things)
- surround.nvim (surrounding text with brackets/quotes)
- …

I'd say you need about 30 plugins to get all the IDE features you already know, and with ~40-50 plugins you have an editor experience that surpasses what other code editors have to offer. And when you end up with 70+ plugins, you are basically coding in God mode. 😂