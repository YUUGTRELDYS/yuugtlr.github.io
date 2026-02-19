local YUUGLR = {}
local players = game:GetService("Players")
local player = players.LocalPlayer
local tweenService = game:GetService("TweenService")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local isMobile = userInputService.TouchEnabled

local function showWatermark()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "YUUGLR_Watermark"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 9999
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = player:WaitForChild("PlayerGui")
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 220, 0, 60)
    frame.Position = UDim2.new(0.5, -110, 0, -100)
    frame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 0
    frame.Parent = ScreenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 20)
    corner.Parent = frame
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 255))
    })
    gradient.Rotation = 45
    gradient.Parent = frame
    
    local outline = Instance.new("Frame")
    outline.Size = UDim2.new(1, 4, 1, 4)
    outline.Position = UDim2.new(0, -2, 0, -2)
    outline.BackgroundTransparency = 1
    outline.BorderSizePixel = 0
    outline.Parent = frame
    
    local outlineCorner = Instance.new("UICorner")
    outlineCorner.CornerRadius = UDim.new(0, 22)
    outlineCorner.Parent = outline
    
    local outlineGradient = Instance.new("UIGradient")
    outlineGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 255))
    })
    outlineGradient.Rotation = 45
    outlineGradient.Parent = outline
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = "YUUGLR by YUUGTRELDYS"
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 18
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = frame
    
    local glow = Instance.new("ImageLabel")
    glow.Size = UDim2.new(1, 40, 1, 40)
    glow.Position = UDim2.new(0, -20, 0, -20)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://5025667723"
    glow.ImageColor3 = Color3.fromRGB(255, 0, 255)
    glow.ImageTransparency = 0.7
    glow.ScaleType = Enum.ScaleType.Slice
    glow.SliceCenter = Rect.new(20, 20, 20, 20)
    glow.Parent = frame
    
    local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    local goal = {Position = UDim2.new(0.5, -110, 0, 30)}
    local tween = tweenService:Create(frame, tweenInfo, goal)
    tween:Play()
    
    task.wait(2)
    
    local tweenInfo2 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    local goal2 = {Position = UDim2.new(0.5, -110, 0, -100)}
    local tween2 = tweenService:Create(frame, tweenInfo2, goal2)
    tween2:Play()
    tween2.Completed:Connect(function()
        ScreenGui:Destroy()
    end)
end

showWatermark()

