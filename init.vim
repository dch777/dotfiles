call plug#begin()
Plug 'vimwiki/vimwiki'
Plug 'tools-life/taskwiki'
Plug 'mattn/calendar-vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'prabirshrestha/async.vim'
Plug 'ahmedkhalf/lsp-rooter.nvim'

Plug 'liuchengxu/vista.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-lsp'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'
Plug 'williamboman/nvim-lsp-installer'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'epilande/vim-react-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

Plug 'morhetz/gruvbox'
Plug 'hoob3rt/lualine.nvim'
Plug 'mhinz/vim-startify'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'lewis6991/gitsigns.nvim'
call plug#end()

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
set guicursor=
set fillchars+=vert:┆
set termguicolors
set indentexpr=lisp
set mouse=a
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
set list listchars=tab:\ \ ,trail:·,precedes:<,extends:>
set nowrap
set undofile
set undodir=~/.config/nvim/undodir

let g:python_host_prog = '/bin/python'
let g:python3_host_prog = '/bin/python3'

let g:zipPlugin_ext = '.gz,.zip' 
let g:ctrlp_show_hidden = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:lexima_enable_basic_rules = 1
let g:lexima_enable_newline_rules = 1
let g:lexima_enable_endwise_rules = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#lsp#use_icons_for_candidates = v:true
let g:ale_completion_autoimport = 1
let g:vista_fzf_preview = ['right:50%']
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

let g:nvim_tree_auto_open = 1
let g:nvim_tree_auto_close = 1
let g:nvim_tree_disable_window_picker = 1
let g:nvim_tree_update_cwd = 1
let g:nvim_tree_follow = 1
let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_add_trailing = 1

let g:startify_padding_left = 5
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] 
let g:ascii = [
\ '         //                 /*',
\ '      ,(/(//,               *###',
\ '    ((((((////.             /####%*',
\ ' ,/(((((((/////*            /########',
\ '/*///((((((//////.          *#########/',
\ '//////((((((((((((/         *#########/.',
\ '////////((((((((((((*       *#########/.',
\ '/////////(/(((((((((((      *#########(.',
\ '//////////.,((((((((((/(    *#########(.',
\ '//////////.  /(((((((((((,  *#########(.',
\ '(////////(.    (((((((((((( *#########(.',
\ '(////////(.     ,#((((((((((##########(.',
\ '((//////((.       /#((((((((##%%######(.',
\ '((((((((((.         #(((((((####%%##%#(.',
\ '((((((((((.          ,((((((#####%%%%%(.',
\ ' .#(((((((.            (((((#######%%',
\ '    /(((((.             .(((#%##%%/*',
\ '      ,(((.               /(#%%#',
\ '        ./.                 #*',
\]
let g:startify_custom_header = startify#center(g:ascii)
let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]
let g:startify_bookmarks = [
            \ { 'p': '~/Projects' },
            \ { 'c': '~/.config/' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 's': '~/.scripts' },
            \ ]

let g:vimwiki_list = [{'path': '~/Documents/Notes/',
                      \ 'syntax': 'markdown', 'ext': '.md',
		      \ 'custom_wiki2html': 'vimwiki_markdown',
		      \ 'html_filename_parameterization': 1}]

filetype indent on
syntax on
syntax enable

""------------------Maps---------------------

""utility
nnoremap <F8> :Vista nvim_lsp<CR>:NvimTreeToggle<CR>
nnoremap <space> za
nnoremap <Up> ddkP
nnoremap <Down> ddp
nnoremap <Left> <<
nnoremap <Right> >>
nnoremap <C-S-o> :FZF<CR>
nnoremap <leader>c :CalendarT<CR>

""buffers
nnoremap ,, :w<CR>:Buffers<CR>
nnoremap <C-0> :buffer #<CR>
nnoremap <silent> <C-n> :BufferLineCycleNext<CR>
nnoremap <silent> <C-p> :BufferLineCyclePrev<CR>
nnoremap ,/ :buffers<CR>:bdelete<Space>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-\> :vsplit<CR>

""misc
tnoremap <Esc> <C-\><C-n>
nnoremap j gj
nnoremap k gk
nnoremap <S-j> 10j
nnoremap <S-k> 10k
nnoremap <C-s> :mksession!<CR>
vnoremap <C-S-x> "pdmz:exe ExecutePython()<CR>`z"pp

""------------------Colorscheme--------------
highlight clear SignColumn
set background=dark
let g:gruvbox_contrast_dark = 'high'
let g:gruvbox_italic = 1
colorscheme gruvbox

""------------------Functions----------------
function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "~/.tags"
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
autocmd FileType html nnoremap <C-S-o> :Dispatch! google-chrome-stable --user-data-dir=/var/tmp/Chrome "%:r.html"<CR>
autocmd FileType java,py,json setlocal tabstop=4 shiftwidth=4
autocmd FileType html,css,typescriptreact,javascript,javascriptreact,markdown,hpp,cpp,c setlocal tabstop=2 shiftwidth=2 
autocmd FileType tex nnoremap <C-S-o> :Dispatch! zathura "%:r.pdf"<CR>

autocmd FileType markdown imap <c-k> <plug>(fzf-complete-path)
autocmd BufNewFile ~/Documents/Notes/diary/*.md :silent 0r !~/.scripts/generate-vimwiki-diary-template '%'
autocmd FileType vimwiki nnoremap <leader>s :TaskWikiStart<CR>
autocmd FileType vimwiki nnoremap <leader><S-s> :TaskWikiStop<CR>

autocmd BufWritePost *.tex Dispatch! latexmk -pdf %
autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
autocmd BufWritePre *.js,*.jsx,*.html,*.css PrettierAsync
autocmd BufDelete *.tex !latexmk -c

autocmd BufEnter * let &titlestring = "vim - " . expand("%:p") . ""
autocmd VimResized * exe "normal! \<c-w>="

""--------------------Lua--------------------
lua << EOF
require('gitsigns').setup()
require("bufferline").setup{
  options = {
    offsets = {
      {filetype = "NvimTree", text = "", highlight = "Directory", text_align = "left"},
      {filetype = "vista", text = "", highlight = "Directory", text_align = "left"},
    },
    custom_filter = function(buf_number)
      if vim.bo[buf_number].filetype ~= "directory" then
        return true
      end
    end,
  }
}
require('lualine').setup{
  options = {
    theme = 'gruvbox',
    section_separators = '',
    component_separators = ''
  },
  extensions = { 'nvim-tree', 'fzf' },
  sections = {
    lualine_c = {
      {'filename', file_status = true, full_path = true},
    },
  }
}
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}

require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})


local on_attach = function()
  vim.api.nvim_exec("NvimTreeOpen", true)
  vim.api.nvim_exec("Vista nvim_lsp", true)
  vim.api.nvim_exec("wincmd p", true)
end
require'lspconfig'.pylsp.setup{on_attach = on_attach}
require'lspconfig'.clangd.setup{on_attach = on_attach}
require'lspconfig'.denols.setup{on_attach = on_attach}
require'lspconfig'.cssls.setup{on_attach = on_attach}
require'lspconfig'.texlab.setup{on_attach = on_attach}
require'lspconfig'.zeta_note.setup{cmd = {'zeta-note-linux'}, on_attach = on_attach}
require'lspconfig'.jdtls.setup{cmd = { "jdtls" }, on_attach = on_attach}
require'lspconfig'.bashls.setup{}
EOF
