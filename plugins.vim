filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-vinegar'

Plugin 'sbdchd/neoformat'

Plugin 'kien/ctrlp.vim'

Plugin 'preservim/tagbar'

Plugin 'morhetz/gruvbox'


Plugin 'ludovicchabant/vim-gutentags'

" Track the engine.
Plugin 'sirver/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'


Plugin 'tpope/vim-surround'
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'

Plugin 'mrdotb/vim-tailwindcss'
Plugin 'Lokaltog/vim-powerline'
Plugin 'posva/vim-vue'

" use [ gcc ] to commentary
Plugin 'tpope/vim-commentary'

 " Buffer Bye for Vim
Plugin 'moll/vim-bbye'

Plugin 'neoclide/coc.nvim', {'branch': 'release'}

Plugin 'leafOfTree/vim-vue-plugin'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
