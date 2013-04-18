Vim
===

Navigation
----------

- Tabs
  * `tt`: New tab
  * `tn`: Move to next tab
  * `tp`: Move to previous tab
  * `tm`: Move current tab to a specific position
  * `tl`: Toggle TabMan
  * `tf`: Focus TabMan

- Windows
  * `:s`: Split horizontally
  * `:vs`: Split vertically
  * `Ctrl+<hjkl>`: Navigate through windows
  * `Ctrl+W T`: Break out current window into a new tabview
  * `Ctrl+W o`: Close every window in the current tabview but the current one

- TagBar
  * `F4`: TagbarToggle

Search
------

- `,e`: Open file with recursive and fuzzy file name matching. And allows you to open the selected file on a new tab with `Ctrl-t`
- `,g`: Fuzzy symbol finder  (classes, methods, variables, functions, ...) on the current file
- `,f`: Fuzzy text finder on all the opened files
- `,R`: RecurGrep
- `,r`: RecurGrepFast
- `/`: Search in current file
- [Search and replace](http://vim.wikia.com/wiki/Search_and_replace)

Copy and Paste
--------------

- `:set paste` Set paste mode (it wont break indentation)
- `:set nu!` Hide line numers (so you can copy with `Ctrl + c`)

WIP
---
This is not ready yet.
