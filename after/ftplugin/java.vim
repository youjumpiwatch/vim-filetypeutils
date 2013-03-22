setlocal path=.

let b:jars = split(globpath(getcwd().'/libs', '**/*.jar'),'\n')
let b:cps=split($CLASSPATH,':')
if !empty(b:jars)
	for b:jar in b:jars
		if index(b:cps, b:jar)==-1
			call add(b:cps, b:jar)
		endif
	endfor
endif
let $CLASSPATH=join(b:cps, ':')

function! IncludeExpr(name)
	if stridx(a:name, 'java') == 0 ||  stridx(a:name, 'android') == 0
		return ''
	endif

	let b:fileNameWithoutExt = substitute(a:name,'\.','/','g')
	return globpath(&path, '**/'.b:fileNameWithoutExt.&suffixesadd)
endfunction
setlocal include=^\\s*import
setlocal includeexpr=IncludeExpr(v:fname)
