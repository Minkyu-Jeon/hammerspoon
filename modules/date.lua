
local obj = {}


function obj:formatAddDays(days)
  local now = os.time()
  local numberOfDays = now + 3600 * 24 * days        
  dateAfterNumberOfDays = os.date("%Y-%m-%d",numberOfDays)
  return dateAfterNumberOfDays
end

return obj