" ----------------------------------------
"  lightline colorscheme for gruvbox
" ----------------------------------------
" how to check color group -> :highlight

" initialization
command! -bar LightLineUpdate call lightline#init()| call lightline#colorscheme()| call lightline#update()

let g:lightline.colorscheme = 'mypalette'
let g:pltt = {'inactive': {}, 'normal': {}, 'insert': {}, 'visual': {}, 'replace': {}, 'tabline': {}}

" let s:hoge = [ {guifg}, {guibg}, {ctermfg}, {ctermbg} ]
let s:base_0 = ['#a9b7c6', '#263b59', 67 , 23 ]  " basic
let s:base_1 = ['#263b59', '#a9b7c6', 23 , 67 ]  " basic reverse
let s:base_2 = ['#a9b7c6', '#263b59', 67 , 23 ]  " tabline

" mode color
let s:mode_stl = ['#ff3333', '#263b59', 224, 23 ]
let s:mode_nor = ['#263b59', '#5e8759', 23 , 65 ]
let s:mode_ins = ['#263b59', '#7ca8c6', 23 , 67 ]
let s:mode_vis = ['#263b59', '#c57825', 23 , 172]
let s:mode_rep = ['#263b59', '#a9b7c6', 23 , 67 ]
let s:mode_war = ['#c57825', '#263b59', 172, 236]
let s:mode_err = ['#f43753', '#263b59', 203, 236]

" tabline
let s:tab_f = ['#7ca8c6', '#323232', 67 , 236]
let s:tab_b = ['#8e9292', '#263b59', 244, 23 ]

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


" redefine highlight color.
hi MyLineNum guifg=#b1c73d guibg=#323232
set winhighlight=CursorLineNr:MyLineNum
