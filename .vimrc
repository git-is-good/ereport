function! ReplaceGoogle()
    " in visual mode, <','> is automatically provided
    " :s/.../e use e to ignore error
    :s/\\ /\\/ge

    " \Pi is special
    ":'<,'>s/\\[a-zA-Z]*/\L\0/ge
    :'<,'>s/\\[a-zA-Z]\+/\= submatch(0) == "\\Pi" ? "\\Pi" : tolower(submatch(0))/ge

    :'<,'>s/_ /_/ge
endfunction

function! Append(appendee)
    exe 's/\n/' . a:appendee . '\r/g'
endfunction

function! FindReplace(rer, ree)
    exe 's/' . a:rer . '/' . a:ree . '/gc'
endfunction

function! EchoHelo(str)
    if a:str == toupper(a:str)
        let result = "==> " . a:str
    elseif a:str == tolower(a:str)
        let result = "--> " . a:str
    else
        let result = "-<>- " . substitute(a:str, 'o', 'ss', 'g')
    endif
    :echo result
endfunction

function! AllToSmall()
    :%s/.*/\L\0/g
endfunction


function! ShowInfo()
    echo [getpos("'<"), getpos("'<")]
endfunction

function! EchoPos()
    echo getpos(".")
endfunction

function! GetVisualSelection()
    let lines = getline(line_start, line_end)
    echo lines
endfunction


function! SetThisLine(text)
    let curline = getpos(".")[1]
    let oldtext = getline(curline)
    call setline(curline, a:text)
endfunction

