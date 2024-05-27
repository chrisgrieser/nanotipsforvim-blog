---
title: "use cursorcolumn to help you learn gm"
date: 2023-03-03
tags: [keymap]
cssclass: writing
---

I recently stumbled upon `gm`, an apparently lesser known command for horizontal movement. `gm` positions your cursor in the middle of the window width. It's a bit of an odd motion, but the fact it's so different from other vim motions sparked my curiosity, so I wanted to give it a try.

My first stumbling block was that it's a bit hard to anticipate where exactly your cursor will land. So I thought, why not let vim help me in learning this new vim motion? Since `gm` is dependent on the width of you window, we can determine the column the cursor will land on by using `winwidth` and dividing it by two. That number we can then use as a `colorcolumn`. The result is a nice and very clear visual indicator where `gm` will move us to.

```lua
local gmColumn = math.floor(fn.winwidth("%") / 2) 
vim.opt.colorcolumn = gmColumn
```

If you already use `colorcolumn` to indicate your preferred line length (e.g. `colorcolumn=80`), you can still use this trick, since `colorcolumn` actually also accepts a list of columns, resulting in two colored columns:

```lua
vim.opt.colorcolumn = {gmColumn, 80}
```

One caveat of this solution is that `gmColumn` is only calculated once at startup, so if you use vertical splits, your `colorcolumn` will be off. However, that can be fixed by changing the `colorcolumn` using an [autocommand triggered on `VimResized`](https://neovim.io/doc/user/autocmd.html#VimResized).