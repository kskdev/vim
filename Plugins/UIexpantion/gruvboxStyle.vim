" ----------------------------------------
"  lightline colorscheme for gruvbox
" ----------------------------------------
" how to check color group -> :highlight

" initialization
command! -bar LightLineUpdate call lightline#init()| call lightline#colorscheme()| call lightline#update()

let g:lightline.colorscheme = 'mypalette'
let g:pltt = {'inactive': {}, 'normal': {}, 'insert': {}, 'visual': {}, 'replace': {}, 'tabline': {}}

" let s:hoge = [ {guifg}, {guibg}, {ctermfg}, {ctermbg} ]
let s:base_0 = ['#fbf1c7', '#3c3836', 229, 237]  " basic
let s:base_1 = ['#3c3836', '#fbf1c7', 237, 229]  " basic reverse
let s:base_2 = ['#bdae93', '#3c3836', 248, 237]  " tabline

" mode color
let s:mode_stl = ['#fb4934', '#3c3836', 167, 237]
let s:mode_nor = ['#282828', '#b8bb26', 235, 142]
let s:mode_ins = ['#282828', '#8ec07c', 235, 108]
let s:mode_vis = ['#282828', '#fabd2f', 235, 214]
let s:mode_rep = ['#282828', '#d3869b', 235, 175]

" tabline
let s:tab_f = ['#d3869b', '#282828', 175, 235]
let s:tab_b = ['#928374', '#3c3836', 245, 237]

" statusline basic
let g:STL_BASECOLOR = s:base_0
" statusline attr
let g:STL_ATTRIBUTECOLOR = s:base_1

" statusline
let g:pltt.inactive.middle = [g:STL_BASECOLOR]
let g:pltt.inactive.left = [s:mode_stl, ]
let g:pltt.inactive.right = [g:STL_BASECOLOR]

" normal mode
let g:pltt.normal.middle = [g:STL_BASECOLOR]
let g:pltt.normal.left = [s:mode_nor, ]
let g:pltt.normal.right = deepcopy(g:pltt.inactive.right)

" insert mode
let g:pltt.insert.middle = [g:STL_BASECOLOR]
let g:pltt.insert.left = [s:mode_ins, ]
let g:pltt.insert.right = deepcopy(g:pltt.inactive.right)

" visual mode
let g:pltt.visual.middle = [g:STL_BASECOLOR]
let g:pltt.visual.left = [s:mode_vis, ]
let g:pltt.visual.right = deepcopy(g:pltt.inactive.right)

" replace mode
let g:pltt.replace.middle = [g:STL_BASECOLOR]
let g:pltt.replace.left = [s:mode_rep, ]
let g:pltt.replace.right = deepcopy(g:pltt.inactive.right)

" tabline
let g:pltt.tabline.middle = [s:base_2]
let g:pltt.tabline.left = [s:tab_b]
let g:pltt.tabline.right = [s:base_2, ]
let g:pltt.tabline.tabsel = [s:tab_f]  " active window color


" update palette
let g:lightline#colorscheme#mypalette#palette = g:pltt
unlet g:pltt g:STL_BASECOLOR g:STL_ATTRIBUTECOLOR


" ----------------------------------------
"  floating window color setting [for neovim]
" ----------------------------------------
"  FZF setting
if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'
  " let $FZF_DEFAULT_OPTS .= '--margin=0,2'

  " float window定義
  function! FloatWinForFZF()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    " フレームライン
    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]

    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)

    " カラー定義
    hi ColorFZF guifg=s:base_2[0] guibg=s:base_2[1]
    set winhighlight=Normal:ColorFZF
    " 現在のウィンドウの半透明度を指定
    set winblend=0

    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4

    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
  endfunction

  let g:fzf_layout = { 'window': 'call FloatWinForFZF()' }
endif














