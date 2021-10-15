
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree'

Plug 'jiangmiao/auto-pairs'

Plug 'NLKNguyen/papercolor-theme'

Plug 'arcticicestudio/nord-vim'

Plug 'kevinoid/vim-jsonc'

Plug 'ludovicchabant/vim-gutentags'

Plug 'dense-analysis/ale'

" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension'  }

call plug#end()

nnoremap <C-n> :exec 'NERDTreeToggle' <CR>


syntax on
set number
colorscheme nord

set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" ctags settings
set tags=./.tags;,.tags

" vim-gutentags settings

" gutentags: the attribute stands for the markers for search project index
let g:gutentags_project_root=['.root', '.svn', '.git', '.hg', '.project']

" the name of the [tag file]
let g:gutentags_ctags_tagfile = '.tags'


"" generate tags files into a custom path
let s:vim_tags = expand('~/.cache/vim_tags')
let g:gutentags_cache_dir = s:vim_tags

" configure the attributes of ctags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
"
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif


" settings for ale_linter
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_sign_error = ">>"
highlight clear ALEWarning
highlight clear ALEError

" settings for LeaderF
"let g:Lf_ShortcutF = '<C-p>'"
