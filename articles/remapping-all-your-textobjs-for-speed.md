---
title: "Remapping all your textobjs for speed"
date: 2023-03-03
tags: [keymap, textobjs]
cssclass: writing
---

While text objects are a fantastic feature, I always found that many of them are a bit slow to type.

```vim
da}
ci"
daW
```

With the exception of `iw`/`aw` (a word) and `is`/`as` (a sentence), text object commands take up three keystrokes, one of them being on the number row *and* requiring `shift` as additional modifier. I personally follow the philosophy that a keymap's distance to the home row (and the number of modifier keys needed) should correlate with the frequency with which you use it. All things being equal, commands should be close to the home row and not require any modifiers.

Interestingly, there in one notable exception in vim, namely the bracket text object `ab` / `ib`. Basically, `ab` and `ib` are synonyms for `a)` and `i)`, but without the need to press a `shift`, and one row closer to the home row. And even though `a)` is easier to remember at first due to the second character literally being a bracket, "b" is actually a solid mnemonic for "bracket". So why create such mappings for the other text objects as well?

```lua
vim.keymap.set("o", "ar", "a]") -- [r]ectangular bracket
vim.keymap.set("o", "ac", "a}") -- [c]urly brace
vim.keymap.set("o", "am", "aW") -- [m]assive word
vim.keymap.set("o", "aq", 'a"') -- [q]uote
vim.keymap.set("o", "az", "a'") -- [z]ingle quote
```

Granted, some of the mnemonics are a bit odd, but for me they work nonetheless. 