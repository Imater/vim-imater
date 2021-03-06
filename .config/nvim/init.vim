"=============================================================================
" Description: Vimi bundle .vimrc
" Author: Vyacheslav Oliyanchuk <miripiruni@gmail.com>
" URL: http://github.com/miripiruni/vimi/
"=============================================================================

" Make Vim more useful
set nocompatible

call mappings#bind()
call plugins#bind()
call visual#bind()

" Interface
" Character encoding used inside Vim
" Only available when compiled with the +multi_byte feature
set encoding=utf-8
" Character encodings considered when starting to edit an existing file
" Only available when compiled with the +multi_byte feature
set fileencodings=utf-8,cp1251
" Always add lf in the end of file
set fileformat=unix
" Enhance command-line completion
" Only available when compiled with the +wildmenu feature
set wildmenu
" Set completion mode
" When more than one match, list all matches and complete first match
" Then complete the next full match
set wildmode=list:longest,full
" Ignore following files when completing file/directory names
" Version control
set wildignore+=.hg,.git,.svn
" OS X
set wildignore+=*.DS_Store
" Python byte code
set wildignore+=*.pyc
" Binary images
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
" Set title of the window to filename [+=-] (path) - VIM
" Only available when compiled with the +title feature
" set title
" Show (partial) command in the last line of the screen
" Comment this line if your terminal is slow
" Only available when compiled with the +cmdline_info feature
set showcmd
" Minimal number of lines to scroll when cursor gets off the screen
" set scrolljump=5
" Minimal number of lines to keep above and below the cursor
" Typewriter mode = keep current line in the center
set scrolloff=4
" Always show tabs
" set showtabline=2
" Display invisible characters
set list
if version >= 700
  " tab:▸\ ,
  set listchars=tab:  ,trail:·,extends:❯,precedes:❮,nbsp:×
else
  set listchars=tab:  ,trail:·,extends:>,precedes:<,nbsp:_
endif
" Wrap long lines
set wrap
" Don't break words when wrapping
" Only available when compiled with the +linebreak feature
" set linebreak
" Show ↪ at the beginning of wrapped lines
" if has("linebreak")
"     let &sbr = nr2char(8618).' '
" endif
" Number of column to be highlighted
" Only available when compiled with the +syntax feature
if version >= 703
  set colorcolumn=120
end
" Maximum width of text that is being inserted
" Longer lines will be broken after white space to get this width
set textwidth=920
" Copy indent from current line when starting a new line
set autoindent
" Do smart indenting when starting a new line
" Only available when compiled with the +smartindent feature
" set smartindent
" Number of spaces to use for each step of (auto)indent
set shiftwidth=2
" Use spaces instead of tab
set expandtab
" Number of spaces that a tab counts for
set tabstop=2
" Number of spaces that a tab counts for while performing editing operations
set softtabstop=2
" Number of pixel lines inserted between characters
" Only in GUI
set linespace=1
" Highlight the screen line of the cursor
" Only available when compiled with the +syntax feature
set cursorline
" Turn off cursor blinking in normal mode
" Only available when compiled with GUI enabled
set guicursor=n:blinkon0
" Remove all components and options of the GUI
" Only available when compiled with GUI enabled
set guioptions=
" Number of colors
set t_Co=256
" Splitting a window will put the new window below the current one
" See :sp
" Only available when compiled with the +windows feature
set splitbelow
" Splitting a window will put the new window right of the current one
" See :vsp
" Only available when compiled with the +vertsplit feature
set splitright
" Don't show the intro message starting Vim
set shortmess+=I
" Turn mouse pointer to a up-down sizing arrow
" Only available when compiled with the +mouseshape feature
set mouseshape=s:udsizing,m:no
" Hide the mouse when typing text
" Only works in GUI
set mousehide
" Edit several files in the same time without having to save them
set hidden

" No beeps, no flashes
set visualbell
set t_vb=
" List of directories which will be searched when using :find, gf, etc.
" Search relative to the directory of the current file
" Search in the current directory
" Search downwards in a directory tree
" Only available when compiled with the +path_extra feature
set path=/src,.,,**,

