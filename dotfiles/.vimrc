"""
""" References or ideas:
"""   - https://github.com/chebro/dotfiles/blob/master/.vimrc
"""   - https://github.com/amix/vimrc
"""   - https://github.com/tpope/vim-sensible  
"""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" GENERAL CONFIG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set mouse=a             " Use mouse
set encoding=utf-8		" show utf-8 symbols
set hlsearch			" highlight all search results
set ignorecase			" do case insensitive search 
set incsearch			" show incremental search results as you type
set smartcase			" case-sensitive search if query contains uppercase
set number				" show current line number
"set relativenumber		" show relative line numbers
"set tabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" POWERLINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2
set showtabline=2
set noshowmode
set t_Co=256
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 14
