#### Vim plugin for quark language
https://github.com/quark-programming/quark  

Install using [vim-plug](https://github.com/junegunn/vim-plug) and [clangd](https://github.com/clangd/clangd/releases)
```vim
Plug 'angluca/quark.vim'
Plug 'yegappan/lsp'

au filetype quark call LspAddServer([#{
            \    name: 'quark',
            \    filetype: ['quark'],
            \    path: 'clangd',
            \  }])
```

Save PATH to `.zshrc`  
```sh
export QUARK_ROOT=~/Quarks/quark
export PATH=$PATH:$QUARK_ROOT
```
You can use `:make`` easy compile qk

