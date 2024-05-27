---
title: "Quick One-Off Macros"
date: 2022-11-04
cssclass: writing
tags: [macros, keymap]
---

Recording macros can a a bit of a slog, especially when you only want to quickly repeat a sequence of 2-3 commands. First, you type `qa` to record (into register `a`). Do you commands, and then `q` to stop recording. Then you play the recording via `@a` once, and for further repetitions you do `@@`. 

With neovim, at least the last part can be simplified, since there is [`Q` available for triggering the last recording made](https://neovim.io/doc/user/repeat.html#Q) (instead of the barely used [Ex Mode mapping in vanilla vim](https://vimhelp.org/intro.txt.html#Q)). But still, for convenience one might want to trigger a *quick, one-off* recording with just one keystroke, without having to think which register is still free. 

Mapping a key to `q{letter}` is also tricky, since `q{letter}` *starts* a recording, but only `q` is required to *stop* a recording, meaning you get an extra undesired keystroke triggered every time. So to achieve a one-key-recording-start, we have to modify the mapping while recording. Curiously, there is no "recording mode" in vim, so we have to rely on the vim.api.nvim_create_autocmd events ["RecordingEnter" and "RecordingLeave"](https://neovim.io/doc/user/vim.api.nvim_create_autocmd.html#RecordingEnter) to instead. The first vim.api.nvim_create_autocmd is also triggered by "VimEnter", to set the keybinding before a recording has been made. And purely as a safety net, we do not use `Q` to trigger the last recording for the quick one-off recording, but `@{letter}` to avoid accidentally triggering a different 
macro we may make.

```lua
vim.api.nvim_create_augroup("recording", {})
vim.api.nvim_create_autocmd({"RecordingLeave", "VimEnter"}, {
	group = "recording",
	callback = function() vim.keymap.set("n", "0", "qz") end
})
vim.api.nvim_create_autocmd("RecordingEnter", {
	group = "recording",
	callback = function() vim.keymap.set("n", "0", "q") end
})
vim.keymap.set("n", "9", "@z")
```

I personally have shadow-mapped this to `0` and `9`, since I barely use `0`, and also never use counts as high as 9; using `q` and `Q` might be more intuitive for others I assume. (I use `q` as the comment operator `gc`.)

Thanks to `@Craftidore` for inspiring this one. 😊