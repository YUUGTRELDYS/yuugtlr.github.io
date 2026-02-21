local YUUGTRL = loadstring(game:HttpGet("https://raw.githubusercontent.com/YUUGTRELDYS/YUUGTRL.github.io/refs/heads/main/lib.lua"))()
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local isMobile = UserInputService.TouchEnabled
local ALLOWED_PLACE_ID = 7346416636
if game.PlaceId ~= ALLOWED_PLACE_ID then return end

local state = {
    onV = false,
    enV = false,
    theyV = false,
    xrayV = false,
    Board = nil,
    YourSide = nil,
    TheirSide = nil
}

local currentTransparency = 0
local scriptVisible = true
local droppedCollision = {}

YUUGTRL:AddLanguage("English", {
    title = "TRADE SCRIPT V2.4",
    OnBoard = "On Board", 
    Accepted = "Accepted", 
    ScamMode = "Auto Scam",
    XRAY = "XRAY",
    JUMP = "FAKE JUMP", 
    AutoScam = "AUTO SCAM",
    Settings = "Settings", 
    Transparency = "Transparency",
    Language = "Language:", 
    EN = "EN", 
    AR = "AR", 
    Reset = "RESET", 
    CollectAll = "COLLECT ALL"
})

YUUGTRL:AddLanguage("Arabic", {
    title = "سكربت التداول V2.4",
    OnBoard = "على اللوحة", 
    Accepted = "مقبول", 
    ScamMode = "الاحتيال التلقائي",
    XRAY = "الأشعة السينية",
    JUMP = "قفزة وهمية", 
    AutoScam = "احتيال تلقائي",
    Settings = "الإعدادات", 
    Transparency = "الشفافية",
    Language = "لغة:", 
    EN = "EN", 
    AR = "AR", 
    Reset = "إعادة تعيين", 
    CollectAll = "جمع الكل"
})

YUUGTRL:SetTheme("dark")

local Window = YUUGTRL:CreateWindow("TRADE SCRIPT V2.4", 
    isMobile and UDim2.new(0, 280, 0, 400) or UDim2.new(0, 350, 0, 450),
    isMobile and UDim2.new(1, -295, 0.5, -200) or UDim2.new(1, -375, 0.5, -225),
    {
        MainColor = Color3.fromRGB(20, 20, 30),
        HeaderColor = Color3.fromRGB(25, 25, 35),
        AccentColor = Color3.fromRGB(80, 100, 220),
        CloseColor = Color3.fromRGB(220, 70, 70),
        TextColor = Color3.fromRGB(220, 220, 255),
        ShowSettings = true,
        ShowClose = true,
        titleKey = "title"
    }
)

local MainContainer = YUUGTRL:CreateFrame(Window.Main, 
    UDim2.new(1, -20, 1, -50), 
    UDim2.new(0, 10, 0, 45),
    Color3.fromRGB(25, 25, 38), 12
)

local StatusScroller = YUUGTRL:CreateScrollingFrame(MainContainer,
    UDim2.new(1, -10, 0, isMobile and 110 or 140),
    UDim2.new(0, 5, 0, 5),
    Color3.fromRGB(30, 30, 42), 10
)

local ControlsFrame = YUUGTRL:CreateFrame(MainContainer,
    UDim2.new(1, -10, 0, isMobile and 160 or 210),
    UDim2.new(0, 5, 1, isMobile and -170 or -220),
    Color3.fromRGB(30, 30, 42), 10
)

local StatusY = 5
local function CreateStatusItem(parent, nameKey, yPos, hasValue)
    local item = YUUGTRL:CreateFrame(parent,
        UDim2.new(1, -10, 0, isMobile and 22 or 28),
        UDim2.new(0, 5, 0, yPos),
        Color3.fromRGB(38, 38, 48), 6
    )
    local label = YUUGTRL:CreateLabel(item, YUUGTRL:GetText(nameKey), 
        UDim2.new(0, 8, 0, 0), 
        UDim2.new(hasValue and 0.5 or 0.7, -5, 1, 0)
    )
    label.TextColor3 = Color3.fromRGB(200, 200, 220)
    label.TextSize = isMobile and 12 or 14
    YUUGTRL:RegisterTranslatable(label, nameKey)
    
    if hasValue then
        local value = YUUGTRL:CreateLabel(item, "false",
            UDim2.new(0.5, 0, 0, 0),
            UDim2.new(0.45, -5, 1, 0)
        )
        value.TextColor3 = Color3.fromRGB(255, 80, 80)
        value.TextSize = isMobile and 12 or 14
        value.TextXAlignment = Enum.TextXAlignment.Left
        return value
    else
        local value = YUUGTRL:CreateLabel(item, "true",
            UDim2.new(0.7, 0, 0, 0),
            UDim2.new(0.25, -5, 1, 0)
        )
        value.TextColor3 = Color3.fromRGB(80, 220, 100)
        value.TextSize = isMobile and 12 or 14
        value.TextXAlignment = Enum.TextXAlignment.Left
        return value
    end
    return nil
