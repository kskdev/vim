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
let s:mode_war = ['#fabd2f', '#3c3836', 214, 237]
let s:mode_err = ['#fb4934', '#3c3836', 167, 237]

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

" error and warning
let g:pltt.normal.warning = [s:mode_war]
let g:pltt.normal.error   = [s:mode_err]


" update palette
let g:lightline#colorscheme#mypalette#palette = g:pltt
unlet g:pltt g:STL_BASECOLOR g:STL_ATTRIBUTECOLOR
