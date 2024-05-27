---
title: "Vertical Navigation – without Relative Line Numbers"
date: 2022-11-29
tags: [keymap, motion]
cssclass: writing
---

While there are plenty of commands for *horizontal* navigation in vim – `hlWwEeBbFfTt^0$` – the options for *vertical* navigation are far more limited: You have only `jkGgg` as basic movement.

The only other options you really have are `{`/`}` to navigate to the next/previous paragraph, `<C-d>`/`<C-u>` to go half a screen down, or enabling relative line numbers (`:set relativenumber`) to use `{count}j`/`{count}k` to navigate {count} lines down/up. However, all these have certain downsides in my view:
- With many blank lines, `{`/`}` gets inefficient, with few blank lines it is imprecise and even unpredictable when the next blank line is off-screen.
- `<C-d>`/`<C-u>` depends on the screen height, making it quite unpredictable when working with window managers, changing font size, or working on different displays (e.g., work and home setup having different screens).
- Using relative line numbers is more precise and more predictable but its requires, well, working with numbers. This means having to turn your look to the gutter at the left, and also reaching to the number row, which is far away from the home row.

My approach is therefore to add a new mapping:

```lua
vim.keymap.set("", "J", "6j")
vim.keymap.set("", "K", "6k")
-- shadows the built-in `J` and `K`, which therefore need to be remapped
```

First, this mapping is actually consistent with vim's logic of making `shift + {key}` be a modification of what `{key}` would do alone (in this case: amplification). Second, it is more predictable than `{`/`}` and `<C-d>`/`<C-u>`, since not dependent on blank lines or screen sizes. Third, if you compare the resulting movements with the equivalent `{count}j` movements, you will notive that in most cases, this takes you only three keypresses on the home row, which is in my opinion quicker than going to the number row and back. (Note that the `6` has been chosen deliberately – as opposed to `5` or `7`, it ensures that all movements up to 8 lines down require at most 3 key presses.)

```text
jj   ≙ 2j
jjj  ≙ 3j
Jkk  ≙ 4j
Jk   ≙ 5j
J    ≙ 6j
Jj   ≙ 7j
Jjj  ≙ 8j
Jjjj ≙ 9j
JJkk ≙ 10j
JJk  ≙ 11j
JJ   ≙ 12j
JJj  ≙ 13j
```

And lastly, you often do not really require to look at the gutter, since the lines you want to go down/up are either small enough to do without, or if they are large, you can make do with `JJJ…` for bigger leaps, followed by `j` or `k` for the precise positioning. As all keys are on the home row here, I find the occasional extra key presses to be almost negligible. This allows me to completely turn of line numbers, which saves precious screen real estate if you work with many splits, too.
