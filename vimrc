"//		vim setting and tips		//


" set backspace=indent,eol,start
set encoding=utf-8 "Set character code as UTF-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8 "Set reading code
set fileencoding=utf-8 "Set character code as UTF-8 in writing"
set fileformats=unix,dos,mac
set noswapfile  " No make swap file
set nobackup " No make backup file
highlight Normal ctermbg=none
set guioptions+=a "Yank clipboard"
" autocmd BufWritePre * :%s/\s\+$//ge "Delete wasted space at end of line

:"::::::::::::::::::::::::::::::::::
"::::::::::display setting
set number "行数を表示"
set ruler "ステータスラインに行数を表示 "
set cursorline "カーソル業をハイライトする"
set showmatch "対応する括弧をハイライトする"
set showcmd "入力中のコマンドを表示する"
set showmode "現在のモードを表示する"
set scrolloff=3 "N行余裕を持たせてスクロール"
set laststatus=2 "ステータスラインを常に表示"
set notitle "エディタの編集タイトルを表示しない"


":::::::::::::::::::::::::::::::::::::
"::::::::::search setting
set hlsearch
set ignorecase
set smartcase
set incsearch
" Delete highlight
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

"::::::::::::::::::::::::::::::::::::::
"::::::::::indent setting
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent


"::::::::::::::::::::::::::::::::::::::
"::::::::::indent autoComplete
set wildmenu
set wildmode=list:full

"::::::::::::::::::::::::::::::::::::::
"::::::::::Key Map
inoremap <silent> <ESC><ESC> <ESC>
inoremap <silent> fff <ESC>
inoremap <silent> っっｆ <ESC>

" 入力モードでのカーソル移動
" inoremap <S-j> <Down>
" inoremap <S-k> <Up>
" inoremap <S-h> <Left>
" inoremap <S-l> <Right>

" ノーマルモード時だけ ; と : を入れ替える(US配列に打ちやすさを考慮)
nnoremap ;; :


"::::::::::::::::::::::::::::::::::::::
"::::::::::setting dein vim
" pluginThinkTank: https://vimawesome.com/

if &compatible
    set nocompatible
endif
set runtimepath^=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

" ===== dein install =====
call dein#begin(expand('$HOME/.vim/dein'))
call dein#add('Shougo/dein.vim')
" ===== plugins =====
call dein#add('scrooloose/nerdtree')
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('itchyny/lightline.vim')
call dein#add('Townk/vim-autoclose')
call dein#add('honza/vim-snippets')
call dein#add('tpope/vim-fugitive') " Git wrapper so awesome
call dein#add('ujihisa/neco-look') " Auto complete english word
call dein#add('rhysd/accelerated-jk') " Accelerate 'j' 'k' command
call dein#add('tomtom/tcomment_vim') " comment out command:gcc
call dein#add('Vimjas/vim-python-pep8-indent') " PEP8 indent
call dein#add('easymotion/vim-easymotion') " cursor accelerate

call dein#add('joshdick/onedark.vim') " Colorscheme
" ============================================================
call dein#end()

" Colorscheme
colorscheme onedark

syntax on

" Install plugin if it doesn't install.
if dein#check_install()
    call dein#install()
endif







" ------------------------------------------------------------
" ### nerdtree
" autocmd VimEnter * execute 'NERDTree'





" ------------------------------------------------------------
" ### neocomplete
" Disable AutoComplete Pop.
let g:acp_enableAtStartup=0
" Use neocomplete
let g:neocomplete#enable_at_startup=1
" Use smartcase
let g:neocomplete#enable_smart_case=1
" Set minimum syntax keyword length
let g:neocomplete#sources#syntax#min_keyword_lenth=2

let gLneocomplete#lock_buffer_name_pattern='\*ku\*'
" Define keyword
if !exists('g:neocomplete#keyword_patterns')
   let g:neocomplete#keyword_patterns={}
endif
let g:neocomplete#keyword_patterns['default']='\h\w*'


" Key Mapping
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
inoremap <expr><C-c> neocomplete#cancel_popup()
inoremap <expr><C-u> neocomplete#undo_completion()
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"








" ### neco-look
if !exists('g:neocomplete#text_mode_filetypes')
    let g:neocomplete#text_mode_filetypes={}
endif
let g:neocomplete#text_mode_filetypes={
    \ 'rst' : 1,
    \ 'markdown' : 1,
    \ 'gitrebase' : 1,
    \ 'gitcommit' : 1,
    \ 'vcs-commit' : 1,
    \ 'hybrid' : 1,
    \ 'text' : 1,
    \ 'help' : 1,
    \ 'tex' : 1,
    \ }

filetype plugin indent on









" ------------------------------------------------------------
" ### vim-lightline
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'mode_map': {'c': 'NORMAL'},
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'modified': 'LightlineModified',
    \   'readonly': 'LightlineReadonly',
    \   'fugitive': 'LightlineFugitive',
    \   'filename': 'LightlineFilename',
    \   'fileformat': 'LightlineFileformat',
    \   'filetype': 'LightlineFiletype',
    \   'fileencoding': 'LightlineFileencoding',
    \   'mode': 'LightlineMode'
    \ }
    \ }

function! LightlineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
    return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'unite' ? unite#get_status_string() :
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
        return fugitive#head()
    else
        return ''
    endif
endfunction

function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction



" ------------------------------------------------------------
" ### easymotion Normal modeでsキーを押して起動
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)
omap g/ <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = 'QZASDFGHJKL;'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1






" ------------------------------------------------------------
" ### Others

" jk accelerate
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)


