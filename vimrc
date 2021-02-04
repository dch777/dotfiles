""------------------Options------------------
set nocompatible
set nobackup
set showcmd
set autoindent
set clipboard=unnamedplus
set ruler
set smarttab
set wildmenu
set incsearch
set hlsearch
set number relativenumber
set noshowmode
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c
set completeopt-=preview
set noinfercase
set belloff+=ctrlg
set nrformats+=alpha
set noexpandtab

let g:zipPlugin_ext = '.gz,.zip' 
let g:ctrlp_show_hidden = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/.ycm_extra_conf.py'

let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0

filetype indent on
syntax on
syntax enable

""------------------Maps---------------------

""utility
nnoremap <F8> :TagbarToggle<CR>:NERDTreeToggle<CR>
nnoremap <Up> ddkP
nnoremap <Down> ddp
nnoremap <Left> <<
inoremap {<CR> {<CR>}<C-c>O
nnoremap <Right> >>
nnoremap <C-S-o> :FZF<CR>

""buffers
nnoremap ,, :w<CR>:Buffers<CR>
nnoremap ,. :buffer #<CR>
nnoremap ,/ :buffers<CR>:bdelete<Space>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

""misc
tnoremap <Esc> <C-\><C-n>
nnoremap j gj
nnoremap k gk
nnoremap <S-j> 10j
nnoremap <S-k> 10k
nnoremap <C-s> :mksession!<CR>
vnoremap <C-S-x> "pdmz:exe ExecutePython()<CR>`z"pp

""------------------Colorscheme--------------
let g:airline_theme='violet'

""------------------Functions----------------
function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction

function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction

function! ExecutePython()
  let @p=join(split(system("python -c " . shellescape(@p)),"\n"), " ")
endfunction

""------------------AutoCmd------------------
autocmd BufWritePost *.cpp,*.h,*.c,*.java,*.py call UpdateTags()
autocmd BufWritePost *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
autocmd BufNewFile,BufRead *.js,*.tsx,*.jsx set filetype=typescriptreact

autocmd FileType html nnoremap <C-S-o> :Dispatch! google-chrome-stable --user-data-dir=/var/tmp/Chrome "%:r.html"<CR>
autocmd FileType cpp,hpp,c,java,py setlocal tabstop=4 shiftwidth=4
autocmd FileType html,css,typescriptreact setlocal tabstop=2 shiftwidth=2 
autocmd FileType tex nnoremap <C-S-o> :Dispatch! zathura "%:r.pdf"<CR>

autocmd BufNewFile *.tex 0r ~/.vim/templates/skeleton.tex
autocmd BufWritePost *.tex Dispatch! latexmk -pdf %
autocmd BufDelete *.tex !latexmk -c

autocmd BufEnter * let &titlestring = "vim - " . expand("%:p") . ""
""------------------Plugins------------------
call plug#begin()
Plug 'majutsushi/tagbar'
Plug 'tmhedberg/SimpylFold'
Plug 'ycm-core/YouCompleteMe', {'do': 'install.py'}
Plug 'ervandew/supertab'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'epilande/vim-react-snippets'
Plug 'jsx/jsx'
Plug 'epilande/vim-es2015-snippets'
Plug 'prettier/vim-prettier', {'do': 'yarn install'}

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'

Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
call plug#end()
