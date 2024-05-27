---
tags: [config]
cssclass: writing
mdate: 2023-09-15T15:50
title: "Stop Yourself from Overnesting"
date: 2023-04-17
---

High levels of nesting a considered bad practice, and for good reason. But sometimes, you write code without paying attention to the indentation and only realize you nested too much when it's already done. However, we can easily configure vim to "warn" us about too much nesting, saving us from having to refactor our code later on.

This snippet simply colors all indentation higher than 4 levels in an appalling red that you cannot miss:

```lua
vim.cmd.highlight("Overnesting guibg=#E06C75")
vim.fn.matchadd("Overnesting", ("\t"):rep(5) .. "\t*")
```

Another somewhat funky option is to use vim's built-in `vartabstop` option, which allows you to set varying tabwidths (sic!). A small excerpt from the help-docs on the option:

```text
:set vartabstop=4,20,10,8

This will make the first tab 4 spaces wide, the second 20 spaces, 	the third 10 spaces, and all following tabs 8 spaces.
```

While you would have to be a true madman to use something like `varstop=4,20,10,8`, setting `vartabstop=4,4,4,4,8,12` might be reasonable to stop yourself from overnesting.
