"""""""""""""""""""""""""""""""""""
" SWAP BETWEEN HEADER AND C FILES "
    """""""""""""""""""""""""""""""""""
function! SwapSourceFile(cmd)
    let curfile = split(@%, '\.')
    if len(curfile) > 1
    if curfile[1] == "c" || curfile[1] == "cc"
    let target = "h"
    elseif curfile[1] == "h"
    let target = "c"
    elseif curfile[1] == "hpp"
    let target = "cpp"
    elseif curfile[1] == "cpp"
    let target = "hpp"
    else
    echo "Unrecognized file type"
    return
    endif
    execute a:cmd . " " .  curfile[0] . "." . target
    endif
    endfunction
