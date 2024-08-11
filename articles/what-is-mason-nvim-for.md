---
title: What is mason.nvim for?
date: 2024-08-11T00:00:00.000Z
tags:
  - plugins
---
*A brief explainer I originally wrote in a hackernews comment.*

As opposed to being a plugin manager,
[mason.nvim](http://github.com/williamboman/mason.nvim) is a package manager. It
installs editor-agnostic tools like LSPs, linters, or formatters.

As opposed to system-level package managers like homebrew, mason is specifically
integrated in nvim. Other than having a UI inside nvim, this entails features
such as auto-installing packages when bootstrapping nvim on a new machine.

As opposed to language-specific package managers such as npm or pip, mason
includes packages across languages. That means instead of having to install one
tool with npm, one with cargo, one with pip etc., you can install all your
nvim-related packages just with mason.

While a plugin manager is basically a necessity, mason is more of a nice-to-have
tool for nvim. It is convenient for some people, while others prefer using their
existing package managers.
