mainScreen = hs.screen{x=0,y=0}
secondaryScreen = hs.screen{x=-1,y=0}

hs.hotkey.bind({"cmd", "ctrl"}, "Y", function()
    local windowLayout = {
        {"iTerm2", nil, mainScreen, hs.layout.left50,    nil, nil},
        {"Firefox", nil, mainScreen, hs.layout.right50,   nil, nil},
    }
    hs.layout.apply(windowLayout)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "F", function()
    out, _, _ = hs.execute('/Users/jacob/bin/fixmonitors.sh')
    hs.alert(out)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "P", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  hs.alert(max.w / 2)

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f, 0)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "[", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f, 0)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "]", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f, 0)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "'", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f, 0)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f, 0)
end)

hs.hotkey.bind({"cmd", "ctrl"}, ",", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + max.h / 2
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f, 0)
end)

hs.hotkey.bind({"cmd", "ctrl"}, ".", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  hs.alert(max.h / 2)

  f.w = max.w
  f.h = max.h / 2
  f.x = max.x
  f.y = max.y + max.h / 2
  win:setFrame(f, 0)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "/", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + max.w / 2
  f.y = max.y + max.h / 2
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f, 0)
end)

hs.hotkey.bind({"ctrl"}, "m", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f, 0)
end)

-- set up your instance(s)
expose = hs.expose.new(nil,{showThumbnails=false}) -- default windowfilter, no thumbnails
expose_app = hs.expose.new(nil,{onlyActiveApplication=true}) -- show windows for the current application
expose_space = hs.expose.new(nil,{includeOtherSpaces=false}) -- only windows in the current Mission Control Space
expose_browsers = hs.expose.new{'Safari','Google Chrome'} -- specialized expose using a custom windowfilter
-- for your dozens of browser windows :)

-- then bind to a hotkey
hs.hotkey.bind('ctrl-cmd','e','Expose',function()expose:toggleShow()end)
hs.hotkey.bind('ctrl-cmd-shift','e','App Expose',function()expose_app:toggleShow()end)
