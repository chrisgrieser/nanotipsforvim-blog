---
title: "Obsidian Plugins for Vim Users"
date: 2023-02-24
tags: [Obsidian, plugins]
cssclass: writing
---

If you use Obsidian and are missing some features or plugins from vim, there are a plugins or methods to get the same (or at least a similar) experience in Obsidian as well. I hope this collection may prove useful to vim users coming to Obsidian.

## Vim Features
- Configuring keymaps: [vimrc support plugin](https://obsidian.md/plugins?id=obsidian-vimrc-support)
- Alternate File: [Grappling Hook](https://obsidian.md/plugins?id=grappling-hook)
- Highlighted Yank: [obsidian-vim-yank-highlight](https://github.com/kometenstaub/obsidian-vim-yank-highlight)
- Embedded Terminal: [Terminal-Plugin](https://obsidian.md/plugins?id=terminal)
- Relative Line Numbers: [this CSS Snippet from Shimmering Focus](https://github.com/chrisgrieser/shimmering-focus/blob/main/snippets/relative-line-numbers.css)
- Grep Search (Live Grep): [Another Quick Switcher](https://obsidian.md/plugins?id=obsidian-another-quick-switcher) (the ripgrep search command) or [Omnisearch](https://obsidian.md/plugins?id=omnisearch)
- Goto Symbol: [Quick Switcher++](https://obsidian.md/plugins?id=darlal-switcher-plus)
- Persistent Undos: [Obsidian Version History](https://obsidian.md/plugins?id=obsidian-version-history-diff) & [File recovery (Core Plugin)](https://help.obsidian.md/Plugins/File+recovery) (somewhat)
- Running External Commands: [Obsidian Shell Commands](https://obsidian.md/plugins?id=obsidian-shellcommands), or [Templater](https://obsidian.md/plugins?id=templater-obsidian) (following [this guide](https://medium.com/@gareth.stretton/obsidian-do-almost-anything-really-with-system-commands-b496ffd0679c))
- Advanced Folding: [Creases](https://obsidian.md/plugins?id=creases)
- `clipboard=unnamed`: [vimrc support plugin](https://obsidian.md/plugins?id=obsidian-vimrc-support)
- `<C-o>` / `<C-i>`: Works out of the box, but there are are also [Navigate Cursor History](https://obsidian.md/plugins?id=heycalmdown-navigate-cursor-history), or [the undocumented builtin hotkeys](https://codemirror.net/5/doc/manual.html#keymaps) `cmd-U` / `ctrl-U`
- Neovide's Cursor Animations: [Ninja Cursor](https://obsidian.md/plugins?id=ninja-cursor) or [Dashing Cursor](https://obsidian.md/plugins?id=obsidian-dashing-cursor)
- `scrolloff`: [Obsidian Scroll Offset](https://obsidian.md/plugins?id=obsidian-scroll-offset)
- `g;`: Workaround: use the vimrc plugin and add `nmap g; u<C-r>`
- `z=`: add `exmap contextMenu obcommand editor:context-menu` & `nmap z= :contextMenu`
- Remembering Cursor Position: [Remember Cursor Position](https://obsidian.md/plugins?id=remember-cursor-position)
- Skeletons: [Templates (Core Plugin)](https://help.obsidian.md/Plugins/Templates) or [Templater](https://obsidian.md/plugins?id=templater-obsidian)
- `j` and `k` in Reading View: [obsidian-vim-reading-view-navigation](https://github.com/kometenstaub/obsidian-vim-reading-view-navigation)

## Vim Plugins
- Fugitive / Neogit: [obsidian-git](https://obsidian.md/plugins?id=obsidian-git)
- vim-illuminate: [Dynamic Highlights](https://obsidian.md/plugins?id=obsidian-dynamic-highlights)
- Harpoon: [Grappling Hook](https://obsidian.md/plugins?id=grappling-hook)
- Telescope: [Another Quick Switcher](https://obsidian.md/plugins?id=obsidian-another-quick-switcher)
- Linters: [Linter](https://obsidian.md/plugins?id=obsidian-linter) (only `--fix`, no visual emphasizing)
- todo-comments: [Dynamic Highlights](https://obsidian.md/plugins?id=obsidian-dynamic-highlights)
- Zen Mode: [Focus Mode](https://obsidian.md/plugins?id=obsidian-focus-mode) or [ProZen](https://obsidian.md/plugins?id=obsidian-prozen) (or use my theme, [Shimmering Focus](https://github.com/chrisgrieser/shimmering-focus) 😉)
- Tabout: [Tabout](https://obsidian.md/plugins?id=tabout)
- vim-surround: [Smarter Markdown Hotkeys](https://obsidian.md/plugins?id=obsidian-smarter-md-hotkeys) (to a degree)
- Hop/Lightspeed/Leap: [Jump-to-link](https://obsidian.md/plugins?id=mrj-jump-to-link)
- better-gx: [Shukuchi](https://github.com/tadashi-aikawa/shukuchi)
- Diffview.nvim: [Obsidian Version History](https://obsidian.md/plugins?id=obsidian-version-history-diff) 
- ts-context-commentstring: [Obsidian-Contextual-Comments](https://github.com/1C0D/Obsidian-Contextual-Comments)
- lazy-loading of plugins: [Obsidian Plugin Manager](https://github.com/ohm-en/obsidian-plugin-manager)
- vim-visual-multi: [Advanced Cursors](https://obsidian.md/plugins?id=advanced-cursors)
- cmp-emoji: [Emoji Shortcodes](https://obsidian.md/plugins?id=emoji-shortcodes)
- cmp-buffer: [Various Complements](https://obsidian.md/plugins?id=various-complements)
- cmp-pandoc: [Citations](https://obsidian.md/plugins?id=obsidian-citation-plugin)
- Luasnip/vim-vsnip/Ultisnips: [Text Snippets](https://obsidian.md/plugins?id=text-snippets-obsidian)
- presence.nvim: [Discord Rich Presence](https://obsidian.md/plugins?id=obsidian-discordrpc)
- Aerial/Symbols-Outline: [Outline (Core Plugin)](https://help.obsidian.md/Plugins/Outline)
- projects / sessions: [Workspace (Core Plugin)](https://help.obsidian.md/Plugins/Workspaces) or [Workspaces Plus](https://obsidian.md/plugins?id=workspaces-plus)
- vim-markdown-toc: [Table of Contents](https://obsidian.md/plugins?id=obsidian-plugin-toc) or [Dynamic Table of Contents](https://obsidian.md/plugins?id=obsidian-dynamic-toc)