end

local XrayValue = CreateStatusItem(StatusScroller, "XRAY", StatusY, true)
StatusY = StatusY + (isMobile and 26 or 32)

local OnBoardValue = CreateStatusItem(StatusScroller, "OnBoard", StatusY, true)
StatusY = StatusY + (isMobile and 26 or 32)
local AcceptedValue = CreateStatusItem(StatusScroller, "Accepted", StatusY, true)
StatusY = StatusY + (isMobile and 26 or 32)
local ScamValue = CreateStatusItem(StatusScroller, "ScamMode", StatusY, true)

local function updateUI()
    if OnBoardValue then
        OnBoardValue.Text = tostring(state.onV)
        local targetColor = state.onV and Color3.fromRGB(80, 220, 100) or Color3.fromRGB(255, 80, 80)
        TweenService:Create(OnBoardValue, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {TextColor3 = targetColor}):Play()
    end
    if AcceptedValue then
        AcceptedValue.Text = tostring(state.theyV)
        local targetColor = state.theyV and Color3.fromRGB(80, 220, 100) or Color3.fromRGB(255, 80, 80)
        TweenService:Create(AcceptedValue, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {TextColor3 = targetColor}):Play()
    end
    if ScamValue then
        ScamValue.Text = tostring(state.enV)
        local targetColor = state.enV and Color3.fromRGB(80, 220, 100) or Color3.fromRGB(255, 80, 80)
        TweenService:Create(ScamValue, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {TextColor3 = targetColor}):Play()
    end
    if XrayValue then
        XrayValue.Text = tostring(state.xrayV)
        local targetColor = state.xrayV and Color3.fromRGB(80, 220, 100) or Color3.fromRGB(255, 80, 80)
        TweenService:Create(XrayValue, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {TextColor3 = targetColor}):Play()
    end
end

local ScamToggle = YUUGTRL:CreateButtonToggle(
    ControlsFrame,
    YUUGTRL:GetText("AutoScam"),
    false,
    function(value)
        state.enV = value
        updateUI()
    end,
    UDim2.new(0, 5, 0, 5),
    UDim2.new(1, -10, 0, isMobile and 28 or 35),
    {
        on = Color3.fromRGB(60, 80, 200),
        off = Color3.fromRGB(60, 80, 200)
    }
)
YUUGTRL:RegisterTranslatable(ScamToggle.button, "AutoScam")

local XrayToggle = YUUGTRL:CreateButtonToggle(
    ControlsFrame,
    YUUGTRL:GetText("XRAY"),
    false,
    function(value)
        state.xrayV = value
        if player:FindFirstChild("XRay") then
            player.XRay.Value = value
        end
        updateUI()
    end,
    UDim2.new(0, 5, 0, isMobile and 37 or 45),
    UDim2.new(1, -10, 0, isMobile and 28 or 35),
    {
        on = Color3.fromRGB(120, 70, 200),
        off = Color3.fromRGB(120, 70, 200)
    }
)
YUUGTRL:RegisterTranslatable(XrayToggle.button, "XRAY")

local JumpBtn = YUUGTRL:CreateButton(ControlsFrame, YUUGTRL:GetText("JUMP"),
    function()
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
        YUUGTRL:DarkenButton(JumpBtn)
        task.wait(0.2)
        YUUGTRL:RestoreButtonStyle(JumpBtn, Color3.fromRGB(60, 160, 100))
    end,
    Color3.fromRGB(60, 160, 100),
    UDim2.new(0, 5, 0, isMobile and 69 or 85),
    UDim2.new(1, -10, 0, isMobile and 28 or 35)
)
YUUGTRL:RegisterTranslatable(JumpBtn, "JUMP")

