set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pre-bundles

let g:solarized_diffmode='high'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim goodies

source $VIMRUNTIME/ftplugin/man.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bundles

set runtimepath+=/home/uken/.vim/bundle//repos/github.com/Shougo/dein.vim

"dein Scripts-----------------------------
if dein#load_state('/home/uken/.vim/bundle')
  call dein#begin('/home/uken/.vim/bundle')

  call dein#add('/home/uken/.vim/bundle/repos/github.com/Shougo/dein.vim')

  call dein#add('airblade/vim-gitgutter.git')
  " call dein#add('ambv/black')
  call dein#add('AndrewRadev/linediff.vim')
  call dein#add('bling/vim-airline')
  call dein#add('chrisbra/Recover.vim')
  call dein#add('ConradIrwin/vim-bracketed-paste')
  call dein#add('davidhalter/jedi-vim')
  " call dein#add('deoplete-plugins/deoplete-jedi')
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('FooSoft/vim-argwrap')
  call dein#add('hashivim/vim-vagrant.git')
  " call dein#add('honza/vim-snippets')
  call dein#add('jeetsukumaran/vim-indentwise')
  call dein#add('jez/vim-colors-solarized.git')
  " call dein#add('junegunn/rainbow_parentheses.vim')
  call dein#add('midnightrun/rainbow_parentheses.vim')
  call dein#add('mbbill/undotree')
  call dein#add('michaeljsmith/vim-indent-object')
  call dein#add('nathanaelkane/vim-indent-guides.git')
  call dein#add('raimon49/requirements.txt.vim')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('Shougo/context_filetype.vim')
  call dein#add('Shougo/denite.nvim')
  " call dein#add('Shougo/deoplete.nvim')
  " needed by deoplete {
  " call dein#add('roxma/nvim-yarp')
  " call dein#add('roxma/vim-hug-neovim-rpc')
  " }
  " call dein#add('Shougo/neco-vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/unite-outline')
  call dein#add('Shougo/unite.vim')
  " call dein#add('Shougo/vimproc.vim', { 'build': { 'linux': 'make' }})
  call dein#add('Soares/write.vim')
  call dein#add('ssteffl/lark-syntax.vim')
  call dein#add('stephenway/postcss.vim')
  call dein#add('t9md/vim-choosewin')
  call dein#add('tommcdo/vim-lion')
  " call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-dispatch')
  call dein#add('tpope/vim-eunuch')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-jdaddy.git')
  " call dein#add('tpope/vim-projectionist')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-sleuth')
  call dein#add('tpope/vim-tbone')
  call dein#add('tyru/caw.vim')
  call dein#add('Valloric/ListToggle')
  call dein#add('Valloric/MatchTagAlways')
  " call dein#add('Valloric/YouCompleteMe', {'merged': 0})
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('vim-scripts/argtextobj.vim')
  call dein#add('w0rp/ale')
  " call dein#add('zchee/deoplete-clang')
  " call dein#add('zchee/deoplete-zsh')

  if len(glob('$HOME/.vimrc.local.bundles')) | source $HOME/.vimrc.local.bundles | endif

  " Required:
  call dein#end()
  call dein#save_state()
endif

filetype indent plugin on

if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colors

set t_Co=256
let g:solarized_termcolors=256
syntax on
set background=dark
colorscheme solarized
hi Search cterm=reverse
hi Visual cterm=reverse
hi CursorLine cterm=none ctermbg=235
set hlsearch

