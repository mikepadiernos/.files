local SIZE_WIDTH = 7
local DEFAULT_DATE_WIDTH = 11
local YYYY_DATE_WIDTH = 10
local YY_DATE_WIDTH = 8

-- Always overridden in custom mode
local date_format = ""
local date_width = DEFAULT_DATE_WIDTH

local custom_date = false

local original_mtime = Linemode.mtime
local original_btime = Linemode.btime


-- _validate_custom
local function _validate_custom(custom)
  -- Validate order
  if type(custom.order) ~= "table" then
    return false, "custom.order must be a table"
  end

  local valid_fields = { year = true, month = true, day = true }
  local seen = {}

  for _, field in ipairs(custom.order) do
    if not valid_fields[field] then
      return false, "custom.order must contain only 'year', 'month', 'day'"
    end
    if seen[field] then
      return false, "custom.order contains duplicate field: " .. field
    end
    seen[field] = true
  end

  -- Validate separator
  local valid_separators = { ["/"] = true, ["."] = true, ["-"] = true }

  if custom.separator and not valid_separators[custom.separator] then
    return false, "separator must be one of: '/', '.', '-'"
  end
  if type(custom.separator) ~= "string" then
    return false, "custom.separator must be a string"
  end
    
  -- Validate year_digits
  if custom.year_digits ~= 2 and custom.year_digits ~= 4 then
    return false, "custom.year_digits must be 2 or 4"
  end
    
  return true, nil
end

-- _local_config
local _load_config = ya.sync(function(_, opts)
  if opts.date_mode == "custom" then
    local ok, err = _validate_custom(opts.custom)

    if ok then
      custom_date = true

      local formats = {
        year = (opts.custom.year_digits == 4) and "%Y" or "%y",
        month = "%m",
        day = "%d",
      }

      local parts = {}
      for _, part in ipairs(opts.custom.order) do
        table.insert(parts, formats[part])
      end

      date_format = table.concat(parts, opts.custom.separator)
      date_width = (opts.custom.year_digits == 4) and YYYY_DATE_WIDTH or YY_DATE_WIDTH
    end
  end
end)

-- _is_today
local function _is_today(time)
  local date = os.date("*t", time)
  local today = os.date("*t")
    
  return date.year == today.year and 
         date.month == today.month and 
         date.day == today.day
end

-- _format_date
local function _format_date(ts)
	local time = math.floor(ts or 0)
	if time == 0 then
		return ""
  elseif _is_today(time) then
    return os.date("%R", time)
  else
    return os.date(date_format, time)
  end
end

-- Linemode:btime
function Linemode:btime()
  if custom_date then
    return _format_date(self._file.cha.btime)
  else
    return original_btime(self)
  end
end

-- Linemode:mtime
function Linemode:mtime()
  if custom_date then
    return _format_date(self._file.cha.mtime)
  else
    return original_mtime(self)
  end
end

-- Linemode:size_mtime
function Linemode:size_mtime()
  local format_str = "%" .. SIZE_WIDTH .. "s  %" .. date_width .. "s"
  return string.format(format_str, self:size(), self:mtime())
end

-- ya.readable_size
function ya.readable_size(size)
  local units = { "B", "K", "M", "G", "T", "P", "E", "Z", "Y", "R", "Q" }
  local i = 1
  while size > 1024 and i < #units do
    size = size / 1024
    i = i + 1
  end
  local s = string.format("%.1f%s", size, " " .. units[i]):gsub("[.,]0", "", 1)
  return s
end

return {
  setup = function(_, opts)
    _load_config(opts)
  end,
}
