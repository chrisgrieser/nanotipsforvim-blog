---
tags: [shell]
mdate: 2023-12-29T01:43
title: "View Source Code of Websites in vim"
date: 2023-06-22
cssclass: writing
---

I wanted to check out the HTML source of a website, and while the terminal or the browser Dev Tools do work, they just aren't as powerful as vim when it comes to exploring larger amounts of code.

Being able to run shell commands from vim's command line via `:!` solves this problem pretty easily, though. Just run this short one-liner and the source code is there in vim to inspect.

```bash
:.!curl -s "https://example.com/"
```

Now you not only got your routinized key bindings, but also all the tools like [navic](https://github.com/SmiteshP/nvim-navic) or [fold-cycle](https://github.com/jghauser/fold-cycle.nvim) that help with exploring large files.
