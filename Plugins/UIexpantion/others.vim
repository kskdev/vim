" ----------------------------------------
"  lightline colorscheme auto selector
" ----------------------------------------
" how to check color group -> :highlight

function! s:setHi(group)
  let s:_guifg   = synIDattr(hlID(a:group), "fg", "gui")
  let s:_guibg   = synIDattr(hlID(a:group), "bg", "gui")
  let s:_ctermfg = synIDattr(hlID(a:group), "fg", "cterm")
  let s:_ctermbg = synIDattr(hlID(a:group), "bg", "cterm")
  return [s:_guifg, s:_guibg, s:_ctermfg, s:_ctermbg]
endfunction

function! s:setHi2(group_fg, group_bg)
  let s:_guifg   = synIDattr(hlID(a:group_fg), "fg", "gui")
  let s:_guibg   = synIDattr(hlID(a:group_bg), "bg", "gui")
  let s:_ctermfg = synIDattr(hlID(a:group_fg), "fg", "cterm")
  let s:_ctermbg = synIDattr(hlID(a:group_bg), "bg", "cterm")
  return [s:_guifg, s:_guibg, s:_ctermfg, s:_ctermbg]
endfunction

" initialization
command! -bar LightLineUpdate call lightline#init()| call lightline#colorscheme()| call lightline#update()

let g:lightline.colorscheme = 'mypalette'
let g:pltt = {'inactive': {}, 'normal': {}, 'insert': {}, 'visual': {}, 'replace': {}, 'tabline': {}}

" let s:hoge = [ {guifg}, {guibg}, {ctermfg}, {ctermbg} ]
let s:base_0 = s:setHi2('Normal', 'StatusLine')                     " statuline
let s:base_1 = [s:base_0[1], s:base_0[0], s:base_0[3], s:base_0[2]] " statusline inverse
let s:base_2 = s:setHi2('Normal', 'StatusLine')                     " tabline

" mode color
let s:mode_stl = s:setHi2('Normal', 'StatusLine')
let s:mode_nor = ['#272d38', '#bbe67e', 5  , 14 ]
let s:mode_ins = ['#272d38', '#5ccfe6', 5  , 121]
let s:mode_vis = ['#272d38', '#ffae57', 5  , 225]
let s:mode_rep = ['#272d38', '#d4bfff', 5  , 11 ]
let s:mode_war = ['#ffae57', s:base_0[1], 11, s:base_0[3]]
let s:mode_err = ['#f07178', s:base_0[1], 0 , s:base_0[3]]

" tabline
let s:tab_f = s:setHi2('Special', 'TabLine')
let s:tab_b = s:setHi2('Normal', 'StatusLine')

" statusline basic
let g:STL_BASECOLOR = s:base_0
" statusline attr
let g:STL_ATTRIBUTECOLOR = s:base_1

" statusline
let g:pltt.inactive.middle = [g:STL_BASECOLOR]
let g:pltt.inactive.left   = [s:mode_stl, ]
let g:pltt.inactive.right  = [g:STL_BASECOLOR]

" normal mode
let g:pltt.normal.middle = [g:STL_BASECOLOR]
let g:pltt.normal.left   = [s:mode_nor, ]
let g:pltt.normal.right  = deepcopy(g:pltt.inactive.right)

" insert mode
let g:pltt.insert.middle = [g:STL_BASECOLOR]
let g:pltt.insert.left   = [s:mode_ins, ]
let g:pltt.insert.right  = deepcopy(g:pltt.inactive.right)

" visual mode
let g:pltt.visual.middle = [g:STL_BASECOLOR]
let g:pltt.visual.left   = [s:mode_vis, ]
let g:pltt.visual.right  = deepcopy(g:pltt.inactive.right)

" replace mode
let g:pltt.replace.middle = [g:STL_BASECOLOR]
let g:pltt.replace.left   = [s:mode_rep, ]
let g:pltt.replace.right  = deepcopy(g:pltt.inactive.right)

" tabline
let g:pltt.tabline.middle = [s:base_2]
let g:pltt.tabline.left   = [s:tab_b]
let g:pltt.tabline.right  = [s:base_2, ]
let g:pltt.tabline.tabsel = [s:tab_f]  " active window color

" error and warning
" let g:pltt.normal.warning = [s:mode_war]
" let g:pltt.normal.error   = [s:mode_err]


" update palette
let g:lightline#colorscheme#mypalette#palette = g:pltt
unlet g:pltt g:STL_BASECOLOR g:STL_ATTRIBUTECOLOR
