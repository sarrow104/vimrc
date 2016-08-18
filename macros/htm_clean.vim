silent %s###ge
silent %s#\c<script\_.\{-}</script>##ge
silent %s#\c<o:p></o:p>##ge
silent g#^\s*$#d

" 2011-02-20
function! s:UniqueStyle(line1, line2)
    let _current_line_ = line(".")
    let _ret_ = {}
    execute a:line1
    let pattern = '\cstyle="\zs.\{-}\ze"'
    while search(pattern, 'cW', a:line2) > 0
	normal ma
	call search(pattern, 'cWe', a:line2)
	normal mb
	normal `av`by
	let _key_ = @"
	if !has_key(_ret_, _key_)
	    let _ret_[_key_] = 1
	else
	    let _ret_[_key_] += 1
	endif
	normal `b
    endwhile

    if !empty(_ret_)
	let @+ = "<style type=\"text/css\">\n"
	let id = 0
	for key in keys(_ret_)
	    let class_name = 'vim_cleand_'.id
	    let id+= 1
	    execute 'silent %s#\cstyle="'.escape(key, '#').'"#class="'.class_name.'"#ge'
	    let @+ .= '.'.class_name.' {'.key.'}'."\n"
	endfor
	let @+ .= "</style>\n"
	silent %s#\c\ze</head>#\=@+#ge
    endif

    execute _current_line_
endfunction

call s:UniqueStyle(1, line('$'))

"w
"bd
