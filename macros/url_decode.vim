function! Url_decode()
    silent s#\c\zs%\([0-9a-f]\{2}\)#\=nr2char(Base16tobase10(submatch(1)))#ge
endfunction

function! Base16tobase10(str_nr)
    let _b16_ = tolower(a:str_nr)
    let _ret_ = 0
    for i in split(_b16_, '\zs')
	let _ret_ = _ret_ * 16
	let _ret_ += (i =~ '[a-z]' ? (char2nr(i) - char2nr('a') + 10) : (char2nr(i) - char2nr('0')))
    endfor
    return _ret_
endfunction
call Url_decode()

function! HTMLEntity2Char()
    '<,'>s#&\#\(\d\+\);#\=nr2char(submatch(1))#ge
    '<,'>s/&ldq\(uo\|o\)\?;/“/ge
    '<,'>s/&rdq\(uo\|o\)\?;/”/ge
    '<,'>s/&lsq\(uo\|o\)\?;/‘/ge
    '<,'>s/&rsq\(uo\|o\)\?;/’/ge
    '<,'>s/&he\?lli\?p;/…/ge
    '<,'>s/&dash;/—/ge
    &ldqo;
endfunction
