" ----------------------------------------
"  lightline colorscheme for gruvbox
" ----------------------------------------
" how to check color group -> :highlight

" initialization
command! -bar LightLineUpdate call lightline#init()| call lightline#colorscheme()| call lightline#update()

let g:lightline.colorscheme = 'mypalette'
let g:pltt = {'inactive': {}, 'normal': {}, 'insert': {}, 'visual': {}, 'replace': {}, 'tabline': {}}

" let s:hoge = [ {guifg}, {guibg}, {ctermfg}, {ctermbg} ]
let s:base_0 = ['#eeeeee', '#323232', 255, 236]  " basic
let s:base_1 = ['#323232', '#eeeeee', 236, 255]  " basic reverse
let s:base_2 = ['#eeeeee', '#323232', 255, 236]  " tabline

" mode color
let s:mode_stl = ['#73cef4', '#282c34', 81 , 238]
let s:mode_nor = ['#282c34', '#73cef4', 235, 81 ]
let s:mode_ins = ['#282c34', '#9faa00', 235, 142]
let s:mode_vis = ['#282c34', '#ffc24b', 238, 215]
let s:mode_rep = ['#282c34', '#f43753', 238, 203]
let s:mode_war = ['#ffc24b', '#323232', 215, 236]
let s:mode_err = ['#f43753', '#323232', 203, 236]

" tabline
let s:tab_f = ['#c9d05c', '#282828', 185, 235]
let s:tab_b = ['#999999', '#323232', 246, 236]

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