" Status line
function! FileSize()
  let bytes = getfsize(expand("%:p"))
  if bytes <= 0
    return ""
  endif
  if bytes < 1024
    return bytes . "B"
  else
    return (bytes / 1024) . "K"
  endif
endfunction

function! CurDir()
  return expand('%:p:~')
endfunction

" Last window always has a status line
set laststatus=2
" Content of the status line
" Only available when compiled with the +statusline feature
set statusline=\
" Buffer number
" set statusline+=%n:\
" File name
set statusline+=%t
" Modified flag
set statusline+=%m
set statusline+=\ \
" Paste mode flag
set statusline+=%{&paste?'[paste]\ ':''}
" File encoding
" set statusline+=%{&fileencoding}
" Type of file
" Only available when compiled with the +autocmd feature
" set statusline+=\ \ %Y
" Column number
set statusline+=\ %3.3(%c%)
" Current line / number of lines in buffer
set statusline+=\ \ %3.9(%l/%L%)
" Percentage through file in lines
" set statusline+=\ \ %2.3p%%
" File size
set statusline+=\ \ %{FileSize()}
" Truncate here if line is too long
set statusline+=%<
" Path to the file
set statusline+=\ \ CurDir:%{CurDir()}

" Create encodings menu
menu Encoding.UTF-8 :e ++enc=utf8 <CR>
menu Encoding.Windows-1251 :e ++enc=cp1251<CR>
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>

" Spell checking
if version >= 700
  " Turn off spell checking
  set nospell
  menu Spell.off :setlocal spell spelllang= <cr>
  menu Spell.Russian+English :setlocal spell spelllang=ru,en <cr>
  menu Spell.Russian :setlocal spell spelllang=ru <cr>
  menu Spell.English :setlocal spell spelllang=en <cr>
  menu Spell.-SpellControl- :
  menu Spell.Word\ Suggest<Tab>z= z=
  menu Spell.Previous\ Wrong\ Word<Tab>[s [s
  menu Spell.Next\ Wrong\ Word<Tab>]s ]s
endif

