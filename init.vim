set nocompatible              			" we want the latest Vim settings

so ~/.config/nvim/plugins.vim

syntax enable

"let g:gruvbox_transparent_bg=1
let g:Powerline_colorscheme = 'solarized256'

"colorscheme desert
set background=dark
colorscheme gruvbox

let g:artline_theme = 'gruvbox'


" Note, the above line is ignored in Neovim 0.1.5 above, use this line instead.
set termguicolors

"autocmd VimEnter * hi Normal ctermbg=none

command! -nargs=0 Prettier :CocCommand prettier.formatFile

set mouse=a
let mapleader = "," 				"The default leader is \, but a comma is much better
set backspace=indent,eol,start
set number 					"Let's active line numbers
set autowriteall                                " Automatically write the file when switching
set cindent
set complete=.,w,b,u,t                     	"in default (t,i). Set our desired autocompletion matchin 

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
" enable copy/past
set clipboard=unnamedplus


nnoremap <space>q :Bdelete<CR>
nnoremap <space>bn :bnext<CR>

" Use alt + hjkl to resize windows
nnoremap <A-k> :resize -2<CR>
nnoremap <A-j> :resize +2<CR>
nnoremap <A-h> :vertical resize -2<CR>
nnoremap <A-l> :vertical resize +2<CR>

nnoremap <space>k :resize -2<CR>
nnoremap <space>j :resize +2<CR>
nnoremap <space>h :vertical resize -2<CR>
nnoremap <space>l :vertical resize +2<CR>



" Set the completefunc you can do this per file basis or with a mapping
set completefunc=tailwind#complete
" The mapping I use
nnoremap <leader>tt :set completefunc=tailwind#complete<cr>

" This will enable you to jump from, eg, a <div> to its </div>. Note that your
" cursor will have to be inside the angle brackets; if you're on the angle
" brackets, % will jump from one bracket to the other as normal.
runtime macros/matchit.vim



"---------------Search----------"
set hlsearch
set incsearch



"-------------Plugins----------"
"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'


"/
"/ ctags
"/
set tags=./tags;/


" --------------------------------------------------------
" SETTINGS START

set completeopt=longest,menuone

" SETTINGS END
" --------------------------------------------------------

" --------------------------------------------------------
" COC-VIM TAB SETTINGS START

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" COC-VIM TAB SETTINGS END
" --------------------------------------------------------


"/
"/ Tagbar
"/
nmap <F8> :TagbarToggle<cr>

"/
"/ Php namespace
"/
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>


"-------------Visuals----------"
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R




"-------------Split Management----------"
set splitbelow
set splitright

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l



hi vertsplit ctermfg=black ctermbg=black

set foldcolumn=0
"hi foldcolumn ctermfg=black
"hi LineNr ctermfg=blue
" ctermbg=bg


"-------------Mapping----------"

"make it easy to edit the Vimrc file"
nmap <Leader>ev :tabedit ~/.vimrc<cr>

"Add simple highlight removal
nmap <Leader>nh :nohlsearch<cr>



"-----------------Auto-Commands----------"
"Automatically source the Vimrc file on save"
augroup autosourcing
	autocmd!
	autocmd BufWritePost ~/config/nvim/init.vim source %
augroup END

" Explorer
 let g:coc_explorer_global_presets = {
 \   'tab': {
 \     'position': 'tab',
 \     'quit-on-open': v:true,
 \   },
 \   'floating': {
 \     'position': 'floating',
 \     'open-action-strategy': 'sourceWindow'
 \   },
 \   'floatingTop': {
 \     'position': 'floating',
 \     'floating-position': 'center-top',
 \     'open-action-strategy': 'sourceWindow',
 \   },
 \   'floatingLeftside': {
 \     'position': 'floating',
 \     'floating-position': 'left-center',
 \     'floating-width': 50,
 \     'open-action-strategy': 'sourceWindow',
 \   },
 \   'floatingRightside': {
 \     'position': 'floating',
 \     'floating-position': 'right-center',
 \     'floating-width': 50,
 \     'open-action-strategy': 'sourceWindow',
 \   }
 \ }
nmap <space>ed :CocCommand explorer<CR>
nmap <space>fd :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif


" Notes and Tips 
" - Press 'zz' to instantly center the line where the cursor is located
"   Press 'Ctrl+]' to go the function/class using ctags
" - Press 'ts' to select selected tags
" - Pres 'gt' to switch between tabs
"   Press <cs'"> (change surrounding ' with ")
"   Press <ds'> to delete surroinding single quotes
"   Press <dst> to delete surroingind tags
"   Pres 'Ctrl+n' for autocompletion
"   Press <Leader>+n to import classes (, + n)