" ----------------------------------------
" cheatsheet
" ----------------------------------------
" Ctrl + w
" で別ウィンドウの編集をしようと思ってもフレーム用ウィンドウを選択してしまう
" 解決策1
"   - フレーム用ウィンドウを選択されたら次にウィンドウへ移動するように設計
" 解決策2
"   - cheatsheet用のウィンドウに統合(理想)


command! -nargs=? -complete=command Cheat2 call <SID>toggle_cheat_sheet(<q-args>)

function! s:toggle_cheat_sheet(cmd)
  if exists('s:cheatbuf')
    call s:close_cheat_sheet(s:cheatbuf)
    unlet s:cheatbuf
  else
    if g:cheatsheet#float_window == 0
      let s:cheatbuf = s:open_cheat_sheet()
    else
      let s:cheatbuf = s:open_cheat_sheet_float()
    endif
  endif
endfunction

function! s:open_cheat_sheet() abort
  let l:path = expand(g:cheatsheet#cheat_file)

  if !filereadable(l:path)
    echo 'not exists.'
    return
  endif

  let l:split_command = ':sp'
  if g:cheatsheet#vsplit != 0
    let l:split_command = ':vs'
  endif
  execute l:split_command
  execute 'view' l:path
  return bufnr('%')
endfunction

function! s:open_cheat_sheet_float() abort
  let width = min([&columns - 4, max([80, &columns - 20])])
  let height = min([&lines - 4, max([20, &lines - 10])])
  let top = ((&lines - height) / 2) - 1
  let left = (&columns - width) / 2
  let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

  " フレームライン
  let top = "╭" . repeat("─", width - 2) . "╮"
  let mid = "│" . repeat(" ", width - 2) . "│"
  let bot = "╰" . repeat("─", width - 2) . "╯"
  let lines = [top] + repeat([mid], height - 2) + [bot]

  let s:buf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
  call nvim_open_win(s:buf, v:true, opts)

  " カラー定義
  hi ColorFZF guifg=s:base_2[0] guibg=s:base_2[1]
  set winhighlight=Normal:ColorFZF
  " 現在のウィンドウの半透明度を指定
  set winblend=0

  let opts.row += 1
  let opts.height -= 2
  let opts.col += 2
  let opts.width -= 4

  " call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  let s:winid = nvim_open_win(s:buf, v:true, opts)
  " let s:buf = nvim_create_buf(v:false, v:true)
  " let width = float2nr(round(winwidth(0) * g:cheatsheet#float_window_width_ratio))
  " let height = float2nr(round(winheight(0) * g:cheatsheet#float_window_height_ratio))
  " " can move in float window?
  " let focusable = v:true
  " " editor or win or cursor
  " let relative = 'win'
  " " base position
  " let anchor = 'NW'
  " " offset
  " let row = float2nr(round(winheight(0) * (1 - g:cheatsheet#float_window_height_ratio) / 2))
  " let col = float2nr(round(winwidth(0) * (1 - g:cheatsheet#float_window_width_ratio) / 2))
  " let opts = {
  "       \ 'relative': relative,
  "       \ 'anchor': anchor,
  "       \ 'height': height,
  "       \ 'width': width,
  "       \ 'row': row,
  "       \ 'col': col
  "       \ }
  " let winid = nvim_open_win(s:buf, v:true, opts)

  " 読み込みモード(view)で l:path のファイルを展開
  let l:path = expand(g:cheatsheet#cheat_file)
  execute 'view' l:path
  " q = :Cheat
  " バッファを q で閉じる
  nnoremap <buffer> <silent> q :<C-u>Cheat2<CR>



  return bufnr('%')
endfunction

function! s:close_cheat_sheet(cheatbuf) abort
  execute 'bd' a:cheatbuf
  execute 'quit' a:cheatbuf
endfunction


" TODO Ctrl+a でチートシート展開トグル(../utils.toml のcheatsheet.vim キーマップを上書きしているので注意すること)
nnoremap <C-c> :<C-u>Cheat2<CR>