function YUUGLR:CreateWindow(title, credits, size)
    size = size or (isMobile and UDim2.new(0, 280, 0, 320) or UDim2.new(0, 400, 0, 450))
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "YUUGLR_" .. title
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 999
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = player:WaitForChild("PlayerGui")
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = size
    MainFrame.Position = UDim2.new(0.5, -size.X.Offset/2, 0.5, -size.Y.Offset/2)
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui
    
    local BackgroundGradient = Instance.new("UIGradient")
    BackgroundGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 25)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 5, 10))
    })
    BackgroundGradient.Rotation = 45
    BackgroundGradient.Parent = MainFrame
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 20)
    UICorner.Parent = MainFrame
    
    local Outline = Instance.new("Frame")
    Outline.Size = UDim2.new(1, 4, 1, 4)
    Outline.Position = UDim2.new(0, -2, 0, -2)
    Outline.BackgroundTransparency = 1
    Outline.BorderSizePixel = 0
    Outline.Parent = MainFrame
    
    local OutlineCorner = Instance.new("UICorner")
    OutlineCorner.CornerRadius = UDim.new(0, 22)
    OutlineCorner.Parent = Outline
    
    local OutlineGradient = Instance.new("UIGradient")
    OutlineGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 255))
    })
    OutlineGradient.Rotation = 45
    OutlineGradient.Parent = Outline
    
    local Glow = Instance.new("ImageLabel")
    Glow.Size = UDim2.new(1, 40, 1, 40)
    Glow.Position = UDim2.new(0, -20, 0, -20)
    Glow.BackgroundTransparency = 1
    Glow.Image = "rbxassetid://5025667723"
    Glow.ImageColor3 = Color3.fromRGB(255, 0, 255)
    Glow.ImageTransparency = 0.8
    Glow.ScaleType = Enum.ScaleType.Slice
    Glow.SliceCenter = Rect.new(20, 20, 20, 20)
    Glow.Parent = MainFrame
    
    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Size = UDim2.new(1, 0, 0, isMobile and 40 or 50)
    Header.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    Header.BorderSizePixel = 0
    Header.Parent = MainFrame
    
    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 20)
    HeaderCorner.Parent = Header
    
    local HeaderGradient = Instance.new("UIGradient")
    HeaderGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 45)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 25))
    })
    HeaderGradient.Rotation = 45
    HeaderGradient.Parent = Header
    
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, -80, 1, 0)
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = isMobile and 16 or 20
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Header
    
    local Credits = Instance.new("TextLabel")
    Credits.Name = "Credits"
    Credits.Size = UDim2.new(1, -80, 0, 15)
    Credits.Position = UDim2.new(0, 15, 1, -18)
    Credits.BackgroundTransparency = 1
    Credits.Text = credits
    Credits.TextColor3 = Color3.fromRGB(170, 170, 255)
    Credits.Font = Enum.Font.Gotham
    Credits.TextSize = isMobile and 9 or 11
    Credits.TextXAlignment = Enum.TextXAlignment.Left
    Credits.Parent = Header
    
    local YUUGLRLabel = Instance.new("TextLabel")
    YUUGLRLabel.Name = "YUUGLRLabel"
    YUUGLRLabel.Size = UDim2.new(0, 70, 1, 0)
    YUUGLRLabel.Position = UDim2.new(1, -85, 0, 0)
    YUUGLRLabel.BackgroundTransparency = 1
    YUUGLRLabel.Text = "YUUGLR"
    YUUGLRLabel.TextColor3 = Color3.fromRGB(255, 0, 255)
    YUUGLRLabel.Font = Enum.Font.GothamBold
    YUUGLRLabel.TextSize = isMobile and 12 or 14
    YUUGLRLabel.TextXAlignment = Enum.TextXAlignment.Right
    YUUGLRLabel.Parent = Header
    
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, isMobile and 30 or 35, 0, isMobile and 30 or 35)
    CloseButton.Position = UDim2.new(1, isMobile and -35 or -40, 0.5, -17.5)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    CloseButton.Text = "✕"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextSize = isMobile and 16 or 20
    CloseButton.Parent = Header
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 10)
    CloseCorner.Parent = CloseButton
    
    CloseButton.MouseButton1Click:Connect(function()
        local tween = tweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)})
        tween:Play()
        tween.Completed:Connect(function()
            ScreenGui:Destroy()
        end)
    end)
    
    return ScreenGui, MainFrame, Header
end

