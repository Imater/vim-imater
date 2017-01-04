func! visual#bind()
  let g:airline#extensions#hunks#non_zero_only = 1
  let g:airline#extensions#tabline#enabled = 0
  let g:airline#extensions#tabline#show_splits = 1
  let g:airline#extensions#tabline#show_buffers = 1
  let g:airline#extensions#tabline#show_tabs = 1
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#whitespace#enabled = 1
  let g:airline#extensions#whitespace#mixed_indent_algo = 1
  let g:airline#extensions#whitespace#show_message = 1
  let g:airline#extensions#whitespace#trailing_format = 's:[%s]'
  let g:airline#extensions#whitespace#mixed_indent_format = 'i:[%s]'
  let g:airline#extensions#tagbar#flags = 'f'
  let g:airline_detected_modified = 1
  let g:airline_powerline_fonts = 1
  let g:airline_detect_iminsert = 0
  let g:airline_mode_map = {
              \ '__' : '-',
              \ 'n'  : 'N',
              \ 'i'  : 'I',
              \ 'R'  : 'R',
              \ 'v'  : 'V',
              \ 'V'  : 'B'
              \ }
  let s:custom_header =
              \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

  func! s:filter_header(lines) abort
      let l:longest_line = max(map(copy(a:lines), 'len(v:val)'))
      let l:centered_lines= map(copy(a:lines),
                  \ 'repeat(" ", (&columns / 2) - (l:longest_line / 2)) . v:val')
      return l:centered_lines
  endfunc
endfunc
