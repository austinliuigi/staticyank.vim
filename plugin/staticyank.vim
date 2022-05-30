if exists("g:loaded_staticyank")
    finish
endif
let g:loaded_staticyank = 1

function! s:StorePreYankPos()
    let s:pre_yank_pos = getcurpos('.')
    let s:reg = v:register
endfunction

function! s:StaticYank(type)
    let commands = #{char: "`[v`]\"".s:reg."y", line: ":'[,']y ".s:reg."\<CR>", block: "`[\<C-v>`]\"".s:reg."y"}
    silent exe "keepjumps normal! " . get(commands, a:type, '')
    " echo get(commands, a:type, '')
    call setpos('.', s:pre_yank_pos)
endfunction

noremap <expr><silent> <Plug>StaticYank '<cmd>call <SID>StorePreYankPos()<CR>' . '<cmd>set operatorfunc=<SID>StaticYank<CR>' . v:count1 . 'g@'
" nnoremap <expr><silent> <Plug>StaticYank '<cmd>call <SID>StorePreYankPos()<CR>' . '<cmd>set operatorfunc=<SID>StaticYank<CR>' . v:count1 . 'g@'
" xnoremap <expr><silent> <Plug>StaticYankVisual '<cmd>call <SID>StorePreYankPos()<CR>' . '<cmd>set operatorfunc=<SID>StaticYank<CR>' . v:count1 . 'g@'
nnoremap <Plug>StaticYankLine yy

let g:static_yank_disable = exists("g:static_yank_disable") ? g:static_yank_disable : 0

if !g:static_yank_disable
    map y <Plug>StaticYank
    nmap yy <Plug>StaticYankLine
endif