function YUUGLR:CreateButton(parent, text, position, size, color, callback)
    size = size or UDim2.new(1, -20, 0, isMobile and 35 or 40)
    position = position or UDim2.new(0, 10, 0, 0)
    color = color or Color3.fromRGB(80, 100, 220)
    
    local button = Instance.new("TextButton")
    button.Name = text .. "Button"
    button.Size = size
    button.Position = position
    button.BackgroundColor3 = color
    button.Text = ""
    button.AutoButtonColor = false
    button.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = button
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(math.min(color.R * 255 + 30, 255), math.min(color.G * 255 + 30, 255), math.min(color.B * 255 + 30, 255))),
        ColorSequenceKeypoint.new(1, color)
    })
    gradient.Rotation = 90
    gradient.Parent = button
    
    local outline = Instance.new("Frame")
    outline.Size = UDim2.new(1, 2, 1, 2)
    outline.Position = UDim2.new(0, -1, 0, -1)
    outline.BackgroundTransparency = 1
    outline.BorderSizePixel = 0
    outline.Parent = button
    
    local outlineCorner = Instance.new("UICorner")
    outlineCorner.CornerRadius = UDim.new(0, 13)
    outlineCorner.Parent = outline
    
    local outlineGradient = Instance.new("UIGradient")
    outlineGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 255))
    })
    outlineGradient.Rotation = 90
    outlineGradient.Parent = outline
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.GothamBold
    label.TextSize = isMobile and 12 or 14
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = button
    
    local icon = Instance.new("TextLabel")
    icon.Size = UDim2.new(0, 20, 1, 0)
    icon.Position = UDim2.new(0, 5, 0, 0)
    icon.BackgroundTransparency = 1
    icon.Text = "▶"
    icon.TextColor3 = Color3.fromRGB(255, 255, 255)
    icon.Font = Enum.Font.GothamBold
    icon.TextSize = isMobile and 14 or 16
    icon.TextXAlignment = Enum.TextXAlignment.Left
    icon.Parent = button
    icon.Visible = false
    
    local shine = Instance.new("Frame")
    shine.Size = UDim2.new(0, 0, 1, 0)
    shine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    shine.BackgroundTransparency = 0.8
    shine.BorderSizePixel = 0
    shine.Parent = button
    
    local shineCorner = Instance.new("UICorner")
    shineCorner.CornerRadius = UDim.new(0, 12)
    shineCorner.Parent = shine
    
    local function animateShine()
        shine:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        task.wait(0.1)
        shine:TweenSize(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3)
    end
    
    button.MouseEnter:Connect(function()
        tweenService:Create(button, TweenInfo.new(0.2), {Size = UDim2.new(size.X.Scale, size.X.Offset + 2, size.Y.Scale, size.Y.Offset + 2)}):Play()
        tweenService:Create(label, TweenInfo.new(0.2), {TextSize = (isMobile and 12 or 14) + 1}):Play()
        icon.Visible = true
    end)
    
    button.MouseLeave:Connect(function()
        tweenService:Create(button, TweenInfo.new(0.2), {Size = size}):Play()
        tweenService:Create(label, TweenInfo.new(0.2), {TextSize = isMobile and 12 or 14}):Play()
        icon.Visible = false
    end)
    
    button.MouseButton1Click:Connect(function()
        animateShine()
        
        local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        tweenService:Create(button, tweenInfo, {BackgroundColor3 = Color3.fromRGB(60, 180, 80)}):Play()
        tweenService:Create(button, tweenInfo, {Size = UDim2.new(size.X.Scale, size.X.Offset - 4, size.Y.Scale, size.Y.Offset - 4)}):Play()
        
        task.wait(0.1)
        
        tweenService:Create(button, tweenInfo, {BackgroundColor3 = color}):Play()
        tweenService:Create(button, tweenInfo, {Size = size}):Play()
        
        if callback then callback() end
    end)
    
    return button
end

function YUUGLR:CreateLabel(parent, text, position, size, color)
    size = size or UDim2.new(1, -20, 0, isMobile and 25 or 30)
    position = position or UDim2.new(0, 10, 0, 0)
    color = color or Color3.fromRGB(200, 200, 220)
    
    local label = Instance.new("TextLabel")
    label.Size = size
    label.Position = position
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color
    label.Font = Enum.Font.GothamBold
    label.TextSize = isMobile and 14 or 16
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = parent
    
    return label
end

