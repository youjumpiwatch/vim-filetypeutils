setlocal include=^\\s*import

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
