local debversion = require "debversion"

local x
local data = "python ( < 2.8 ),foo(>=1.2.3)"
x = debversion(data)
print(data, "parsed:", require"tprint"(x))

--x = debversion("python:any ( << 2.8 ), python:any ( >= 2.7.5-5~ )")
