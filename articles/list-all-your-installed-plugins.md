---
tags: [shell, plugins]
cssclass: writing
title: "List all your installed plugins"
date: 2023-07-26
---

Given that nvim users tend to have a lot of plugins, it can be useful to share plugin lists. Here is a short shell script to get a list of the repos of all plugins you have installed:

```bash
location_of_installed_plugins="$HOME/.local/share/nvim/lazy" 
cd "$location_of_installed_plugins" 
grep --only-matching --no-filename --max-count=1 "http.*" ./*/.git/config | sed 's/.git$//' | sort -i
```

You could also pipe it to `xargs open` and open all GitHub repos at once (if you have the RAM for that 😉).

Alternatively, if you use `lazy.nvim`, you can get the same result from inside nvim with this command:

```lua
:lua for _, v in pairs(require("lazy").plugins()) do print(v[1]) end
```

[And here you can check out a list of all plugins I have installed, if you are interested.](https://github.com/chrisgrieser/.config/blob/main/nvim/README.md#all-installed-plugins).