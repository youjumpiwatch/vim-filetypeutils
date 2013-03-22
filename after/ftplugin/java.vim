setlocal path=**

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

function! s:IncludeExpr(name)
	let b:fileNameWithoutExt = substitute(a:fname,'\\.','/','g')
	return globpath(&path, '**/'.b:fileNameWithoutExt.'.java')
endfunction
setlocal include=^\\s*import\\s\+
setlocal includeexpr=s:IncludeExpr(v:fname)