local CollectBtn = YUUGTRL:CreateButton(ControlsFrame, YUUGTRL:GetText("CollectAll"),
    function()
        local dropped = workspace:FindFirstChild("Dropped")
        if not dropped then return end
        
        local character = player.Character
        if not character then return end
        
        local root = character:FindFirstChild("HumanoidRootPart")
        if not root then return end
        
        for _, item in pairs(dropped:GetChildren()) do
            local owner = item:FindFirstChild("Owner")
            if owner and owner.Value == player then
                if item:FindFirstChild("Handle") then
                    item.Handle.CanCollide = false
                    item.Handle.CFrame = root.CFrame + Vector3.new(0, 2, 0)
                    item.Handle.CanCollide = true
                end
            end
        end
        
        YUUGTRL:DarkenButton(CollectBtn)
        task.wait(0.2)
        YUUGTRL:RestoreButtonStyle(CollectBtn, Color3.fromRGB(220, 120, 0))
    end,
    Color3.fromRGB(220, 120, 0),
    UDim2.new(0, 5, 0, isMobile and 101 or 125),
    UDim2.new(1, -10, 0, isMobile and 28 or 35)
)
YUUGTRL:RegisterTranslatable(CollectBtn, "CollectAll")

local ResetBtn = YUUGTRL:CreateButton(ControlsFrame, YUUGTRL:GetText("Reset"),
    function()
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.Health = 0
            end
        end
        YUUGTRL:DarkenButton(ResetBtn)
        task.wait(0.3)
        YUUGTRL:RestoreButtonStyle(ResetBtn, Color3.fromRGB(180, 60, 60))
    end,
    Color3.fromRGB(180, 60, 60),
    UDim2.new(0, 5, 0, isMobile and 133 or 165),
    UDim2.new(1, -10, 0, isMobile and 28 or 35)
)
YUUGTRL:RegisterTranslatable(ResetBtn, "Reset")

local SettingsFrame = YUUGTRL:CreateFrame(Window.ScreenGui,
    isMobile and UDim2.new(0, 250, 0, 200) or UDim2.new(0, 300, 0, 250),
    UDim2.new(0.5, isMobile and -125 or -150, 0.5, isMobile and -100 or -125),
    Color3.fromRGB(22, 22, 32), 16
)
SettingsFrame.Visible = false

local SettingsHeader = YUUGTRL:CreateFrame(SettingsFrame,
    UDim2.new(1, 0, 0, isMobile and 35 or 40),
    UDim2.new(0, 0, 0, 0),
    Color3.fromRGB(32, 32, 45), 16
)

local draggingSettings = false
local dragInputSettings
local dragStartSettings
local startPosSettings

local function updateSettingsDrag(input)
    local delta = input.Position - dragStartSettings
    SettingsFrame.Position = UDim2.new(
        startPosSettings.X.Scale,
        startPosSettings.X.Offset + delta.X,
        startPosSettings.Y.Scale,
        startPosSettings.Y.Offset + delta.Y
    )
end

SettingsHeader.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingSettings = true
        dragStartSettings = input.Position
        startPosSettings = SettingsFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                draggingSettings = false
            end
        end)
    end
end)

SettingsHeader.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInputSettings = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInputSettings and draggingSettings then
        updateSettingsDrag(input)
    end
end)

local SettingsTitle = YUUGTRL:CreateLabel(SettingsHeader, YUUGTRL:GetText("Settings"),
    UDim2.new(0, 15, 0, 0),
    UDim2.new(1, -50, 1, 0)
)
SettingsTitle.TextColor3 = Color3.fromRGB(220, 220, 240)
SettingsTitle.TextSize = 16
YUUGTRL:RegisterTranslatable(SettingsTitle, "Settings")

local SettingsClose = YUUGTRL:CreateButton(SettingsHeader, "×",
    function() SettingsFrame.Visible = false end,
    Color3.fromRGB(200, 60, 60),
    UDim2.new(1, isMobile and -30 or -35, 0, isMobile and 5 or 5),
    UDim2.new(0, isMobile and 25 or 30, 0, isMobile and 25 or 30)
)

local LanguageLabel = YUUGTRL:CreateLabel(SettingsFrame, YUUGTRL:GetText("Language"),
    UDim2.new(0, 10, 0, isMobile and 45 or 50),
    UDim2.new(0, 60, 0, isMobile and 20 or 25)
)
LanguageLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
YUUGTRL:RegisterTranslatable(LanguageLabel, "Language")