"""
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" various vim modes

set hidden

set undofile
set undodir=$HOME/.vim/undo

set number
set cursorcolumn
set cursorline
set showcmd
set incsearch

" always show statusline
set laststatus=2

set backspace=indent,eol,start
set wildmenu
set wildmode=longest,list,full

set clipboard=exclude:.*

set fileencodings=utf-8,cp1251,utf-16le

set lazyredraw
set nostartofline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"

" jump to last position
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")| exe "normal g'\"" | endif

" redundand whitespace
au BufNewFile,BufRead * highlight RedundantSpaces ctermbg=red guibg=red
au BufNewFile,BufRead * 2match RedundantSpaces /\s\+$\| \+\ze\t/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keymaps

set pastetoggle=<F12>

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

imap jk <Esc>

" switch to MRU buffer
nnoremap <Tab> :b#<cr>

nnoremap [q :cp<cr>
nnoremap ]q :cn<cr>
nnoremap [Q :crewind<cr>
nnoremap ]Q :clast<cr>

nnoremap [b :bp<cr>
nnoremap ]b :bn<cr>

nnoremap [z :JumpToPrevSign<cr>
nnoremap ]z :JumpToNextSign<cr>

" close current buffer
nnoremap Q :bd<cr>

nnoremap <leader>% :MtaJumpToOtherTag<cr>

nnoremap <leader>Y :YcmCompleter <C-L><C-D>
nnoremap <leader>yg :YcmCompleter GoTo<cr>

nmap <F2> <Plug>(choosewin)
nmap <F9> :wall\|Make<cr>

" let g:yankstack_map_keys=0
" nmap <leader>- <Plug>yankstack_substitute_older_paste
" nmap <leader>= <Plug>yankstack_substitute_newer_paste

" work around vim-scripts/diffchar.vim inability to disable
" default keymapping
nmap <sid>1 <Plug>ToggleDiffCharCurrentLine
nmap <sid>2 <Plug>JumpDiffCharPrevStart
nmap <sid>3 <Plug>JumpDiffCharNextStart
nmap <sid>4 <Plug>JumpDiffCharPrevEnd
nmap <sid>5 <Plug>JumpDiffCharNextEnd

nnoremap <silent> <leader>a :ArgWrap<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" per file type tweaks

au FileType cpp,c,python,perl,java,vim setl ts=4 sw=4 softtabstop=4 expandtab ai
au BufNewFile,BufRead CMakeLists.txt setl ts=4 sw=4 softtabstop=4 expandtab
au BufRead COMMIT_EDITMSG setl spell|startinsert
au FileType cpp,c,python,json RainbowParentheses
au FileType requirements,terraform let b:caw_oneline_comment = '# '
au FileType python setlocal completeopt-=preview

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ycm

let g:ycm_show_diagnostics_ui=0
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist = ['~/.vim/*']

" https://github.com/Valloric/YouCompleteMe#the-gycm_filetype_blacklist-option
let g:ycm_filetype_blacklist = {
  \ 'python': 1,
  \ 'sh': 1
\}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#show_call_signatures = 2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup=1

" show buffer number
au User AirlineAfterInit let g:airline_section_c=substitute(g:airline_section_c, '%f', '%f #%n', '')
let g:airline_exclude_preview=1

let g:yaifa_max_lines=100
let g:airline_powerline_fonts=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:jump_to_neigh_sign(dir)
	redir => l:signs_str
	exe 'silent! sign place buffer=' . winbufnr(0)
	redir END

	let l:curline=line('.')
	let l:nearest_sigid = -1

	for l:line in split(l:signs_str, '\n')
		if stridx(l:line, 'id=') < 0 | continue | endif
		let l:sign = {}
		for [l:k, l:v] in map(split(l:line),'split(v:val, ''='')')
			let l:sign[l:k] = l:v
		endfor

		let l:distance = a:dir * (l:sign.line - l:curline)
		if l:distance > 0 && (l:nearest_sigid == -1 || l:distance < l:nearest_distance)
			let l:nearest_sigid = l:sign.id
			let l:nearest_distance = l:distance
		endif
	endfor

	if l:nearest_sigid != -1
		exe 'sign jump' l:nearest_sigid 'buffer=' . winbufnr(0)
	endif
endfunction

command  JumpToNextSign call s:jump_to_neigh_sign(+1)
command  JumpToPrevSign call s:jump_to_neigh_sign(-1)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd User ProjectionistActivate call s:activate()

function! s:activate() abort
	for [l:root, l:value] in projectionist#query('compiler')
		exe 'compiler' l:value
		break
	endfor
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_python_flake8_post_args='--max-line-length=120 --ignore=E731,E741,W503'
let g:syntastic_yaml_checkers = ['yamllint', 'jsyaml']
" let g:syntastic_python_checkers = ['flake8', 'pep8', 'pycodestyle', 'pyflakes', 'python']
let g:syntastic_python_checkers = ['flake8', 'python']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_python_flake8_options=g:syntastic_python_flake8_post_args
let g:ale_sign_column_always = 1
let g:ale_python_mypy_options = '--ignore-missing-imports --allow-redefinition'
" let g:ale_python_mypy_options = '--ignore-missing-imports --allow-redefinition --strict'
let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_cpp_compiler_options='-std=c++14'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

nnoremap <leader>U :UniteResume<cr>
nnoremap <leader>D :Denite -resume<cr>
" nnoremap <leader>b :Unite -start-insert buffer file_mru<cr>
nnoremap <leader>b :Denite buffer file_mru<cr>
nnoremap <leader>o :Unite outline<cr>
" nnoremap <leader>p :UniteWithProjectDir -start-insert -buffer-name=files -smartcase file_rec/async<cr>
nnoremap <leader>p :DeniteProjectDir file_rec<cr>
nnoremap <leader>P :DeniteProjectDir file_rec/git<cr>
nnoremap <leader>G :DeniteProjectDir grep:::!<cr>


call denite#custom#option('default', 'direction', 'topleft')
call denite#custom#option('_', 'matchers', 'matcher_substring')
call denite#custom#option('_', 'sorters', [])
call denite#custom#option('default', 'cursor_wrap', v:true)

call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('normal', '<Down>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', '<Up>', '<denite:move_to_previous_line>', 'noremap')
" call denite#custom#source('file_mru', 'matchers', ['matcher_cpsm'])
" call denite#custom#source('file_mru', 'sorters', ['sorter_sublime'])
" call denite#custom#source('file_rec', 'matchers', ['matcher_cpsm'])
" call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])

" call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git', ''])

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading', '--sort', 'path'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" call denite#custom#var('buffer', 'show_path', 1)

" nohlsearch for Denite
" current line highlight local
" quickmove str?
" quickmove autoexecute
" exit on empty backspace
" outline is shitty: sorted, no actual outline
" clarify toggle_matchers

hi SpellBad cterm=underline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:webdevicons_enable_denite = 0
let g:deoplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lion_squeeze_spaces = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufRead setl indentkeys-=<:> indentkeys-=:
autocmd BufNewFile,BufRead setl conceallevel=0
autocmd FileType yaml,python setl indentkeys-=<:> indentkeys-=:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if len(glob('$HOME/.vimrc.local')) | source $HOME/.vimrc.local | endif
