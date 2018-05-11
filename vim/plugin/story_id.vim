" inserts [#SID] into your commit message,
" assuming your branches follow the naming scheme: SID_description
function! InsertStoryId()
  let sid_command = "mi"                           " mark current position

  let sid_command = sid_command."\/On branch\<CR>" " move to line with branch name
  let sid_command = sid_command."ww"               " move to first char of story #
  let sid_command = sid_command."yt_"              " yank the story #
  let sid_command = sid_command."\/^#\<CR>gg"      " move to first #... line
  let sid_command = sid_command."O"                " add blank line in insert mode
  let sid_command = sid_command."[#\<esc>pA] "     " insert [#SID]
  let sid_command = sid_command."\<esc>"           " switch to normal mode

  exec "normal! ".sid_command
endfunction

command! Sid :call InsertStoryId()