function YUUGLR:CreateToggle(parent, text, default, position, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, isMobile and 30 or 35)
    frame.Position = position or UDim2.new(0, 10, 0, 0)
    frame.BackgroundTransparency = 1
    frame.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.6, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(220, 220, 255)
    label.Font = Enum.Font.GothamBold
    label.TextSize = isMobile and 13 or 15
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local toggleBg = Instance.new("Frame")
    toggleBg.Size = UDim2.new(0, isMobile and 50 or 60, 0, isMobile and 25 or 30)
    toggleBg.Position = UDim2.new(1, -60, 0.5, -15)
    toggleBg.BackgroundColor3 = default and Color3.fromRGB(80, 220, 100) or Color3.fromRGB(60, 60, 80)
    toggleBg.BorderSizePixel = 0
    toggleBg.Parent = frame
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 15)
    toggleCorner.Parent = toggleBg
    
    local toggleButton = Instance.new("Frame")
    toggleButton.Size = UDim2.new(0, isMobile and 23 or 28, 0, isMobile and 23 or 28)
    toggleButton.Position = default and UDim2.new(1, -28, 0.5, -14) or UDim2.new(0, 2, 0.5, -14)
    toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.BorderSizePixel = 0
    toggleButton.Parent = toggleBg
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 14)
    buttonCorner.Parent = toggleButton
    
    local state = default or false
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundTransparency = 1
    button.Text = ""
    button.Parent = frame
    
    button.MouseButton1Click:Connect(function()
        state = not state
        
        local targetColor = state and Color3.fromRGB(80, 220, 100) or Color3.fromRGB(60, 60, 80)
        local targetPos = state and UDim2.new(1, -28, 0.5, -14) or UDim2.new(0, 2, 0.5, -14)
        
        tweenService:Create(toggleBg, TweenInfo.new(0.2), {BackgroundColor3 = targetColor}):Play()
        tweenService:Create(toggleButton, TweenInfo.new(0.2), {Position = targetPos}):Play()
        
        if callback then callback(state) end
    end)
    
    return frame, function() return state end, function(newState)
        state = newState
        local targetColor = state and Color3.fromRGB(80, 220, 100) or Color3.fromRGB(60, 60, 80)
        local targetPos = state and UDim2.new(1, -28, 0.5, -14) or UDim2.new(0, 2, 0.5, -14)
        
        toggleBg.BackgroundColor3 = targetColor
        toggleButton.Position = targetPos
    end
end

function YUUGLR:CreateSlider(parent, text, default, min, max, position, callback)
    min = min or 0
    max = max or 100
    default = default or 0
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, isMobile and 55 or 65)
    frame.Position = position or UDim2.new(0, 10, 0, 0)
    frame.BackgroundTransparency = 1
    frame.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, isMobile and 20 or 25)
    label.BackgroundTransparency = 1
    label.Text = text .. ": " .. default
    label.TextColor3 = Color3.fromRGB(220, 220, 255)
    label.Font = Enum.Font.GothamBold
    label.TextSize = isMobile and 13 or 15
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local slider = Instance.new("Frame")
    slider.Name = "Slider"
    slider.Size = UDim2.new(1, 0, 0, isMobile and 20 or 25)
    slider.Position = UDim2.new(0, 0, 0, isMobile and 25 or 30)
    slider.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    slider.BorderSizePixel = 0
    slider.Parent = frame
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 12)
    sliderCorner.Parent = slider
    
    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
    fill.BorderSizePixel = 0
    fill.Parent = slider
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 12)
    fillCorner.Parent = fill
    
    local fillGradient = Instance.new("UIGradient")
    fillGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 100, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 150, 255))
    })
    fillGradient.Rotation = 90
    fillGradient.Parent = fill
    
    local dragButton = Instance.new("TextButton")
    dragButton.Size = UDim2.new(0, isMobile and 24 or 28, 0, isMobile and 24 or 28)
    dragButton.Position = UDim2.new((default - min) / (max - min), -12, 0.5, -12)
    dragButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    dragButton.Text = ""
    dragButton.BorderSizePixel = 0
    dragButton.Parent = slider
    
    local dragCorner = Instance.new("UICorner")
    dragCorner.CornerRadius = UDim.new(0, 14)
    dragCorner.Parent = dragButton
    
    local dragOutline = Instance.new("Frame")
    dragOutline.Size = UDim2.new(1, 2, 1, 2)
    dragOutline.Position = UDim2.new(0, -1, 0, -1)
    dragOutline.BackgroundTransparency = 1
    dragOutline.BorderSizePixel = 0
    dragOutline.Parent = dragButton
    
    local dragOutlineCorner = Instance.new("UICorner")
    dragOutlineCorner.CornerRadius = UDim.new(0, 15)
    dragOutlineCorner.Parent = dragOutline
    
    local dragOutlineGradient = Instance.new("UIGradient")
    dragOutlineGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 100, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 150, 255))
    })
    dragOutlineGradient.Rotation = 90
    dragOutlineGradient.Parent = dragOutline
    
    local value = default
    local dragging = false
    
    dragButton.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    userInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    userInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mousePos = input.Position.X
            local sliderPos = slider.AbsolutePosition.X
            local sliderSize = slider.AbsoluteSize.X
            local relativePos = math.clamp((mousePos - sliderPos) / sliderSize, 0, 1)
            local newValue = math.floor(min + (relativePos * (max - min)) + 0.5)
            value = newValue
            
            fill.Size = UDim2.new(relativePos, 0, 1, 0)
            dragButton.Position = UDim2.new(relativePos, -12, 0.5, -12)
            label.Text = text .. ": " .. value
            if callback then callback(value) end
        end
    end)
    
    return frame, function() return value end, function(newValue)
        value = newValue
        local relativePos = (value - min) / (max - min)
        fill.Size = UDim2.new(relativePos, 0, 1, 0)
        dragButton.Position = UDim2.new(relativePos, -12, 0.5, -12)
        label.Text = text .. ": " .. value
    end
