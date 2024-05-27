---
title: "Motion Setup: HJKL as amplified hjkl"
date: 2023-03-31
tags: [motion, keymap]
cssclass: writing
---

Generally speaking, using `shift` modifies an existing vim command in some way:
- the command is amplified (`i`/`I`, `e`/`E`, …)
- the direction of the command is reversed (`p`/`P`, `n`/`N`, `o`/`O`, …)
- an "alternative" mode of the command is used (`v`/`V`, `r`/`R`, …) 

There are only a few exceptions to this rule of thumb, and out of all keys, it is `hjkl` that violate that rule. While `hjkl` moves the cursor, their uppercase variants join lines, open man pages, or scroll the screen. Even worse, while `hl` move on the *horizontal* axis, `HL` scrolls on the *vertical.*[^1] Especially with `hjkl` being central vim motions, this has bummed me quite a bit.

So what I do is remap `HJKL` to make them comply with the rule of amplification, making those four keys move a bigger distance in the same direction than their lowercase counterparts:

```lua
-- HJKL as amplified versions of hjkl
vim.keymap.set("n", "J", "6j")
vim.keymap.set("n", "K", "6k")
vim.keymap.set("n", "H", "0^")
vim.keymap.set("n", "L", "$")
```

[I have explained my reasoning for why I think `6` is a good count earlier](https://nanotipsforvim.prose.sh/vertical-navigation-–-without-relative-line-numbers), but in my view, any count or even `{`/`}` would work to make `J` and `K` more consistent with `j` and `k`. (Note that I do map `H` to `0^` as opposed to `^`, as this ensures that you fully scroll to the right, you are on a long line that also has a high indentation.)

Now, what obviously we loose access to the original functions of `HJKL`. However, this can easily be solved by the `scrolloff` option and two remappings:

```lua
vim.opt.scrolloff = 15 -- no more need for HML keys
vim.keymap.set("n", "M", "J") -- mnemonic: [M]erge
vim.keymap.set("n", "<leader>h", "K") -- mnemonic: [h]over
```

Using `scrolloff` essentially combines cursor and scroll movement, making the use of `HL` to scroll up/down unnecessary. Even more, it also frees up `M`, which we can use to map the original `J` to; this works well, since just use a synonym as mnemonic (`J`oin → `M`erge). 

This mapping of `HJKL` not only is more intuitive, but places the base cursor movements to the resting position of the home row, which makes far more sense than `^` and `$` being located far away in the 

[^1]: The use of the vertical axis is probably due to "high-middle-low" being a mnemonic for `HML`.
