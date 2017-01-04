let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/csssr/csi
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +27 ~/.tmux.conf
badd +726 ~/.vimi/.vim/init.vim
badd +71 ~/csssr/mg/api/api.js
badd +1 ~/csssr/de/de-auth/src/storage/user/user.ts
badd +1 ~/csssr/de/de-auth/src/classes/hasher/hasher.ts
badd +9 ~/csssr/de/de-auth/package.json
badd +1 ~/csssr/de/de-auth/.env
badd +8 ~/csssr/de/de-auth/src/config.ts
badd +8 ~/csssr/de/de-auth/src/server.ts
badd +1 ~/csssr/de/de-auth/src/main.ts
badd +1 ~/csssr/de/de-auth/src/mongoose.ts
badd +1 ~/csssr/de/de-auth/src/controllers/authentication.ts
badd +1 ~/csssr/de/de-auth/src/controllers/index.ts
badd +1 ~/csssr/de/de-auth/src/controllers/registration.ts
badd +11 ~/csssr/de/de-auth/src/classes/validator/validator.ts
badd +13 ~/csssr/de/de-auth/src/classes/user_registrator/user_registrator_spec.ts
badd +13 ~/csssr/de/de-auth/src/classes/user_registrator/user_registrator.ts
badd +3 ~/csssr/de/de-notification/dist/sample/robot.ts
badd +1 ~/csssr/de/de-notification/dist/sample/robot_spec.ts
badd +13 ~/csssr/de/de-notification/webpack.config.js
badd +16 ~/csssr/de/de-notification/package.json
badd +1 ~/csssr/de/de-notification/dist/controllers/index.ts
badd +1 ~/csssr/de/de-notification/src/classes/user/user.ts
badd +1 ~/csssr/de/de-notification/src/classes/user_registrator/user_registrator.ts
badd +1 ~/csssr/de/de-notification/src/controllers/authentication.ts
badd +1 ~/csssr/de/de-notification/src/controllers/index.ts
badd +3 ~/csssr/de/de-notification/src/sample/robot.ts
badd +1 ~/csssr/de/de-notification/src/sample/robot_spec.ts
badd +34 ~/csssr/de/de-notification/src/server.ts
badd +1 ~/csssr/de/de-notification/backend.js
badd +1 ~/csssr/de/de-notification/.env.example
badd +5 ~/csssr/de/de-notification/.env
badd +9 ~/csssr/de/de-notification/.editorconfig
badd +1 src/classes/user_registrator/user_registrator.ts
badd +1 ~/csssr/de/de-notification/src/storage/user/user.ts
badd +7 ~/csssr/de/de-notification/src/storage/notification/notification_repository.ts
badd +20 src/storage/user/user.ts
badd +82 src/client.js
badd +62 src/helpers/socket.js
badd +1 ~/csssr/relef/src/components/Content/Content.styl
badd +56 ~/csssr/relef/src/components/NewsContent/NewsContent.styl
badd +1 ~/csssr/relef/src/containers/NewsDetail/index.js
badd +43 ~/csssr/relef/src/containers/NewsDetail/NewsDetail.jsx
badd +1 ~/csssr/relef/src/components/ContentWrapper/ContentWrapper.styl
badd +17 src/routes/index.js
argglobal
silent! argdel *
argadd ~/.tmux.conf
edit ~/csssr/relef/src/components/ContentWrapper/ContentWrapper.styl
set splitbelow splitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 1 - ((0 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOI
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
