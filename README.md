# Neovim configuration

## Requirement

- Git
- CMake
  > Used in [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- Deno
  > Used in [toppair/peek.nvim](https://github.com/toppair/peek.nvim)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
  > Used in [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [fd(Windows Powershell) or fd-find(Debian)](https://github.com/sharkdp/fd?tab=readme-ov-file#installation)
  > Used in [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [lazygit](https://github.com/jesseduffield/lazygit?tab=readme-ov-file)
  > Used in ["akinsho/toggleterm.nvim"](https://github.com/akinsho/toggleterm.nvim)

## Keymap

- Leader key: Space Key

| Key        | Mode          | function                                                 |
| :--------- | ------------- | -------------------------------------------------------- |
| gD         | Normal        | lsp.buf.declaration                                      |
| gd         | Normal        | lsp.buf.definition                                       |
| gK         | Normal        | lsp.buf.hover                                            |
| gi         | Normal        | lsp.buf.implementation                                   |
| gh         | Normal        | lsp.buf.signature_help                                   |
| gwa        | Normal        | lsp.buf.add_workspace_folder                             |
| gwr        | Normal        | lsp.buf.remove_workspace_folder                          |
| gwl        | Normal        | print(vim.inspect(vim.lsp.buf.list_workspace_folders())) |
| gt         | Normal        | lsp.buf.type_definition                                  |
| grn        | Normal        | lsp.buf.rename                                           |
| gca        | Normal        | lsp.buf.code_action                                      |
| gr         | Normal        | lsp.buf.references                                       |
| gf         | Normal        | lsp.buf.format({async=true})                             |
| ge         | Normal        | diagnostic.open_float                                    |
| [d         | Normal        | diagnostic.goto_prev                                     |
| ]d         | Normal        | diagnostic.goto_next                                     |
| gq         | Normal        | diagnostic.setloclist                                    |
| tt         | Normal        | split new terminal window in below                       |
| bn         | Normal        | Open next buffer                                         |
| bp         | Normal        | Open preview buffer                                      |
| <leader>h  | Normal        | Move above pane                                          |
| <leader>j  | Normal        | Move left pane                                           |
| <leader>k  | Normal        | Move right pane                                          |
| <leader>l  | Normal        | Move below pane                                          |
| gcc        | Normal        | Line comment toggle                                      |
| gbc        | Normal        | Block comment toggle                                     |
| gc         | Normal Visual | Line comment(Normal or Visual)                           |
| gb         | Normal Visual | Block comment(Normal or Visual)                          |
| <leader>n  | Normal        | Toggle file tree                                         |
| <leader>mp | Normal Visual | Formatt file or range                                    |
| <leader>ml | Normal        | Trigger linting for current file                         |
| <leader>ff | Normal        | find files                                               |
| <leader>fg | Normal        | live grep                                                |
| <leader>fb | Normal        | find buffer                                              |
| <leader>fh | Normal        | find help tags                                           |
| <leader>fn | Normal        | find notify                                              |
| <leader>w  | Normal        | Resize pane                                              |
| <leader>wo | Normal        | Zoom the window                                          |
| <leader>t  | Normal        | Create float terminal window                             |
| <leader>g  | Normal        | Create float lazygit window                              |
| <leader>xx | Normal        | Diagnostics                                              |
| <leader>xX | Normal        | Buffer Diagnostics                                       |
| <leader>cs | Normal        | Symbles                                                  |
| <leader>cl | Normal        | LSP Definitions / references / ...                       |
| <leader>xL | Normal        | Location List                                            |
| <leader>xQ | Normal        | Quickfix List                                            |

## Command

| Command   | Description                   |
| :-------- | ----------------------------- |
| PeekOpen  | Open markdown preview window  |
| PeekClose | Close markdown preview window |
| Neogen    | Create doxygen comment        |
