---
title: "Esc in Normal Mode"
tags: 
- search
- keymap
date: 2022-10-27
cssclass: writing
---

`Esc` is actually not mapped in Normal Mode, which is a bit of a waste for a key located in such a prime spot. I found mapping it to `:nohl` to be quite intuitive, since in other apps, `Esc` ends searches and/or highlights. 

In addition, I also add `:echo`. Without an argument, `:echo` simply clears the cmdline, which fits nicely with the removal of highlights.

```lua
vim.keymap.set("n", "<Esc>", ":nohl<CR>:echo<CR>")
```
