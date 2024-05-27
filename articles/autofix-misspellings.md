---
title: "Autofix Misspellings"
tags: 
- prose
- spellcheck
- keymap
date: 2022-10-27
cssclass: writing
---

`z=` gives you spell suggestions for the word under the cursor. Prefixing it with a number auto-selects one of those suggestions. That means `1z=` will automatically fix the word under the cursor by applying the most likely correction. 

Since `1z=` is a bit cumbersome to type, I remapped it to something like `za` (for consistency with `zg` to add a word to your spellcheck dictionary). A nice workflow for spellchecking is to use `]s` to go the next misspelling, and `za` to autofix it.

```lua
vim.keymap.set("n", "za", "1z=") -- fix word under cursor
```

`1z=` also works when `spell` is off. 

*Bonus:* You could even create a small macro with `]s` and `1z=` to autofix all misspellings in a given file. 