---
title: "Change Vim's Window Title for Window Managers and Text Expanders"
date: 2022-10-31
cssclass: writing
tags: [window-manager, text-expander, automation]
---

Many window managers or automation apps work by reading the window title of other apps, to apply filetype specific window layouts. For this purpose, it quite useful to have information like the path of the current file in the window title. Text expanders, too, could benefit from changing vim's window title, since disabling the window title, for example by disabling them when not in insert mode to prevent unintended expansions by using normal mode commands.

1. Enabling the `title` option makes vim modify the window title set by the Terminal or GUI.
2. `titlestring` defines what will be put into the window title.
3. `titlelen` sets the maximum length of window title and is by default 85. To ensure that file paths with more than 85 characters are still displayed without truncation, the length limit needs to be disabled by setting `titlelen` to 0.

```lua
-- full file path & vim mode in window title
vim.opt.title = true
vim.opt.titlelen = 0
vim.opt.titlestring='%{expand(\"%:p\")} [%{mode()}]'
```

The resulting window title then contains path and mode, which we can work with in third-party-apps:

```
/Users/pseudometa/.config/nvim/init.lua [n]
```

For example, the text expander [Espanso](https://espanso.org/) can be disabled while in normal mode, by saving the following snippet in your [espanso config path](https://espanso.org/docs/configuration/basics/#structure):

```yaml
# disable espanso while in normal or visual mode
filter_title: \[[nv]\]
enable: false
```


