---
title: "Inspect neovim's Lua Objects"
date: 2022-11-15
cssclass: writing
tags: [config]
---

When writing your neovim config, you sometimes might want to inspect the value of a variable or object. Using `:echo` is not very useful, if you use lua. Lua's `print` statement comes to mind, but it only works on primitive types, with tables you simply get a useless output such as `table 0x0193eer56`. For those cases, there is [`vim.pretty_print`](https://neovim.io/doc/user/lua.html#vim.pretty_print()) to inspect the content in human-readable format. However, typing `:lua vim.pretty_print (…)` all the time is quite tedious. Putting `pp = vim.pretty_print` into our config helps somewhat, but it's still quite a bit to type: `:lua pp()`.

So why not create our own vim command? We can use `:command` to register our own command, and let it run a function of our choice, passing the argument from the vim command line to that function (even without needing to use parenthesis). In that function, we accept an object and use `pretty_print`, wrapped in `luaeval`, because `:command` passes the argument as a string instead of the expression. The final result is a small four-liner to put somewhere into our config:

```lua
cmd [[:command! -nargs=1 I lua inspectFn(<f-args>)]]
function inspectFn(obj)
	vim.pretty_print(fn.luaeval(obj))
end
```

Now we can just run `:I obj` instead of `:lua vim.pretty_print(obj)`. Much more convenient.