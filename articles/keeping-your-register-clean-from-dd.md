---
title: "Keeping your register clean from `dd`"
date: 2023-01-05
tags: [keymap, registers]
cssclass: writing
---

One of the most common mappings is to map various operators like `x` to `"_x`, always copy to the [black-hole-register](https://neovim.io/doc/user/change.html#quote_) to prevent them from filling up your register or system clipboard:

```lua
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "c", '"_c')
```

But other than `x` or `c`, there is also another candidate that regularly fills your register with content you do not actually want there, namely `dd`: you want to move some text, and after deleting (cutting) some text, you notice that you now have too many blank lines. So you `dd` the blank line, go to your desired location, press `p` and notice that you are only inserting a blank line instead of the actual content you wanted to move. 

Now you can of course use `"1p` to paste text you copied before the deletion of the blank line, but this is nevertheless an annoyance. When you `dd` an empty line, in 99% of the cases, you do not intend to paste that empty line later on. So how about deleting to the black hole register again?

```lua
vim.keymap.set("n", "dd", '"_dd')
```

While such a mapping does work, it has the rather unindented side effect that *all* `dd`s are affected, so you also loose the ability to delete (cut) a single line. The solution to this annoyance is to create a conditional mapping: you want to delete to the black hole register when on an empty line, but delete to your regular register when not on an empty line. We can achieve this with the [map-argument `expr`](https://neovim.io/doc/user/map.html#%3Amap-arguments).

```lua
vim.keymap.set("n", "dd", function ()
	if vim.fn.getline(".") == "" then return '"_dd' end 
	return "dd"
end, {expr = true})
```

`expr` essentially tells vim that the left-hand-sight (3rd argument) should be treated as an expression and not as a function returning some string. That way, `expr` saves us from the trouble of writing a function that emulates deletion behavior, and let's us nicely solve the issue with only two lines of code.