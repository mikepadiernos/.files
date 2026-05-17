# linemode-plus.yazi
A [Yazi](https://github.com/sxyazi/yazi) plugin for linemode customization that extends the built-in linemode functionality with customizable date formatting.

## Features
- **Custom date formats** for file timestamps (mtime and btime)
  - **Smart context-aware display**: 
    - Today's files show only time (`HH:mm`)
    - Older files show configurable date format
  - **Full format customization**:
    - Configurable component order (`year`/`month`/`day`)
    - Multiple separator options (`-`, `/`, `.`)
    - 2 or 4-digit year control
- **Readable file sizes** with space before unit (e.g., `2.3 M`, `156 K`, `42 B`)
- **New linemode**: combined `size_mtime` (size & mtime)

## Installation
Install via yazi package manager:
```bash
ya pkg add barbanevosa/linemode-plus
```

## Setup
Add the following configuration entries to their respective configuration files:

### Plugin options in `init.lua`
```lua
-- ~/.config/yazi/init.lua
require("linemode-plus"):setup {
  -- Date formatting mode
  -- Available options:
  --   "default" - Yazi's native format with conditional year display:
  --               • For current year:     "MM/DD HH:mm"
  --               • For other years:      "MM/DD  YYYY"
  --
  --   "custom"  - smart user-defined format with today detection:
  --               • For today's files:     "HH:mm" (time only)
  --               • For older files:       Custom date format from 'custom' table
  --                 (configurable order, separator and year digits)
  date_mode = "custom",
  
  -- Custom format settings (only used when mode = "custom")
  custom = {
    -- Date components order
    -- MUST contain all three components: "year", "month", "day"
    -- Each component must appear exactly once (no duplicates)
    --
    -- All valid examples:
    --   { "year", "month", "day" }     -- year → month → day
    --   { "year", "day", "month" }     -- year → day → month
    --   { "month", "year", "day" }     -- month → year → day
    --   { "month", "day", "year" }     -- month → day → year
    --   { "day", "year", "month" }     -- day → year → month
    --   { "day", "month", "year" }     -- day → month → year
    order = { "year", "month", "day" },
    
    -- Separator between date components
    -- Allowed separators: "-", "/", "."  (only these characters are supported)
    --
    -- Examples:
    --   "-" -> 2026-02-20
    --   "/" -> 2026/02/20  
    --   "." -> 2026.02.20
    separator = "-",

    -- Number of digits for the year:
    --   4 -> 2026 (full year)
    --   2 -> 26   (short year)
    year_digits = 4, 
  }
}
```

### Keybinding in `keymap.toml`
```toml
# ~/.config/yazi/keymap.toml
[mgr]
prepend_keymap = [
    # linemode-plus plugin
    { on = [ "m", "c" ], run = "linemode size_mtime", desc = "Linemode: size+mtime" },
 	  
    # Sorting does not override linemode (recommended) 
    { on = [ ",", "m" ], run = [ "sort mtime --reverse=no" ], desc = "Sort by modified time" },
    { on = [ ",", "M" ], run = [ "sort mtime --reverse=yes" ], desc = "Sort by modified time (reverse)" },
    { on = [ ",", "b" ], run = [ "sort btime --reverse=no" ], desc = "Sort by birth time" },
    { on = [ ",", "B" ], run = [ "sort btime --reverse=yes" ], desc = "Sort by birth time (reverse)" },
    { on = [ ",", "s" ], run = [ "sort size --reverse=no" ], desc = "Sort by size" },
    { on = [ ",", "S" ], run = [ "sort size --reverse=yes" ], desc = "Sort by size (reverse)" },
]
```

## Usage
1. Configure your preferred date format in `~/.config/yazi/init.lua` (see Setup section above).
2. Use your configured keybinding (e.g., `m` + `c`) to switch to the `size_mtime` linemode.

## License
**linemode-plus.yazi** is MIT-licensed. For more information check the [LICENSE](LICENSE) file.
