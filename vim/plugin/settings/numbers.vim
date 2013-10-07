let g:enable_numbers = 0

" Alternate methods that are guaranteed to work.
function! RelativeNumbersOn()
  set nonumber
  set relativenumber
endfunc

function! RelativeNumbersOff()
  set norelativenumber
  set number
endfunc

