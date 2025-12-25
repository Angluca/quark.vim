#### Vim plugin for quark language
https://github.com/quark-programming/quark
```sh
export QUARK_ROOT=~/Quarks/quark
export PATH=$PATH:$QUARK_ROOT
```
```vim
Plug 'angluca/quark.vim'
```
Set lsp if you want
```vim
Plug 'yegappan/lsp'

au filetype quark call LspAddServer([#{
            \    name: 'quark-lsp',
            \    filetype: ['quark'],
            \    path: 'clangd',
            \  }])
```

