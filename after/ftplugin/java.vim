setlocal include=^\\s*import
setlocal includeexpr='src/'.substitute(v:fname,'\\.','/','g')

let b:jars = split(globpath(getcwd(), '**/*.jar'),'\n')
let b:cps=split($CLASSPATH,':')
for b:jar in b:jars
	if index(b:cps, b:jar)==-1
		call add(b:cps, b:jar)
	endif
endfor
let $CLASSPATH=join(b:cps, ':')
