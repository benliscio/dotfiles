" Small default height for CommandT
let g:CommandTMaxHeight=20
let g:CommandTMaxFiles=20000

" Make ESC work in CommandT while in terminal Vim
if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap=['<ESC>']
end

let g:CommandTWildIgnore=&wildignore . ",*/node_modules/*,*/tmp/*"

let g:ctrlp_max_files=1000000
let g:ctrlp_max_depth=60
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git\|build'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_cmd = 'CtrlPMixed'
