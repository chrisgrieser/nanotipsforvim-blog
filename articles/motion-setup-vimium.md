---
tags: [motion, keymap, vimium]
mdate: 2024-01-10T16:15
title: "Motion Setup: Vimium"
date: 2023-06-20
cssclass: writing
---

The default [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb)[^1] bindings are meant to resemble their vim-counterparts as closely as possible, which helps with learning them if you are coming from vim. However, taken for itself, these defaults are not great: the default keymaps often tend to map common actions to key sequences even though there are many unused keys. For instance, "Goto Next Tab" is bound to `gt` like in vim, even though the action is so common in the browser that it warrants a single key.

Similar to my [Motion Setup regarding hjkl](https://nanotipsforvim.prose.sh/motion-setup--hjkl-as-amplified-hjkl), I experimented with keybindings and came up the following core mappings which I am very happy with. The basic idea is to assign all common actions to a single home row keys, using vim's `hjkl` for controlling the page with the right hand, and `wasd` commonly known from PC-gaming for controlling tabs with the left hand.

```vim
" right: hjkl – Page Control
map j scrollDown
map k scrollUp
map h goBack
map l goForward

" left: wasd – Tab Control
map a previousTab
map d nextTab
map s copyCurrentUrl

map w removeTab
map q closeTabsOnLeft
map e closeTabsOnRight
```

You can find [my full vimium-c config here](https://github.com/chrisgrieser/.config/blob/9fb7bea009be951f9676ef52634a7d12d9717953/%2B%20browser-extension-configs/vimium-c-settings.json), if you are interested.

[^1]: Actually, I do use the Vimium fork [Vimium C](https://chrome.google.com/webstore/detail/vimium-c-all-by-keyboard/hfjbmagddngcpeloejdejnfgbamkjaeg), so some command names may differ slightly.
