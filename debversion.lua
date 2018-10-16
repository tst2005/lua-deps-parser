local lpeg = require "lpeg"
local re = require "re"

-- foo
-- foo ( op value )
-- foo ( op value ), foo ( op2 value2 )
-- git (>= 1:1.7) | mercurial | bzr (>= 1.5~) | darcs, debconf (>= 0.5) | debconf-2.0, python:any (<< 2.8), python:any (>= 2.7.5-5~)

local gram = re.compile[[
	gram <- items !.
	items <- {| item (',' item )* |}
	anyspace <- ' '*
	item <- {| subitem ('|' subitem )* |}
	subitem <- {|
		anyspace
		{ name }
		anyspace
		vgroup?
		anyspace
	|}
	vgroup <- '(' anyspace constraint anyspace ')'
	constraint <- { op } anyspace { version }
	name <- [^ <>()=,]+
	op <- ( '<=' / '>=' / '<~' / '<<' / '>>' / '<' / '>' / '=' )
	version <- ([^ %nl,()])+
]]

return function(data)
	return gram:match(data)
end
