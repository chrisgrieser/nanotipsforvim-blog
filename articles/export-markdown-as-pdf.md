---
title: "Export Markdown as PDF"
date: 2022-11-03
cssclass: writing
tags: [shell, markdown, keymap, pandoc]
---

Since `:!` allows us to run any shell command from the vim cmdline, you run pandoc from inside vim to quickly export a markdown file with one keybinding. With pandoc and a [pdf-engine](https://pandoc.org/MANUAL.html#option--pdf-engine) installed, you can convert and open a markdown file as pdf with the following command:

```lua
-- requires pandoc & a pdf-engine (here: wkhtmltopdf)
-- add to the config folder: `nvim/after/filetype/markdown.lua`
vim.keymap.set("n", "<C-e>", ":!pandoc %:p --output=%:t:r.pdf --pdf-engine=wkhtmltopdf<CR>:!open %:t:r.pdf<CR><CR>", {buffer = true})
```