local EnglishBtn = YUUGTRL:CreateButton(SettingsFrame, YUUGTRL:GetText("EN"),
    function()
        YUUGTRL:ChangeLanguage("English")
        updateUI()
        ScamToggle:SetText(YUUGTRL:GetText("AutoScam"))
        XrayToggle:SetText(YUUGTRL:GetText("XRAY"))
    end,
    Color3.fromRGB(70, 90, 200),
    UDim2.new(0, 80, 0, isMobile and 45 or 50),
    UDim2.new(0, isMobile and 40 or 45, 0, isMobile and 25 or 30)
)
YUUGTRL:RegisterTranslatable(EnglishBtn, "EN")

local ArabicBtn = YUUGTRL:CreateButton(SettingsFrame, YUUGTRL:GetText("AR"),
    function()
        YUUGTRL:ChangeLanguage("Arabic")
        updateUI()
        ScamToggle:SetText(YUUGTRL:GetText("AutoScam"))
        XrayToggle:SetText(YUUGTRL:GetText("XRAY"))
    end,
    Color3.fromRGB(70, 90, 200),
    UDim2.new(0, 130, 0, isMobile and 45 or 50),
    UDim2.new(0, isMobile and 40 or 45, 0, isMobile and 25 or 30)
)
YUUGTRL:RegisterTranslatable(ArabicBtn, "AR")

local TransparencyLabel = YUUGTRL:CreateLabel(SettingsFrame, YUUGTRL:GetText("Transparency"),
    UDim2.new(0, 10, 0, isMobile and 80 or 90),
    UDim2.new(1, -20, 0, isMobile and 20 or 25)
)
TransparencyLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
YUUGTRL:RegisterTranslatable(TransparencyLabel, "Transparency")

local SliderFrame = YUUGTRL:CreateFrame(SettingsFrame,
    UDim2.new(1, -20, 0, isMobile and 16 or 20),
    UDim2.new(0, 10, 0, isMobile and 105 or 115),
    Color3.fromRGB(40, 40, 52), 10
)

local SliderFill = YUUGTRL:CreateFrame(SliderFrame,
    UDim2.new(0, 0, 1, 0),
    UDim2.new(0, 0, 0, 0),
    Color3.fromRGB(80, 100, 220), 10
)

local SliderButton = YUUGTRL:CreateButton(SliderFrame, "", nil,
    Color3.fromRGB(255, 255, 255),
    UDim2.new(0, 0, 0, 0),
    UDim2.new(0, isMobile and 16 or 20, 0, isMobile and 16 or 20)
)
SliderButton.Position = UDim2.new(0, -10, 0, 0)
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = SliderButton

local dragging = false
SliderButton.MouseButton1Down:Connect(function()
    dragging = true
end)
SliderButton.TouchLongPress:Connect(function()
    dragging = true
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local mousePos = input.Position.X
        local sliderPos = SliderFrame.AbsolutePosition.X
        local sliderSize = SliderFrame.AbsoluteSize.X
        local relativePos = math.clamp((mousePos - sliderPos) / sliderSize, 0, 1)
        local actualTransparency = relativePos * 0.85
        
        currentTransparency = actualTransparency
        Window.Main.BackgroundTransparency = actualTransparency
        MainContainer.BackgroundTransparency = actualTransparency
        StatusScroller.BackgroundTransparency = actualTransparency
        ControlsFrame.BackgroundTransparency = actualTransparency
        
        SliderFill.Size = UDim2.new(relativePos, 0, 1, 0)
        SliderButton.Position = UDim2.new(relativePos, -10, 0, 0)
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.G then
        state.enV = not state.enV
        ScamToggle:SetState(state.enV)
        updateUI()
    end
    if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
        scriptVisible = not scriptVisible
        Window.Main.Visible = scriptVisible
    end
end)

local function deleteFieldParts()
    if workspace:FindFirstChild("Map") then
        local map = workspace.Map
        if map:FindFirstChild("GroupReward") then
            local groupReward = map.GroupReward
            local field = groupReward:FindFirstChild("Field")
            if field then field:Destroy() end
        end
        if map:FindFirstChild("VIP") then
            for _, obj in pairs(map.VIP:GetDescendants()) do
                if obj.Name == "Field" then obj:Destroy() end
            end
        end
    end
    if workspace:FindFirstChild("GoldenToilet") then
        local hitDetect = workspace.GoldenToilet:FindFirstChild("HitDetect")
        if hitDetect then hitDetect:Destroy() end
    end
end