" Folding
" za = toggle current fold
" zR = open all folds
" zM = close all folds
" From https://github.com/sjl/dotfiles/blob/master/vim/.vimrc
function! MyFoldText()
  let line = getline(v:foldstart)
  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart
  " expand tabs into spaces
  let onetab = strpart(' ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')
  let line = strpart(line, 0, windowwidth - 2 - len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
set foldtext=MyFoldText()
" Lines with equal indent form a fold
set foldmethod=syntax
" Maximum nesting of folds
" Only available when compiled with the +folding feature
set foldnestmax=10
" All folds are open
" Only available when compiled with the +folding feature
set nofoldenable
" Folds with a higher level will be closed
" Only available when compiled with the +folding feature
set foldlevel=1
" Remove the extrafills --------
" Only available when compiled with the +windows and +folding features
set fillchars="fold: "

" Search
" While typing a search command, show pattern matches as it is typed
" Only available when compiled with the +extra_search feature
set incsearch
" When there is a previous search pattern, highlight all its matches
" Only available when compiled with the +extra_search feature
set hlsearch
" Ignore case in search patterns
set ignorecase
" Override the 'ignorecase' if the search pattern contains upper case characters
set smartcase
" All matches in a line are substituted instead of one
set gdefault


set iminsert=0
set imsearch=0


" Environment
" Store lots of history entries: :cmdline and search patterns
set history=1000
" Save file with root permissions
" command! W exec 'w !sudo tee % > /dev/null' | e!

" Backspacing settings
" start     allow backspacing over the start of insert;
"           CTRL-W and CTRL-U stop once at the start of insert.
" indent    allow backspacing over autoindent
" eol       allow backspacing over line breaks (join lines)
set backspace=indent,eol,start

" Backup и swp files
" Don't create backups
set nobackup
" Don't create swap files
set noswapfile

set cpoptions+=$
" set virtualedit=all
" Load previous session
" Only available when compiled with the +viminfo feature
set viminfo='10,\"100,:20,%
" Set cursor to its last position
" au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" AutoReload .vimrc
" See http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
" Source the vimrc file after saving it
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif

" Go to last file(s) if invoked without arguments
" http://vimcastsim.wikia.com/wiki/Open_the_last_edited_file
"    autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
"        \ call mkdir($HOME . "/.vim") |
"        \ endif |
"        \ execute "mksession! " . $HOME . "/.vim/Session.vim"
"    autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
"        \ execute "source " . $HOME . "/.vim/Session.vim"

" Auto change the directory to the current file I'm working on
" autocmd BufEnter * lcd %:p:h

" Save on losing focus
" Only available for GUI
" autocmd FocusLost * :wa


" Resize splits when the window is resized
" Only available for GUI
au VimResized * exe "normal! \<c-w>="

" File specific
autocmd FileType jade setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Plugins

" Javascript
" let g:syntastic_check_on_open = 1
" let g:syntastic_less_checkers = ['']
" let g:syntastic_jsx_checkers = ['eslint']
" let g:syntastic_js_checkers = ['eslint']
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
" let g:syntastic_javascript_flow_exe = '$(npm bin)/flow'
" let g:syntastic_loc_list_height=10
" let g:syntastic_javascript_checkers = ['jsxhint']
" let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" Solarized
syntax enable
" http://stackoverflow.com/questions/7278267/incorrect-colors-with-vim-in-iterm2-using-solarized#comment11144700_7278548
let g:solarized_termcolors=16
set background=light
try
  colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
  echo "Solarized theme not found. Run :BundleInstall"
endtry
" colorscheme base16-colors
" colorscheme molokai
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256

try
  call togglebg#map("<Leader>bs")
catch /^Vim\%((\a\+)\)\=:E117/
  " :(
endtry

" Zen Coding
let g:user_zen_settings = {
      \  'php' : {
      \    'extends' : 'html',
      \    'filters' : 'c',
      \  },
      \  'xml' : {
      \    'extends' : 'html',
      \  },
      \  'haml' : {
      \    'extends' : 'html',
      \  },
      \}

" UltiSnips
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsListSnippets = "<s-tab>"

" VimWiki
let wiki = {}
let wiki.path = '~/Dropbox/vimwiki/'
let wiki.nested_syntaxes = {'javascript': 'javascript', 'python': 'python', 'c++': 'cpp'}

let g:vimwiki_list = [wiki]

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/bower_components/*,*/node_modules/*
" set nonumber
" set relativenumber
" first, enable status line always
set laststatus=2
"
" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif
"
" nnoremap ; :
set guitablabel=\[%N\]\ %t\ %M
set ttyfast
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_powerline_fonts=0
"


" let g:airline#extensions#tabline#enabled = 0
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#right_sep = ' '
" let g:airline#extensions#tabline#right_alt_sep = '|'
" let g:airline_left_sep = ' '
" let g:airline_left_alt_sep = '|'
" let g:airline_right_sep = ' '
" let g:airline_right_alt_sep = '|'
" let g:airline_theme= 'serene'
"
" au InsertLeave * hi Cursor guibg=red
" au InsertEnter * hi Cursor guibg=green
set guifont=Menlo\ for\ Powerline:h14
let g:plantuml_executable_script='java -jar ~/plantuml.jar'


autocmd FileType javascript noremap <buffer>  <F6> <Esc>magg=G`a
autocmd FileType typescript noremap <buffer>  <F6> <Esc>magg=G`a
" autocmd FileType javascript noremap <buffer>  <F6> <Esc>:call JsBeautify()<cr>
" autocmd FileType less noremap <buffer>  <F6> <Esc>:call CSSBeautify()<cr>
autocmd FileType less noremap <buffer>  <F6> <Esc>magg=G`a
autocmd FileType go noremap <buffer>  <F6> <Esc>magg=G`a
autocmd FileType html noremap <buffer>  <F6> <Esc>:call HTMLBeautify()<cr>
autocmd FileType wiki noremap <buffer>  <F6> <Esc>:call HTMLBeautify()<cr>
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlP'
" Setup some default ignores
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|node_modules|blueprints|.happypack|coverage|bower_components|assets|build|dist|server\logs|upload)$',
      \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
      \}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

set ts=2 sw=2 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:buffergator_suppress_keymaps=1

" inoremap ;; <C-o>m`<C-o>A;<C-o>``
autocmd FileType javascript,css,YOUR_LANG nnoremap <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css,YOUR_LANG inoremap <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>
let g:tern_map_keys=1
" call tern#Enable()
let g:tern_map_keys=1
" let g:tern_show_argument_hints='on_hold'
let g:vcoolor_map = 'ç'
au FileType go map <leader>r :!go run %<CR>
let NERDTreeAutoDeleteBuffer=1
" Markdown
let g:markdown_fenced_languages = ['JavaScript', 'HTML', 'go']
let g:markdown_github_languages = ['JavaScript', 'HTML', 'go']
" au BufNewFile,BufRead *.wiki setf markdown

" let hour = strftime("%H")
" if 18 <= hour && hour < 20
"   set background=light
" else
"   set background=dark
" endif

set nonumber
set relativenumber

let g:emmet_html5=1
let g:user_emmet_settings = {
      \    'html': {
      \        'quote_char': "'",
      \        'snippets': {
      \            'im': "import from |",
      \        },
      \    },
      \    'jsx': {
      \        'extends': 'html',
      \        'attribute_name': {'class': 'className'},
      \    },
      \    'stylus': {
      \        'extends': 'css',
      \    },
      \}
let g:user_emmet_expandabbr_key='<Home>'

" Changing cursor shape per mode
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
if exists('$TMUX')
  " tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
  let &t_SI .= "\<Esc>]50;CursorShape=1\x7"
  let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
  autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[0 q\033\\"
else
  let &t_SI .= "\<Esc>]50;CursorShape=1\x7"
  let &t_EI .= "\<Esc>[2 q"
  autocmd VimLeave * silent !echo -ne "\033[0 q"
endif

" autocmd FocusLost * :set number
" autocmd FocusGained * :set relativenumber

" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber
set lazyredraw
set timeoutlen=500 ttimeoutlen=0
:autocmd InsertEnter * set timeoutlen=200
:autocmd InsertLeave * set timeoutlen=500
" let g:airline_theme='cool'

" set nofoldenable
" let g:airline#extensions#tabline#enabled = 0

let g:hardtime_default_on = 0
let g:hardtime_timeout = 1000
let g:list_of_insert_keys = []
let g:hardtime_ignore_buffer_patterns = [ "CustomPatt[ae]rn", "NERD.*", "help", "gitcommit" ]
let g:NERDTreeHijackNetrw=0
let g:hardtime_ignore_quickfix = 1
let g:hardtime_maxcount = 3

"toggl
call ctrlp_bdelete#init()
let g:ctrlp_open_multiple_files='2vjr'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
" <Leader>f{char} to move to {char}
let autowriteall=1
set suffixesadd+=.js
set suffixesadd+=.jsx
set path+=$PWD/node_modules
set path+=$PWD/src
set number
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
cnoreabbrev Ack Ack!
execute pathogen#infect()
let g:flow#enable = 0

au BufNewFile,BufRead *.js set syntax=javascript.jsx
au BufNewFile,BufRead *.styl set filetype=css.stylus
au BufNewFile,BufRead *.sss set filetype=css.stylus.sugarss
" set clipboard=unnamed

let g:calendar_monday = 1

highlight htmlArg cterm=italic

" autocmd VimEnter * silent NERDTree
let g:netrw_browse_split = 0
" autocmd FileType netrw setl bufhidden=delete
set nohidden

augroup netrw_buf_hidden_fix
    autocmd!

    " Set all non-netrw buffers to bufhidden=hide
    autocmd BufWinEnter *
                \  if &ft != 'netrw'
                \|     set bufhidden=hide
                \| endif

augroup end
let g:toggl_api_token ='d990c0fb76de4364d65c83b36f7cad24'









" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <C-space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <C-space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <C-space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <C-space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <C-space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <C-space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <C-space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <C-space>p  :<C-u>CocListResume<CR>
