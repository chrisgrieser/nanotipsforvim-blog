---
title: "Why Use Snippets?"
date: 2023-02-03
tags: [snippets, automation]
cssclass: writing
---

Since I [unintentionally wrote a small blogpost on reddit](https://www.reddit.com/r/neovim/comments/10s1mpm/what_are_your_favorite_uses_of_customsnippets/), I thought I might as well copypaste it here for my blogreaders.

**Use case 1: Boilerplate**  
Some languages have more boilerplate than another. Out of all languages, I have the largest amounts of snippets for shell, and not by chance.

For example, the code to check if a CLI is installed is this:
```bash
if ! command -v ${1:cli} &>/dev/null; then 
  echo "${1:cli} not installed." 
  exit 1
fi"
```

Since I have many small utility shell scripts and work on multiple devices, this simple guard clause is quite useful, and it's just too slow to manually type it all.

**Use case 2: hard to memorize code**  
Again, shell serves as prime example since it has quite a few things that are just hard to remember. Best example: Escape codes to change the color of terminal output.

```bash
\033[1;33m # yellow
```

typing it does not take that long, but remembering the thing – especially if you don't use it often – is quite cumbersome. With snippets, I just type "yel…" or "blu…" or "gre…" and get a suggestion for the escape code of the color I want.

**Use case 3: Saving keystrokes for very common code**  
Even with non-boilerplate, there are many cases where you do type the same thing over and over again. For example the `then` in lua. In many cases, when you type `then`, you type `<CR><CR>end`, followed by `<Esc>ki<Tab>`, to position your cursor inside the if clause. That's 13 keystrokes total. With a simple snippet, I can automate all that and only have to type `the<CR>`. That's 4 keystrokes. Saving 9 keystrokes really isn't much, but considering how often you type if clauses, it adds up over time. [Relevant xkcd](https://www.xkcd.com/1205).