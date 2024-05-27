---
tags:
- keymap
- windows
cssclass: writing
mdate: 2023-08-23T15:46
title: "Easier Movement between Windows"
date: 2022-10-28
---

Since using `<C-w>j` and friends for moving between windows is a bit clunky, many people map the window movement directions to one key combination instead of a keychord, for example something like this:

```lua
vim.keymap.set("", "<C-j>", "<C-w>j")
vim.keymap.set("", "<C-k>", "<C-w>k")
vim.keymap.set("", "<C-h>", "<C-w>h")
vim.keymap.set("", "<C-l>", "<C-w>l")
```

However, having to choose one of four keymaps depending on your current window and the type of split for what is essentially one action – going to a different window – is still quite cumbersome.

Indeed, there is a far simpler method, which seems to be less known: `<C-w><C-w>` cycles between all windows, regardless of direction and current window. While `<C-w><C-w>` will be a bit tedious if you have a large screen with many splits, it's far easier to use than the directional window movements if you only have two or three windows.