end

function YUUGLR:CreateScrollingFrame(parent, size, position)
    size = size or UDim2.new(1, -20, 1, -70)
    position = position or UDim2.new(0, 10, 0, 60)
    
    local frame = Instance.new("ScrollingFrame")
    frame.Size = size
    frame.Position = position
    frame.BackgroundTransparency = 1
    frame.BorderSizePixel = 0
    frame.ScrollBarThickness = 6
    frame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 255)
    frame.CanvasSize = UDim2.new(0, 0, 0, 0)
    frame.Parent = parent
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, isMobile and 8 or 10)
    layout.Parent = frame
    
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        frame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
    end)
    
    return frame, layout
end

function YUUGLR:CreateNotification(text, duration)
    duration = duration or 3
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "YUUGLR_Notification"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 1000
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = player:WaitForChild("PlayerGui")
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 350, 0, 80)
    frame.Position = UDim2.new(0.5, -175, 0, -100)
    frame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.Parent = ScreenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 25)
    corner.Parent = frame
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 255))
    })
    gradient.Rotation = 45
    gradient.Parent = frame
    
    local outline = Instance.new("Frame")
    outline.Size = UDim2.new(1, 4, 1, 4)
    outline.Position = UDim2.new(0, -2, 0, -2)
    outline.BackgroundTransparency = 1
    outline.BorderSizePixel = 0
    outline.Parent = frame
    
    local outlineCorner = Instance.new("UICorner")
    outlineCorner.CornerRadius = UDim.new(0, 27)
    outlineCorner.Parent = outline
    
    local outlineGradient = Instance.new("UIGradient")
    outlineGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 255))
    })
    outlineGradient.Rotation = 45
    outlineGradient.Parent = outline
    
    local icon = Instance.new("TextLabel")
    icon.Size = UDim2.new(0, 40, 1, 0)
    icon.Position = UDim2.new(0, 10, 0, 0)
    icon.BackgroundTransparency = 1
    icon.Text = "⚡"
    icon.TextColor3 = Color3.fromRGB(255, 255, 255)
    icon.Font = Enum.Font.GothamBold
    icon.TextSize = 40
    icon.Parent = frame
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -70, 0, 30)
    title.Position = UDim2.new(0, 60, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "YUUGLR"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 24
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = frame
    
    local message = Instance.new("TextLabel")
    message.Size = UDim2.new(1, -70, 0, 30)
    message.Position = UDim2.new(0, 60, 0, 40)
    message.BackgroundTransparency = 1
    message.Text = text
    message.TextColor3 = Color3.fromRGB(220, 220, 255)
    message.Font = Enum.Font.Gotham
    message.TextSize = 14
    message.TextXAlignment = Enum.TextXAlignment.Left
    message.Parent = frame
    
    local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    local goal = {Position = UDim2.new(0.5, -175, 0, 50)}
    local tween = tweenService:Create(frame, tweenInfo, goal)
    tween:Play()
    
    task.wait(duration)
    
    local tweenInfo2 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    local goal2 = {Position = UDim2.new(0.5, -175, 0, -100)}
    local tween2 = tweenService:Create(frame, tweenInfo2, goal2)
    tween2:Play()
    tween2.Completed:Connect(function()
        ScreenGui:Destroy()
    end)
end

return YUUGLR
