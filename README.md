# yuugtlr.github.com
# YUUGTRL Library - Complete Guide

## 📦 Installation
```lua
local YUUGTRL = loadstring(game:HttpGet("https://raw.githubusercontent.com/YUUGTRELDYS/YUUGTRL.github.io/refs/heads/main/lib.lua"))()
🪟 Creating a Window
lua
local window = YUUGTRL:CreateWindow(
    "Window Title",           -- string
    UDim2.new(0, 300, 0, 400), -- size (optional)
    UDim2.new(0.5, -150, 0.5, -200), -- position (optional)
    {
        MainColor = Color3.fromRGB(30, 30, 40),     -- main background color
        HeaderColor = Color3.fromRGB(40, 40, 50),   -- header color
        AccentColor = Color3.fromRGB(80, 100, 220), -- accent color for buttons
        CloseColor = Color3.fromRGB(255, 100, 100), -- close button color
        TextColor = Color3.fromRGB(255, 255, 255),  -- text color
        ShowSettings = true,   -- show settings button (default: true)
        ShowClose = true       -- show close button (default: true)
    }
)
🎨 Window Methods
Add elements to window
lua
-- Create a frame inside window
local frame = window:CreateFrame(
    UDim2.new(1, -20, 1, -60),      -- size
    UDim2.new(0, 10, 0, 50),         -- position
    Color3.fromRGB(35, 35, 45),      -- color (optional)
    12                                -- corner radius (optional)
)

-- Create a label
local label = window:CreateLabel(
    "Text here",                     -- text
    UDim2.new(0, 10, 0, 10),         -- position
    UDim2.new(1, -20, 0, 25),        -- size (optional)
    Color3.fromRGB(255, 255, 255)     -- color (optional)
)

-- Create a button
local button = window:CreateButton(
    "Click me",                      -- text
    function() print("Clicked!") end, -- callback
    Color3.fromRGB(80, 100, 220),     -- color (optional)
    UDim2.new(0, 10, 0, 100),         -- position
    UDim2.new(1, -20, 0, 35),         -- size (optional)
    "darken"                          -- style: "darken", "lighten", "toggle", "hover", "hover-dark"
)

-- Create a toggle
local toggle = window:CreateToggle(
    "Enable Feature",                 -- text
    false,                            -- default state
    function(state) print("State:", state) end, -- callback
    nil,                              -- color (optional)
    UDim2.new(0, 10, 0, 150),         -- position
    UDim2.new(1, -20, 0, 35)          -- size (optional)
)

-- Create a slider
local slider = window:CreateSlider(
    "Volume",                         -- text
    0, 100,                           -- min, max
    50,                               -- default value
    function(value) print("Value:", value) end, -- callback
    UDim2.new(0, 10, 0, 200),         -- position
    UDim2.new(1, -20, 0, 50)          -- size (optional)
)
Window Control Methods
lua
window:SetSettingsCallback(function()
    print("Settings button clicked")
    -- Open settings window here
end)

window:SetCloseCallback(function()
    print("Close button clicked")
    -- Custom close behavior
end)

window:Destroy() -- Destroy the window
🎨 Button Styles
Style	Description
"darken"	Darkens when pressed
"lighten"	Lightens when pressed
"toggle"	Toggles between dark/light on click
"hover"	Lightens on hover
"hover-dark"	Darkens on hover
🎨 Color Examples
lua
-- RGB Colors
Color3.fromRGB(255, 0, 0)     -- Red
Color3.fromRGB(0, 255, 0)     -- Green
Color3.fromRGB(0, 0, 255)     -- Blue
Color3.fromRGB(255, 255, 255) -- White
Color3.fromRGB(0, 0, 0)       -- Black
Color3.fromRGB(170, 85, 255)  -- Purple (YUUGTRL signature color)

-- Popular combinations
local darkTheme = {
    MainColor = Color3.fromRGB(20, 20, 25),
    HeaderColor = Color3.fromRGB(25, 25, 30),
    AccentColor = Color3.fromRGB(100, 120, 255),
    CloseColor = Color3.fromRGB(255, 100, 100)
}

local lightTheme = {
    MainColor = Color3.fromRGB(240, 240, 245),
    HeaderColor = Color3.fromRGB(230, 230, 235),
    AccentColor = Color3.fromRGB(80, 100, 220),
    CloseColor = Color3.fromRGB(255, 80, 80),
    TextColor = Color3.fromRGB(0, 0, 0)
}
📝 Complete Example
lua
local YUUGTRL = loadstring(game:HttpGet("https://raw.githubusercontent.com/YUUGTRELDYS/YUUGTRL.github.io/refs/heads/main/lib.lua"))()

-- Create main window
local mainWindow = YUUGTRL:CreateWindow("Main Menu", UDim2.new(0, 350, 0, 450), UDim2.new(0.5, -175, 0.5, -225), {
    MainColor = Color3.fromRGB(20, 20, 25),
    HeaderColor = Color3.fromRGB(25, 25, 30),
    ShowSettings = true,
    ShowClose = true
})

-- Create content frame
local main = mainWindow:CreateFrame(
    UDim2.new(1, -20, 1, -60),
    UDim2.new(0, 10, 0, 50),
    Color3.fromRGB(20, 20, 25)
)

-- Add labels
local label1 = mainWindow:CreateLabel("Status: Active", UDim2.new(0, 10, 0, 10), UDim2.new(1, -20, 0, 25))

-- Add buttons
local btn1 = mainWindow:CreateButton("Click Me", function() 
    print("Button clicked!") 
end, Color3.fromRGB(80, 100, 220), UDim2.new(0, 10, 0, 50), UDim2.new(1, -20, 0, 35), "darken")

local btn2 = mainWindow:CreateButton("Toggle Me", function() 
    print("Toggle button") 
end, Color3.fromRGB(140, 80, 220), UDim2.new(0, 10, 0, 90), UDim2.new(1, -20, 0, 35), "toggle")

-- Add toggle
local toggle = mainWindow:CreateToggle("Enable Feature", false, function(state)
    print("Feature enabled:", state)
end, nil, UDim2.new(0, 10, 0, 130), UDim2.new(1, -20, 0, 35))

-- Add slider
local slider = mainWindow:CreateSlider("Volume", 0, 100, 50, function(val)
    print("Volume:", val)
end, UDim2.new(0, 10, 0, 170), UDim2.new(1, -20, 0, 50))

-- Create settings window
local settingsWindow = YUUGTRL:CreateWindow("Settings", UDim2.new(0, 280, 0, 200), UDim2.new(0.5, -140, 0.5, -100), {
    MainColor = Color3.fromRGB(20, 20, 25),
    HeaderColor = Color3.fromRGB(25, 25, 30),
    ShowSettings = false,
    ShowClose = true
})
settingsWindow.Main.Visible = false

-- Add settings content
local settingsMain = settingsWindow:CreateFrame(
    UDim2.new(1, -20, 1, -60),
    UDim2.new(0, 10, 0, 50),
    Color3.fromRGB(20, 20, 25)
)

local langBtn = settingsWindow:CreateButton("English", function()
    print("Language changed")
end, Color3.fromRGB(80, 100, 220), UDim2.new(0, 10, 0, 10), UDim2.new(0.4, -5, 0, 30), "darken")

-- Connect settings button
mainWindow:SetSettingsCallback(function()
    settingsWindow.Main.Visible = not settingsWindow.Main.Visible
end)

print("YUUGTRL Library loaded successfully!")
⚡ Quick Tips
Positioning: Use UDim2.new(xScale, xOffset, yScale, yOffset)

Colors: Use Color3.fromRGB(r, g, b) with values 0-255

Window options: Set ShowSettings = false and ShowClose = false to hide buttons

Button styles: Choose from "darken", "lighten", "toggle", "hover", "hover-dark"

Multiple windows: You can create as many windows as you want

🚀 Features
✅ Customizable windows with headers

✅ Draggable windows

✅ Gradient buttons with multiple styles

✅ Toggle switches

✅ Sliders

✅ Labels

✅ Frames with rounded corners

✅ Mobile support

✅ Splash screen on load

✅ Full control over button visibility

✅ Custom themes and colors

⚠️ Notes
All elements are created as children of the window's Main frame

Use window:CreateX() methods to automatically parent elements to the window

The library automatically handles cleanup when windows are destroyed

Splash screen shows "YUUGTRL" in purple and fades out