local function monitorBoards()
    while true do
        task.wait(0.1)
        local success = pcall(function()
            local boards = workspace:FindFirstChild("Boards")
            if not boards then return end
            
            local found = false
            for _, v in pairs(boards:GetChildren()) do
                if v:FindFirstChild("Player1") then
                    if v.Player1.Value == player or v.Player2.Value == player then
                        state.Board = v
                        if v.Player1.Value == player then
                            state.YourSide = v:FindFirstChild("Player1Action")
                            state.TheirSide = v:FindFirstChild("Player2Action")
                        else
                            state.YourSide = v:FindFirstChild("Player2Action")
                            state.TheirSide = v:FindFirstChild("Player1Action")
                        end
                        state.onV = true
                        found = true
                        break
                    end
                end
            end
            if not found then
                state.Board = nil
                state.YourSide = nil
                state.TheirSide = nil
                state.onV = false
            end
        end)
        updateUI()
    end
end

local function monitorAcceptance()
    while true do
        task.wait(0.1)
        if state.TheirSide then
            state.theyV = state.TheirSide.Value == "Done"
        else
            state.theyV = false
        end
        updateUI()
    end
end

local function setDroppedCollision(enabled)
    local dropped = workspace:FindFirstChild("Dropped")
    if dropped then
        for _, item in pairs(dropped:GetChildren()) do
            if item:FindFirstChild("Handle") then
                if not enabled then
                    if not droppedCollision[item] then
                        droppedCollision[item] = item.Handle.CanCollide
                    end
                    item.Handle.CanCollide = false
                else
                    if droppedCollision[item] ~= nil then
                        item.Handle.CanCollide = droppedCollision[item]
                        droppedCollision[item] = nil
                    end
                end
            end
        end
    end
end

local function acceptTrade()
    local remote = ReplicatedStorage:FindFirstChild("RemoteEvents")
    if remote and remote:FindFirstChild("Jumped") then
        for i = 1, 15 do
            remote.Jumped:FireServer()
        end
    end
end

local function executeScam()
    while true do
        task.wait()
        local success = pcall(function()
            if state.onV and state.enV and state.theyV and state.Board then
                local yourSide
                local helMag = math.huge
                local bbb
                for i, v in pairs(state.Board:GetChildren()) do
                    if v.Name == "Controls" then
                        local theirCharacter = state.TheirSide.Parent[state.TheirSide.Name:gsub("Action", "")]
                        if theirCharacter and theirCharacter.Value and theirCharacter.Value.Character then
                            local mag = (v.Done.Pad.Position - theirCharacter.Value.Character.HumanoidRootPart.Position).Magnitude
                            if helMag == math.huge then
                                helMag = mag
                                bbb = v
                            elseif mag < helMag then
                                yourSide = bbb
                            else
                                yourSide = v
                            end
                        end
                    end
                end
                if yourSide then
                    setDroppedCollision(false)
                    local toTp = yourSide.Done.Pad.CFrame
                    local char = player.Character or player.CharacterAdded:Wait()
                    char.HumanoidRootPart.CFrame = toTp + Vector3.new(0, 4, 0)
                    
                    local function collectItems()
                        local n = false
                        for i, v2 in pairs(workspace.Dropped:GetChildren()) do
                            if v2.Owner.Value == player or v2.Owner.Value == player.Character then
                                for is, vs in pairs(player.Character:GetChildren()) do
                                    if vs:IsA("MeshPart") or (vs:IsA("BasePart") and vs.Name ~= "HumanoidRootPart") then
                                        firetouchinterest(vs, v2.Handle, 1)
                                        firetouchinterest(vs, v2.Handle, 0)
                                        n = true
                                        break
                                    end
                                end
                            end
                        end
                        if n then
                            task.wait()
                            collectItems()
                        end
                    end
                    collectItems()
                    
                    acceptTrade()
                    
                    char.HumanoidRootPart.CFrame = state.Board.MAIN.CFrame + Vector3.new(0, 4, 0)
                    
                    setDroppedCollision(true)
                    state.enV = false
                    ScamToggle:SetState(false)
                    updateUI()
                end
            end
        end)
    end
end

deleteFieldParts()
spawn(monitorBoards)
spawn(monitorAcceptance)
spawn(executeScam)

Window:SetSettingsCallback(function()
    SettingsFrame.Visible = not SettingsFrame.Visible
end)

local headerGradient = Window.Header:FindFirstChildOfClass("UIGradient")
if headerGradient then
    local colors = {
        Color3.fromRGB(60, 80, 200),
        Color3.fromRGB(140, 70, 220)
    }
    local currentColor = 1
    
    spawn(function()
        while true do
            task.wait(10)
            currentColor = currentColor == 1 and 2 or 1
            headerGradient.Color = ColorSequence.new(colors[currentColor])
        end
    end)
end

updateUI()
