" Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
" Plug 'elmcast/elm-vim'
Plug 'lambdatoast/elm.vim'
Plug 'scrooloose/nerdtree'
Plug 'jszakmeister/vim-togglecursor'
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-rails'
Plug 'ervandew/supertab'
Plug 'ngmy/vim-rubocop'
Plug 'thoughtbot/vim-rspec'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'
Plug 'rust-lang/rust.vim'
Plug 'LunarWatcher/auto-pairs'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
call plug#end()

" General
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
set fillchars+=vert:\ 
let mapleader=" "
set number
set ignorecase
" set noswapfile
set completeopt=longest,menuone

" Gruvbox
set background=dark
colorscheme gruvbox

" Airline
let g:airline_left_sep= '░'
let g:airline_right_sep= '░'

" NerdTree
map <LEADER>f :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 24
let g:NERDTreeMinimalUI = 1
autocmd VimEnter * if (0 == argc()) | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:airline#extensions#syntastic#enabled = 0

" Elm
" let g:polyglot_disabled = ['elm']
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1

" Markdown
autocmd BufNewFile,BufRead *.md set spell | set lbr | set nonu
let g:markdown_fenced_languages = ['html', 'json', 'css', 'javascript', 'elm', 'vim']

" RuboCop

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>

let g:local_vimrc = [ '.vimrc_local' ]
call lh#local_vimrc#munge('whitelist', $HOME.'/ws')

function! Moc()
	"call inputsave()
	"let className = input('Enter classname: ')
	"call inputrestore()
	let fname = expand('%:t:r')
	let text1 = "#ifdef NOVA_CMAKE"
	let text2 = "#include \"moc_" . fname . ".cpp\""
	let text3 = "#endif"
	call append(line('.') -1, "")
	"call append(line('.') -1, text1)
	call append(line('.') -1, text2)
	"call append(line('.') -1, text3)
endfunction
nnoremap <C-m> :call Moc()<CR>

Plug 'dense-analysis/ale'
Plug 'bufbuild/vim-buf'
let g:ale_linters = {
\   'proto': ['buf-lint',],
\}
let g:ale_lint_on_text_changed = 'always'
let g:ale_linters_explicit = 1

" rust
syntax enable
filetype plugin indent on
