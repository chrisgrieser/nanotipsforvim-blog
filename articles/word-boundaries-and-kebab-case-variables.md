---
title: "Word Boundaries and kebab-case-variables"
date: 2022-10-31
cssclass: writing
tags: [css, word-boundaries, casing]
---

To change a variable name in vim, you would normally use `ciw`. This works well with most common casing conventions like snake case or camel case. In the case of kebab case, most commonly used in CSS, this only changes *part* of the variable:

```
MY_AWESOME_VARIABLE    → | 
myAwesomeVariable      → |
--my-awesome-variable  → --my-|-variable
```

The reason for this is that words in vim (and elsewhere) are commonly delimited by the boundary between word-characters and non-word-characters, and `_` does count as a word-character, while `-` (dash) does not. (You can also observe this behavior when double clicking a word in for example the browser.)

Luckily, vim allows us to change the characters that are regarded as word-characters via the `iskeyword` option. There, we can simply append `-`, and then kebab-case-variables and variables with other naming conventions will be affected consistently by commands like `ciw`.

```lua
-- treat `-` as word-character (globally)
vim.opt.iskeyword = vim.opt.iskeyword + {"-"}
```

Note, however, that this affects any vim command that is based on word boundaries, like the motions `w`, `e`, and `b` or the text objects `iw` and `aw`. Therefore, you might want change the `iskeyword` option *only* for CSS files. You can do so by saving the following line in your filetype-specific configuration for CSS (`nvim/after/filetype/css.lua`):

```lua
-- to only affect css files
-- saved in config folder: `nvim/after/filetype/css.lua`
vim.cmd("setlocal iskeyword+=-")
```
