func! plugins#configure()
  " NERDTree
  nmap <F12> :NERDTreeToggle<CR>
  let g:NERDTreeShowBookmarks=1
  let g:NERDTreeChDirMode=1
  let g:NERDTreeQuitOnOpen=0
  let g:NERDTreeShowHidden=1
  let g:NERDTreeKeepTreeInNewTab=0
  " Disable display of the 'Bookmarks' label and 'Press ? for help' text
  let g:NERDTreeMinimalUI=1
  " Use arrows instead of + ~ chars when displaying directories
  let g:NERDTreeDirArrows=1
  let g:NERDTreeBookmarksFile= $HOME . '/.config/nvim/.NERDTreeBookmarks'
  " {{{ nerd*
  let g:NERDCreateDefaultMappings = 1
  let g:NERDCompactSexyComs = 1
  let g:NERDSpaceDelims = 1
  let g:NERDRemoveExtraSpaces = 1
  " }}}

  " {{{ vim-bookmarks
  let g:bookmark_sign = '♥'
  let g:bookmark_highlight_lines = 1
  let g:bookmark_auto_close = 1
  let g:bookmark_center = 1
  let g:bookmark_save_per_working_dir = 1
  let g:bookmark_auto_save = 1
  " let g:bookmark_no_default_key_mappings = 1
  " }}}

  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_typescript_tsc_maker = {
        \ 'args': [
        \ '-m', 'commonjs', '--noEmit', '--target', 'ES5', '--experimentalDecorators'
        \ ],
        \ 'errorformat':
        \ '%E%f %#(%l\,%c): error %m,' .
        \ '%E%f %#(%l\,%c): %m,' .
        \ '%Eerror %m,' .
        \ '%C%\s%\+%m'
        \ }
  let g:neomake_typescript_enabled_makers = ['tsc']


  " {{{ neomake
  let g:neomake_open_list=0
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_jsx_enabled_makers = ['eslint']
  let g:neomake_logfile = '/usr/local/var/log/neomake.log'
  let g:neomake_javascript_eslint_exe = './node_modules/.bin/eslint'
"   let g:neomake_javascript_eslint_maker = {
"     \ 'args': ['--env', 'es6', '--no-color', '--format', 'compact', '--config', $PWD . '/.eslintrc'],
"     \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,%W%f: line %l\, col %c\, Warning - %m'
"     \ }
  autocmd! BufWritePost * Neomake
  autocmd! BufEnter * Neomake
  let g:neomake_autolint_enabled = 0
  let g:neomake_autolint_sign_column_always = 0
  " }}}

  let g:jsx_ext_required = 0 " Allow JSX in normal JS files
  let g:javascript_plugin_flow = 1

  " {{{ deoplete
  let g:deoplete#enable_at_startup = 1

  let g:tern_request_timeout = 1
  let g:tern#arguments = ["--persistant"]
  let g:deoplete#auto_completion_start_length = 2
  let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

  " Add extra filetypes
  let g:tern#filetypes = [
        \ 'jsx',
        \ 'js',
        \ 'javascript.jsx',
        \ 'vue'
        \ ]
  " }}}

  " {{{ vimwiki
  let s:vimwiki_autowriteall=1
  " }}}

  " {{{ easymotion
  map  <Leader>f <Plug>(easymotion-bd-f)
  nmap <Leader>f <Plug>(easymotion-overwin-f)
  "
  " " s{char}{char} to move to {char}{char}
  nmap <Leader><space> <Plug>(easymotion-overwin-f2)
  "
  " " Move to line
  map <Leader>L <Plug>(easymotion-bd-jk)
  nmap <Leader>L <Plug>(easymotion-overwin-line)
  "
  " " Move to word
  map  <Leader>w <Plug>(easymotion-bd-w)
  nmap <Leader>w <Plug>(easymotion-overwin-w)
  " }}}
  " {{{ startify screen
  func! s:filter_header(lines) abort
    let l:longest_line = max(map(copy(a:lines), 'len(v:val)'))
    let l:centered_lines= map(copy(a:lines),
      \ 'repeat(" ", (&columns / 2) - (l:longest_line / 2)) . v:val')
    return l:centered_lines
  endfunc
  " let s:custom_header =
  "   \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','', split(system('~/csssr/earn.sh'), '\n')[0], '', '']
	" let g:startify_custom_header = [split(system('~/csssr/earn.sh'), '\n')[0]] + ['', '']
  " let g:startify_custom_header = s:filter_header(s:custom_header)
  let g:startify_files_number = 10
  let g:startify_change_to_dir = 0
  let g:startify_change_to_vcs_root = 0
  let g:startify_relative_path = 1
  let g:startify_bookmarks = [
        \ '~/.config/nvim/autoload/plugins.vim',
        \ '~/csssr/earnToday.sh',
        \ '~/.config/nvim/autoload/mappings.vim',
        \ '~/.bashrc',
        \ '~/.tmux.conf'
        \ ]
  let g:startify_session_dir = '~/.config/nvim/sessions'
  let g:startify_session_autoload = 1
  let g:startify_session_persistence = 1
  " }}}
  " {{{ indent
  let g:indent_guides_guide_size = 2
  let g:indent_guides_start_level = 2
  let g:indent_guides_color_change_percent = 2
  let g:indent_guides_enable_on_vim_startup = 0
  let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify', 'tagbar']
  " }}}

