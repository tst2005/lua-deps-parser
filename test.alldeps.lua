local deb = require "debversion"
local tprint=require"tprint"
local function out(result, i, line)
	print(i, result and tprint(result) or "ERROR", line)
end

local fd = io.stdin
local i = 0
while true do
	i=i+1
	local line = fd:read("*l")
	if not line then break end

	out(deb(line), i, line)
end
