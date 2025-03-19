from mappings import bind

config.load_autoconfig()

font                            = "GohuFont 11 Nerd Font"
home                            = "https://qutebrowser.org/"

c.colors.tabs.bar.bg            = "#000000"
c.colors.tabs.even.bg           = "#000000"
c.colors.tabs.even.fg           = "#ffffff"
c.colors.tabs.odd.bg            = "#000000"
c.colors.tabs.odd.fg            = "#ffffff"
c.colors.tabs.selected.even.bg  = "#efe100"
c.colors.tabs.selected.odd.bg   = "#efe100"
c.colors.tabs.selected.even.fg  = "#000000"
c.colors.tabs.selected.odd.fg   = "#000000"
c.fonts.default_family          = font
c.fonts.default_size            = "12pt"
c.tabs.position                 = "bottom"
c.tabs.title.alignment          = "center"
c.url.default_page              = home
c.url.start_pages               = home
c.window.title_format           = "{perc}{current_title}"

bind(config)
