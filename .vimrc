
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree'

Plug 'jiangmiao/auto-pairs'

Plug 'NLKNguyen/papercolor-theme'

Plug 'arcticicestudio/nord-vim'

Plug 'kevinoid/vim-jsonc'

Plug 'ludovicchabant/vim-gutentags'

Plug 'dense-analysis/ale'

Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension'  }

Plug 'ycm-core/YouCompleteMe'

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

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'

"settings for ycm
let g:ycm_add_preview_to_completeopt=0
let g:ycm_show_diagnostics_ui=0
let g:ycm_server_log_level='info'
let g:ycm_min_num_identifier_candidate_chars=2
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion='<c-space>'
set completeopt=menu,menuone


let g:ycm_semantic_triggers={
    \ 'c,cpp,python,java,go,erlang,perl':['re!\w{2}'],
    \ 'cs,lua,javascript': ['re!\w{2}'],
    \ }
"settings for LeaderF
let g:Lf_ShortcutF = '<C-p>'
