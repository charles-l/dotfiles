""""""""""""""""""
" UTIL FUNCTIONS "
""""""""""""""""""
function! Chomp(str)
    return substitute(a:str, '\n$', '', '')
endfunction


""""""""""""""""""
" FILE SEARCHING "
""""""""""""""""""
"Shamelessly taken from http://leafo.net/posts/using_dmenu_to_open_quickly.html
"Modified to allow for Ctrl-P if dmenu isn't installed.
function! DmenuOpen(cmd)
    "If in git repo, search get. Else recursive search. find is insanely fast.
    if filereadable("/bin/dmenu") || filereadable("/usr/bin/dmenu")
        if strlen(Chomp(system("[ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1"))) > 0
            echo "Finding in git repo"
            let fname = Chomp(system("git ls-files | dmenu -i -l 20 -p " . a:cmd))
        else
            echo "Finding in all subdirectories"
            let fname = Chomp(system("find . -not -iwholename '*.git*'| dmenu -i -l 20 -p " . a:cmd))
        end
        if empty(fname)
            return
        endif
        execute a:cmd . " " . fname
    else
        :CtrlPMixed
    end
endfunction