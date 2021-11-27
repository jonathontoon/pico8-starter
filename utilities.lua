--[[
    utilities
]]--

-- range(start)             returns an iterator from 1 to a (step = 1)
-- range(start, stop)       returns an iterator from a to b (step = 1)
-- range(start, stop, step) returns an iterator from a to b, counting by step.
function range(i, to, inc)
    -- range(--[[ no args ]]) -> return "nothing" to fail the loop in the caller
    if i == nil then return end

   if not to then
       to = i 
       i  = to == 0 and 0 or (to > 0 and 1 or -1) 
   end 

   -- we don't have to do the to == 0 check
   -- 0 -> 0 with any inc would never iterate
   inc = inc or (i < to and 1 or -1) 

   -- step back (once) before we start
   i = i - inc 

   return function () if i == to then return nil end i = i + inc return i, i end 
end

-- return a random integer between two values
function rnd_range(min, max)
   return flr(rnd() * (max - min + 1)) + min
end

-- converts anything to string, even nested tables
function to_string(any)
    if (type(any)~="table") return tostr(any)
    local str = "{"
    for k,v in pairs(any) do
        if (str~="{") str=str..","
            str=str..tostring(k).."="..tostring(v)
        end
    return str.."}"
end
