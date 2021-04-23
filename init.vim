if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Plugins
  call dein#add('vim-scripts/Toggle-NERDTree-width')
  call dein#add('chrisbra/Colorizer')
  call dein#add('tpope/vim-commentary')
  call dein#add('mhinz/vim-signify')
  " call dein#add('lifepillar/vim-wwdc16-theme')
  call dein#add('christoomey/vim-tmux-navigator')
  " call dein#add('ncm2/ncm2')
  " call dein#add('roxma/nvim-yarp')
  call dein#add('leshill/vim-json')
  call dein#add('wakatime/vim-wakatime')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-speeddating')
  call dein#add('tpope/vim-fugitive')
  call dein#add('/usr/local/opt/fzf')
  call dein#add('junegunn/fzf.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('easymotion/vim-easymotion')
  " call dein#add('vim-airline/vim-airline')
  " call dein#add('vim-airline/vim-airline-themes')
  call dein#add('itchyny/lightline.vim')
  call dein#add('crusoexia/vim-monokai')
  call dein#add('Shougo/denite.nvim')
  call dein#add('tpope/vim-repeat')
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('qpkorr/vim-bufkill')
  call dein#add('w0rp/ale')
 " call dein#add('rust-lang/rust')
  call dein#add('tpope/vim-rails')
  call dein#add('ElmCast/elm-vim')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('slim-template/vim-slim')
  call dein#add('dag/vim-fish')
  call dein#add('wavded/vim-stylus')
  call dein#add('mxw/vim-jsx')
  call dein#add('peitalin/vim-jsx-typescript')
  call dein#add('msprev/vim-markdown-folding')
  call dein#add('JamshedVesuna/vim-markdown-preview')
  call dein#add('godlygeek/tabular')
  call dein#add('pangloss/vim-javascript')
  call dein#add('jparise/vim-graphql')
  " call dein#add('vimwiki/vimwiki')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('HerringtonDarkholme/yats.vim')
  "" call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})
  call dein#add('Shougo/denite.nvim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Enable ALE LSP for autocomplete and other features
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_set_balloons = 1


let g:ale_fixers = {}
let g:ale_fixers['typescript'] = ['prettier', 'tslint']
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_fixers['css'] = ['prettier']
let g:ale_javascript_prettier_use_local_config = 1
 

"" For Stylus"
au BufRead,BufNewFile *.styl setf sass

"" For CSS"
au BufRead,BufNewFile *.css setf sass

"" Enable JSX by default
let g:jsx_ext_required = 0

" NERDTree
let NERDTreeShowHidden = 1

" Folding
set foldenable
nnoremap <tab> za
autocmd FileType * exe "normal zR"

" Markdown
let g:markdown_fold_style = 'nested'
let vim_markdown_preview_github=1

" let g:vimwiki_list = [{'path': '~/Dropbox/inkarnate/notes/', 'syntax': 'markdown', 'ext': '.md'}]
" au! BufRead,BufNewFile *.markdown set filetype=mkd
" au! BufRead,BufNewFile *.md       set filetype=mkd
" autocmd FileType markdown match none

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

autocmd VimResized * wincmd =

set autoread

" set nobackup
" set nowritebackup
set noswapfile
set modifiable
set hidden

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

let mapleader=" "
let maplocalleader=","
set number
set timeoutlen=1000 ttimeoutlen=0

set background=dark
set termguicolors
colorscheme monokai
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

set nocursorline
set lazyredraw

let g:elm_setup_keybindings = 1

let g:fzf_layout = { 'down': '~90%' }
let $FZF_DEFAULT_OPTS = '--bind up:preview-up,down:preview-down'

set inc=split

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0) 

" highlight clear LineNr
" hi VertSplit ctermbg=NONE guibg=NONE
" set fillchars+=vert:\ 
" hi Normal guibg=NONE ctermbg=NONE
" highlight clear SignColumn
"
"
"

" set t_SI=^[[6\ q
" set t_SR=^[[4\ q
" set t_EI=^[[2\ q<Paste>
" 
" set -ga terminal-overrides ",screen*:Ss=^[[%p1%d q:Se=^[[2 q"

" Handle easy exiting of terminal
tnoremap <Esc> <C-\><C-n>
" Key Mappings

map <leader>s :w<CR>
map <leader>d :BD<CR>
map <leader>x :q<CR>
map <leader>q :qa<CR>
map <leader><tab> :BA<CR>

" FZF
map <leader>m :History<CR>
map <leader>r :Buffers<CR>
map <leader>f :Files<CR>
map <leader>p :GitFiles<CR>

map <leader>gc :Commits<CR>
map <leader>gb :BCommits<CR>
map <leader>gs :GFiles?<CR>
map <leader>la :Lines<CR>   
map <leader>lb :BLines<CR>

map <leader>wh <C-W>H
map <leader>wj <C-W>J
map <leader>wk <C-W>K
map <leader>wl <C-W>L

map <leader>t :NERDTreeToggle<CR><C-w>=
map <leader>o :NERDTreeFind<CR>

map <leader>u :source $MYVIMRC<CR>
map <leader>= <C-W>=<CR>

map <leader>wv :vsp<CR>
map <leader>wh :sp<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <leader>h :vert help<space>
map <leader>j :BF<CR>
map <leader>k :BB<CR>

map <leader>/ :Ag<CR>
map <silent> <leader>* :Ag <C-R><C-W><CR>

map <leader>c :noh<CR>

" Easy Motion

nmap s <Plug>(easymotion-bd-w)
