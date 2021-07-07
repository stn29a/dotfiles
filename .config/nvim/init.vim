source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/general/settings.vim

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'dracula/vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

colorscheme gruvbox
lua require'colorizer'.setup()
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
