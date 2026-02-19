-- ТЕСТОВЫЙ КОД С ИСПОЛЬЗОВАНИЕМ БИБЛИОТЕКИ
local YUUGLR = loadstring(game:HttpGet("https://raw.githubusercontent.com/YUUGTRELDYS/yuugtlr.github.com/refs/heads/main/library.lua"))()

local ScreenGui, MainFrame, Header = YUUGLR:CreateWindow("TEST MENU", "v1.0 by YUUGTRELDYS")

YUUGLR:CreateNotification("YUUGLR Library Loaded!", 3)

local ScrollingFrame, Layout = YUUGLR:CreateScrollingFrame(MainFrame, UDim2.new(1, -20, 0, 200), UDim2.new(0, 10, 0, 50))

local Toggle1, GetToggle1, SetToggle1 = YUUGLR:CreateToggle(ScrollingFrame, "Feature 1", false, nil, function(state)
    YUUGLR:CreateNotification("Feature 1: " .. tostring(state), 1)
end)

local Toggle2, GetToggle2, SetToggle2 = YUUGLR:CreateToggle(ScrollingFrame, "Feature 2", true, nil, function(state)
    YUUGLR:CreateNotification("Feature 2: " .. tostring(state), 1)
end)

local Toggle3, GetToggle3, SetToggle3 = YUUGLR:CreateToggle(ScrollingFrame, "Feature 3", false, nil, function(state)
    YUUGLR:CreateNotification("Feature 3: " .. tostring(state), 1)
end)

local Label1 = YUUGLR:CreateLabel(MainFrame, "YUUGLR Controls:", UDim2.new(0, 10, 0, 260))

local Tab = YUUGLR:CreateTab(MainFrame)

local Button1 = YUUGLR:CreateButton(Tab, "BUTTON 1", UDim2.new(0, 0, 0, 0), nil, Color3.fromRGB(80, 100, 220), function()
    YUUGLR:CreateNotification("Button 1 Clicked!", 2)
end)

local Button2 = YUUGLR:CreateButton(Tab, "BUTTON 2", UDim2.new(0, 0, 0, 40), nil, Color3.fromRGB(140, 80, 220), function()
    YUUGLR:CreateNotification("Button 2 Clicked!", 2)
end)

local Button3 = YUUGLR:CreateButton(Tab, "RESET", UDim2.new(0, 0, 0, 80), nil, Color3.fromRGB(200, 70, 70), function()
    SetToggle1(false)
    SetToggle2(true)
    SetToggle3(false)
    YUUGLR:CreateNotification("All Features Reset!", 2)
end)

local SliderFrame, GetSlider, SetSlider = YUUGLR:CreateSlider(MainFrame, "Transparency", 0, 0, 100, UDim2.new(0, 10, 0, 320), function(value)
    MainFrame.BackgroundTransparency = value / 100
end)
