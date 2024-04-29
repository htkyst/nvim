# Neovim configuration

## Requirement

- Git
- CMake
  > Using [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- Deno
  > Using [toppair/peek.nvim](https://github.com/toppair/peek.nvim)
- ripgrep, fd
  > Using telescope
- lazygit
  > Using lazygit window

## Keymap

- Leader key: <Space>

| Key        | Mode          | group        | function                                                 |
| :--------- | ------------- | ------------ | -------------------------------------------------------- |
| gD         | Normal        | Built in LSP | lsp.buf.declaration                                      |
| gd         | Normal        | Built in LSP | lsp.buf.definition                                       |
| gK         | Normal        | Built in LSP | lsp.buf.hover                                            |
| gi         | Normal        | Built in LSP | lsp.buf.implementation                                   |
| gh         | Normal        | Built in LSP | lsp.buf.signature_help                                   |
| gwa        | Normal        | Built in LSP | lsp.buf.add_workspace_folder                             |
| gwr        | Normal        | Built in LSP | lsp.buf.remove_workspace_folder                          |
| gwl        | Normal        | Built in LSP | print(vim.inspect(vim.lsp.buf.list_workspace_folders())) |
| gt         | Normal        | Built in LSP | lsp.buf.type_definition                                  |
| grn        | Normal        | Built in LSP | lsp.buf.rename                                           |
| gca        | Normal        | Built in LSP | lsp.buf.code_action                                      |
| gr         | Normal        | Built in LSP | lsp.buf.references                                       |
| gf         | Normal        | Built in LSP | lsp.buf.format({async=true})                             |
| ge         | Normal        | Built in LSP | diagnostic.open_float                                    |
| [d         | Normal        | Built in LSP | diagnostic.goto_prev                                     |
| ]d         | Normal        | Built in LSP | diagnostic.goto_next                                     |
| gq         | Normal        | Built in LSP | diagnostic.setloclist                                    |
| tt         | Normal        | Terminal     | split new terminal window in below                       |
| bn         | Normal        | Buffer       | Open next buffer                                         |
| bp         | Normal        | Buffer       | Open preview buffer                                      |
| <leader>h  | Normal        | Window       | Move above pane                                          |
| <leader>j  | Normal        | Window       | Move left pane                                           |
| <leader>k  | Normal        | Window       | Move right pane                                          |
| <leader>l  | Normal        | Window       | Move below pane                                          |
| gcc        | Normal        | Comment      | Line comment toggle                                      |
| gbc        | Normal        | Comment      | Block comment toggle                                     |
| gc         | Normal Visual | Comment      | Line comment(Normal or Visual)                           |
| gb         | Normal Visual | Comment      | Block comment(Normal or Visual)                          |
| <leader>n  | Normal        | File tree    | Toggle file tree                                         |
| <leader>mp | Normal Visual | Formatter    | Formatt file or range                                    |
| <leader>ml | Normal        | Linter       | Trigger linting for current file                         |
| <leader>ff | Normal        | Fuzzy finder | find files                                               |
| <leader>fg | Normal        | Fuzzy finder | live grep                                                |
| <leader>fb | Normal        | Fuzzy finder | find buffer                                              |
| <leader>fh | Normal        | Fuzzy finder | find help tags                                           |
| <leader>fn | Normal        | Fuzzy finder | find notify                                              |
| <leader>w  | Normal        | Window       | Resize pane                                              |
| <leader>t  | Normal        | Window       | Create float terminal window                             |
| <leader>g  | Normal        | Window       | Create float lazygit window                              |

## Command

| Command   | Description                   |
| :-------- | ----------------------------- |
| PeekOpen  | Open markdown preview window  |
| PeekClose | Close markdown preview window |
| Mason     | LSP manager                   |
| Neogen    | Create doxygen comment        |
