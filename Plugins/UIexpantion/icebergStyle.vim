" ----------------------------------------
"  lightline colorscheme for gruvbox
" ----------------------------------------
" how to check color group -> :highlight

" initialization
command! -bar LightLineUpdate call lightline#init()| call lightline#colorscheme()| call lightline#update()

let g:lightline.colorscheme = 'mypalette'
let g:pltt = {'inactive': {}, 'normal': {}, 'insert': {}, 'visual': {}, 'replace': {}, 'tabline': {}}

" let s:hoge = [ {guifg}, {guibg}, {ctermfg}, {ctermbg} ]
let s:base_0 = ['#c6c8d1', '#1e2132', 252, 235]  " basic
let s:base_1 = ['#1e2132', '#c6c8d1', 235, 252]  " basic reverse
let s:base_2 = ['#c6c8d1', '#1e2132', 252, 235]  " tabline

" mode color
let s:mode_stl = ['#e27878', '#1e2132', 203, 235]
let s:mode_nor = ['#282828', '#84a0c6', 235, 110]
let s:mode_ins = ['#282828', '#a093c7', 235, 140]
let s:mode_vis = ['#282828', '#e2a478', 235, 216]
let s:mode_rep = ['#282828', '#818596', 235, 234]
let s:mode_war = ['#e2a478', '#1e2132', 216, 236]
let s:mode_err = ['#e27878', '#1e2132', 203, 236]

" tabline
let s:tab_f = ['#a093c7', '#161821', 140, 234]
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

" error and warning
let g:pltt.normal.warning = [s:mode_war]
let g:pltt.normal.error   = [s:mode_err]


" update palette
let g:lightline#colorscheme#mypalette#palette = g:pltt
unlet g:pltt g:STL_BASECOLOR g:STL_ATTRIBUTECOLOR
