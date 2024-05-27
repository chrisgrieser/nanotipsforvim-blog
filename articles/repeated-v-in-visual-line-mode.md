---
title: "Repeated V in Visual Line Mode"
date: 2022-11-11
cssclass: writing
tags: [keymap, visual-mode]
---

Part of vim's keybinding philosophy is to use the easy-to-press keybindings for the common operations. That is why you can use `dd` instead of using the lesser known whole-line-text-object `_` and pressing `d_`.

For Visual Line Mode, I found that the by far most common task I perform is to expand the selection one line down. The default keychord for that is `Vj` (or `Vjj` for three lines and so one). This isn't an inconvenient keychord, but same as `d_` there could still be a *better* one.

In the spirit of assigning the most frequent task to a repeated keypress, I found mapping `V` to `j` very pleasant. It enables us to use `VV` for two lines, `VVV` for three lines, and so on. While the number of keystrokes stays the same, it reduces mental overhead (the number of `V`s to press is the number of lines you want), and saves us the trouble using a second key and also releasing the shift key. It's seems minor at first, but same as with `dd` or `d_`, it makes a difference when you do it very frequently.

```lua
vim.keymap.set("x", "V", "j")
```

*Caveat:* You cannot use `V` anymore to exit visual line mode, so you have to use `<Esc>` for that. Moreover, since vim mappings do not distinguish between Visual Mode and Visual Line Mode, you cannot use `V` to switch to visual line mode from visual mode. However, I personally find both drawbacks to be negligible.