endfunc

func! plugins#define()

  call plug#begin('~/.config/nvim/plugged')
  Plug 'neomake/neomake'
  Plug 'mattesgroeger/vim-bookmarks'
  " Plug 'mxw/vim-jsx'
  " Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'benjie/neomake-local-eslint.vim'
  Plug 'dojoteef/neomake-autolint'
  Plug 'leafgarland/typescript-vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'lifepillar/vim-cheat40'
  Plug 'vimlab/split-term.vim'
  " Libs
  Plug 'lfilho/cosco.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'takac/vim-hardtime'
  Plug 'termoshtt/toggl.nvim'
  Plug 'j5shi/ctrlp_bdelete.vim'
  Plug 'vim-jp/vital.vim'
  Plug 'vim-scripts/HJKL'
  Plug 'git://github.com/aklt/plantuml-syntax'
  " Interface
  Plug 'git://github.com/bling/vim-airline'
  Plug 'git://github.com/vim-airline/vim-airline-themes'
  Plug 'git://github.com/jeetsukumaran/vim-buffergator'
  Plug 'godlygeek/tabular'
  Plug 'git://github.com/flowtype/vim-flow.git'
  Plug 'ixandidu/vim-markdown'
  Plug 'amiorin/vim-fenced-code-blocks'
  Plug 'git://github.com/ctrlpvim/ctrlp.vim'
  Plug 'git://github.com/tpope/vim-surround'
  Plug 'git://github.com/tpope/vim-repeat'
  " Solarized Colorscheme
  Plug 'git://github.com/altercation/vim-colors-solarized.git'
  Plug 'git://github.com/gorodinskiy/vim-coloresque.git'
  Plug 'chriskempson/base16-vim'
  " A tree explorer plugin
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    \ | Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on':  'NERDTreeToggle' }
    \ | Plug 'low-ghost/nerdtree-fugitive', { 'on':  'NERDTreeToggle' }
    \ | Plug 'xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
    \ | Plug 'jistr/vim-nerdtree-tabs'

  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'git://github.com/ervandew/supertab.git'
  Plug 'git://github.com/powerman/vim-plugin-ruscmd'
  Plug 'git://github.com/vim-scripts/YankRing.vim'
  Plug 'majutsushi/tagbar'
  Plug 'git://github.com/mattn/emmet-vim.git'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'editorconfig/editorconfig-vim'
  " TextMate-like snippets
  Plug 'git://github.com/vim-scripts/UltiSnips.git'
  " RegExp search
  Plug 'git://github.com/mileszs/ack.vim.git'
  " Provides easy code commenting
  Plug 'git://github.com/scrooloose/nerdcommenter.git'
  " Git wrapper
  Plug 'git://github.com/tpope/vim-fugitive.git'
  Plug 'git://github.com/sjl/threesome.vim.git'
  " Bundle 'git://github.com/chrismetcalf/vim-yankring.git'
  Plug 'git://github.com/slack/vim-fuzzyfinder.git'
  Plug 'git://github.com/vim-scripts/vimwiki.git'
  " HTML/HAML
  " HTML5 omnicomplete and syntax
  Plug 'git://github.com/othree/html5.vim.git'
  Plug 'git://github.com/hokaccha/vim-html5validator.git'
  Plug 'git://github.com/tpope/vim-haml.git'
  Plug 'git://github.com/gregsexton/MatchTag.git'
  " CSS/LESS
  " CSS3 syntax support
  Plug 'git://github.com/hail2u/vim-css3-syntax.git'
  " Highlight colors in css files
  Plug 'git://github.com/ap/vim-css-color.git'
  Plug 'git://github.com/groenewege/vim-less.git'
  Plug 'git://github.com/miripiruni/vim-better-css-indent.git'
  Plug 'git://github.com/miripiruni/CSScomb-for-Vim.git'
  Plug 'csslint/csslint'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'KabbAmine/vCoolor.vim'
  Plug 'wavded/vim-stylus'
  " JavaScript
  " Vastly improved vim's javascript indentation
  Plug 'git://github.com/pangloss/vim-javascript.git'
  Plug 'othree/yajs.vim'
  Plug 'maksimr/vim-jsbeautify'
  Plug 'einars/js-beautify'
  " Syntax for jQuery keywords and css selectors
  Plug 'git://github.com/itspriddle/vim-jquery.git'
  " CoffeeScript support
  Plug 'git://github.com/kchmck/vim-coffee-script.git'
  Plug 'git://github.com/walm/jshint.vim.git'
  " JSX
  Plug 'mxw/vim-jsx'
  " JSON
  Plug 'git://github.com/leshill/vim-json.git'
  " Start screen
  " Plug 'mhinz/vim-startify'
  Plug 'kopischke/vim-stay'
  Plug 'postcss/sugarss'
  Plug 'hhsnopek/vim-sugarss'
  Plug 'moll/vim-node'
	" Plug 'ternjs/tern_for_vim'
  Plug 'mattn/webapi-vim'
    \ | Plug 'mattn/gist-vim', { 'on': 'Gist' }

  " Plug 'terryma/vim-multiple-cursors'
  "   \ | Plug 'nathanaelkane/vim-indent-guides'
  "   \ | Plug 'tpope/vim-dispatch'
  "   \ | Plug 'tpope/vim-endwise'
  "   \ | Plug 'tpope/vim-fugitive'
  "   \ | Plug 'tpope/vim-jdaddy', { 'for': 'json' }
  "   \ | Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
  "   \ | Plug 'tpope/vim-repeat'
  "   \ | Plug 'tpope/vim-rhubarb'
  "   \ | Plug 'tpope/vim-rsi'
  "   \ | Plug 'tpope/vim-speeddating'
  "   \ | Plug 'tpope/vim-surround'
  "   \ | Plug 'tpope/vim-vinegar'
  "   \ | Plug 'tpope/vim-abolish'
  "   \ | Plug 'radenling/vim-dispatch-neovim'


  " Add plugins to &runtimepath
  call plug#end()
endfunc

func! plugins#bind()
  call plugins#define()
  call plugins#configure()
  filetype plugin indent on
endfunc
" let g:ctrlp_match_window = 'results:100' " overcome limit imposed by max height
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:30'
