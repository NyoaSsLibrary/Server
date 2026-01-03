-- ========================================
--          NyoaSs - Ultimate Script
--           by Slivkineepy | NyoaSS
--          discord.gg/WBYkWfPQC2
-- ========================================

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")

local playerGui = Player:WaitForChild("PlayerGui")

-- FPS & Ping Counter
loadstring(game:HttpGet("https://raw.githubusercontent.com/NyoaSsLibrary/Server/refs/heads/main/obfuscated_Fps_Ping.lua.txt"))()

-- ========================================
--          Notifications
-- ========================================

local notifyGui = Instance.new("ScreenGui")
notifyGui.Name = "NyoaSsNotif"
notifyGui.ResetOnSpawn = false
notifyGui.IgnoreGuiInset = true
notifyGui.Parent = playerGui

local function createNotify(text)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 56)
    frame.Position = UDim2.new(0.5, -150, 0, -70)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.ZIndex = 1000
    frame.Parent = notifyGui

    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Color3.new(1, 1, 1)
    stroke.Transparency = 0.8
    stroke.Thickness = 1

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -50, 0, 22)
    title.Position = UDim2.new(0, 12, 0, 8)
    title.BackgroundTransparency = 1
    title.Text = text
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 15
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 1000
    title.Parent = frame

    local author = Instance.new("TextLabel")
    author.Size = UDim2.new(1, -50, 0, 16)
    author.Position = UDim2.new(0, 12, 0, 30)
    author.BackgroundTransparency = 1
    author.Text = "by Slivkineepy | NyoaSS"
    author.TextColor3 = Color3.fromRGB(160, 160, 170)
    author.Font = Enum.Font.Gotham
    author.TextSize = 12
    author.TextXAlignment = Enum.TextXAlignment.Left
    author.ZIndex = 1000
    author.Parent = frame

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 24, 0, 24)
    closeBtn.Position = UDim2.new(1, -32, 0, 8)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Text = "x"
    closeBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 18
    closeBtn.ZIndex = 1000
    closeBtn.Parent = frame

    local barBg = Instance.new("Frame")
    barBg.Size = UDim2.new(1, -24, 0, 3)
    barBg.Position = UDim2.new(0, 12, 1, -10)
    barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    barBg.ZIndex = 1000
    barBg.Parent = frame
    Instance.new("UICorner", barBg).CornerRadius = UDim.new(0, 2)

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1, 0, 1, 0)
    bar.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
    bar.ZIndex = 1000
    bar.Parent = barBg
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 2)

    local shown = false
    local function hide()
        if shown then
            shown = false
            TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Position = UDim2.new(0.5, -150, 0, -70)}):Play()
            task.wait(0.45)
            frame:Destroy()
        end
    end

    local function show()
        shown = true
        TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Position = UDim2.new(0.5, -150, 0, 12)}):Play()
        local tween = TweenService:Create(bar, TweenInfo.new(5, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)})
        tween:Play()
        tween.Completed:Wait()
        if shown then hide() end
    end

    closeBtn.MouseButton1Click:Connect(hide)
    task.spawn(show)
end

task.spawn(function()
    task.wait(0.5)
    createNotify("NyoaSs has been loaded 🎅")
end)

-- ========================================
--          Anti-Detect
-- ========================================

spawn(function()
    if debug and debug.getinfo then
        local info = debug.getinfo(2, "S")
        if info and info.source and string.find(info.source, "@") then
            pcall(function() Player:Kick("no dumping bud") end)
        end
    end

    local badNames = {
        ExplorerSelections = true, EditAttributeButton = true, Dex = true, DEX = true,
        SimpleSpy = true, TurtleSpy = true, AwesomeExplorer = true, Hydroxide = true,
        RemoteSpy = true, RemoteBrowser = true, PropertiesFrame = true, ExplorerPanel = true
    }

    local badAssets = {
        ["rbxassetid://5054663650"] = true,
        ["rbxassetid://1427967925"] = true,
        ["rbxassetid://9887697099"] = true,
        ["rbxassetid://9887696628"] = true,
        ["rbxassetid://9896472554"] = true,
        ["rbxassetid://9887696922"] = true,
        ["rbxassetid://9887696242"] = true,
        ["rbxassetid://169476802"] = true,
        ["rbxassetid://5642383285"] = true,
        ["rbxassetid://1204397029"] = true
    }

    local badPhrases = {
        "clear logs", "exclude", "ignores remotes", "remotespy", "simple spy", "turtle spy",
        "remote spy", "invoke", "fire server", "block remote", "log remote", "spy remote"
    }

    local function isBad(obj)
        if not obj then return false end
        if badNames[obj.Name] then return true end
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            local success, img = pcall(function() return obj.Image end)
            if success and badAssets[img] then return true end
        end
        local n = string.lower(obj.Name or "")
        if string.find(n, "dex") or string.find(n, "spy") then
            if not string.find(n, "index") then return true end
        end
        return false
    end

    local function checkText(o)
        if o:IsA("TextLabel") or o:IsA("TextButton") or o:IsA("TextBox") then
            local success, t = pcall(function() return o.Text end)
            if success and t then
                local l = string.lower(t)
                for _, p in badPhrases do
                    if string.find(l, p) then
                        pcall(function() Player:Kick("Ey man spy") end)
                        return
                    end
                end
            end
        end
    end

    local hits = 0
    local last = 0

    CoreGui.DescendantAdded:Connect(function(o)
        spawn(function()
            if isBad(o) then
                local now = tick()
                if now - last > 5 then hits = 0 end
                last = now
                hits = hits + 1
                if hits >= 4 then pcall(function() Player:Kick("tool detected") end) end
            end
            checkText(o)
        end)
    end)

    local old = print
    local r = false
    print = function(...)
        if r then return old(...) end
        r = true
        for _, v in {...} do
            if type(v) == "string" then
                local l = string.lower(v)
                if string.find(l, "remotespy") or string.find(l, "blacklisted") then
                    r = false
                    pcall(function() Player:Kick("logging detected") end)
                    return
                end
            end
        end
        r = false
        old(...)
    end
end)

-- ========================================
--          Utilities
-- ========================================

local function Drag(frame, handle)
    handle = handle or frame
    local dragging = false
    local dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input == dragInput or input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)
end

-- ========================================
--          Xray (Optimized)
-- ========================================

local xrayEnabled = false
local xrayParts = {}  -- Table to store modified parts for quick revert

local function CollectXrayParts(cur)
    if cur:FindFirstChild("AnimationController") then return end
    for _, v in pairs(cur:GetChildren()) do
        if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
            table.insert(xrayParts, v)
        end
        CollectXrayParts(v)
    end
end

local function EnableXray()
    if #xrayParts == 0 then
        CollectXrayParts(obj)
    end
    for _, part in ipairs(xrayParts) do
        part.LocalTransparencyModifier = 0.75
    end
end

local function DisableXray()
    for _, part in ipairs(xrayParts) do
        part.LocalTransparencyModifier = 0
    end
end

-- ========================================
--          Plot ESP
-- ========================================

local obj = Workspace:WaitForChild("Plots")

local PlotESP_Data = {}

local function CreatePlotESP(plot)
    if not plot or not plot:FindFirstChild("Spawn") or PlotESP_Data[plot] then return end
    local spawn = plot.Spawn

    if spawn:FindFirstChild("PlotESP_Billboard") then spawn.PlotESP_Billboard:Destroy() end

    local bill = Instance.new("BillboardGui")
    bill.Name = "PlotESP_Billboard"
    bill.Adornee = spawn
    bill.Size = UDim2.new(0,200,0,80)
    bill.StudsOffset = Vector3.new(0,25,0)
    bill.AlwaysOnTop = true
    bill.Parent = spawn

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1,0,1,0)
    frame.BackgroundTransparency = 1
    frame.Parent = bill

    local owner = Instance.new("TextLabel")
    owner.Size = UDim2.new(1,0,0.5,0)
    owner.BackgroundTransparency = 1
    owner.TextColor3 = Color3.fromRGB(0,255,255)
    owner.Font = Enum.Font.Arcade
    owner.TextSize = 28
    owner.TextStrokeTransparency = 0
    owner.Text = plot:FindFirstChild("Owner") and "Owner: "..plot.Owner.Value or "Free"
    owner.Parent = frame

    local dist = Instance.new("TextLabel")
    dist.Size = UDim2.new(1,0,0.5,0)
    dist.Position = UDim2.new(0,0,0.5,0)
    dist.BackgroundTransparency = 1
    dist.TextColor3 = Color3.fromRGB(255,255,100)
    dist.Font = Enum.Font.Arcade
    dist.TextSize = 24
    dist.TextStrokeTransparency = 0
    dist.Parent = frame

    local conn = RunService.Heartbeat:Connect(function()
        if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            local d = (Player.Character.HumanoidRootPart.Position - spawn.Position).Magnitude
            dist.Text = string.format("%.0f studs", d)
            if plot:FindFirstChild("Owner") then owner.Text = "Owner: "..plot.Owner.Value end
        end
    end)

    PlotESP_Data[plot] = {bill=bill, owner=owner, dist=dist, conn=conn}
end

local function RemovePlotESP(plot)
    if not PlotESP_Data[plot] then return end
    if PlotESP_Data[plot].bill then PlotESP_Data[plot].bill:Destroy() end
    if PlotESP_Data[plot].conn then PlotESP_Data[plot].conn:Disconnect() end
    PlotESP_Data[plot] = nil
end

-- ========================================
--          Plot Time ESP
-- ========================================

local PlotTimeESP_Data = {}

local function GetPlotTime(plot)
    if plot:FindFirstChild("Timer") then return plot.Timer.Value end
    if plot:FindFirstChild("TimeLeft") then return plot.TimeLeft.Value end
    if plot:FindFirstChild("Time") then return plot.Time.Value end
    if plot:GetAttribute("TimeLeft") then return plot:GetAttribute("TimeLeft") end
    if plot:GetAttribute("Timer") then return plot:GetAttribute("Timer") end
    return nil
end

local function CreateTimeESP(plot)
    if not plot or not plot:FindFirstChild("Spawn") or PlotTimeESP_Data[plot] then return end
    local spawn = plot.Spawn

    local bill = Instance.new("BillboardGui")
    bill.Name = "PlotTimeESP"
    bill.Adornee = spawn
    bill.Size = UDim2.new(0,200,0,40)
    bill.StudsOffset = Vector3.new(0,15,0)
    bill.AlwaysOnTop = true
    bill.Parent = spawn

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1,0,1,0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(100,255,100)
    label.Font = Enum.Font.Arcade
    label.TextSize = 30
    label.TextStrokeTransparency = 0
    label.Text = "Time: ∞"
    label.Parent = bill

    local conn = RunService.Heartbeat:Connect(function()
        local t = GetPlotTime(plot)
        if t and t > 0 then
            local m = math.floor(t/60)
            local s = t % 60
            label.Text = string.format("Time: %02d:%02d", m, s)
            label.TextColor3 = t < 60 and Color3.fromRGB(255,50,50) or Color3.fromRGB(100,255,100)
        else
            label.Text = "Time: ∞"
            label.TextColor3 = Color3.fromRGB(150,150,150)
        end
    end)

    PlotTimeESP_Data[plot] = {bill = bill, label = label, conn = conn}
end

local function RemoveTimeESP(plot)
    if not PlotTimeESP_Data[plot] then return end
    if PlotTimeESP_Data[plot].bill then PlotTimeESP_Data[plot].bill:Destroy() end
    if PlotTimeESP_Data[plot].conn then PlotTimeESP_Data[plot].conn:Disconnect() end
    PlotTimeESP_Data[plot] = nil
end

-- ========================================
--          Brainrot ESP
-- ========================================

local brainrotEspEnabled = false
local activeBestBrainrotESPs = {}
local heartbeatConn = nil

local function parseNumber(txt)
    local cleaned = txt:gsub(',',''):gsub('%s+',''):gsub('%$','')
    local num,suffix = cleaned:match('(%d+%.?%d*)([kKmMb]?)%/s')
    if not num then return nil end
    local value = tonumber(num)
    if not value then return nil end
    suffix = suffix:lower()
    if suffix == 'k' then value = value * 1e3
    elseif suffix == 'm' then value = value * 1e6
    elseif suffix == 'b' then value = value * 1e9 end
    return value
end

local function getRainbowColor()
    local t = tick() * 2
    local r = math.floor(math.sin(t) * 127 + 128)
    local g = math.floor(math.sin(t + 2) * 127 + 128)
    local b = math.floor(math.sin(t + 4) * 127 + 128)
    return Color3.fromRGB(r, g, b)
end

local function getColorFromModel(model, labelText)
    local fullText = (model.Name or ''):lower() .. ' ' .. (labelText or ''):lower()
    if fullText:find('gold') then return Color3.fromRGB(255,215,0)
    elseif fullText:find('diamond') then return Color3.fromRGB(0,170,255)
    elseif fullText:find('rainbow') then return 'rainbow'
    elseif fullText:find('lava') then return Color3.fromRGB(255,69,0)
    elseif fullText:find('bloodrot') then return Color3.fromRGB(139,0,0)
    elseif fullText:find('candy') then return Color3.fromRGB(255,105,180)
    elseif fullText:find('galaxy') then return Color3.fromRGB(170,0,255)
    elseif fullText:find('yin yang') then return Color3.fromRGB(255,255,255)
    elseif fullText:find('chocolate') then return Color3.fromRGB(139,69,19)
    elseif fullText:find('pollinated') then return Color3.fromRGB(255,255,0)
    elseif fullText:find('frozen') then return Color3.fromRGB(173,216,230)
    else return Color3.fromRGB(170, 0, 255) end
end

local function createESP(model, displayText)
    local color = getColorFromModel(model, displayText)
    local highlight = Instance.new('Highlight')
    highlight.Name = 'BrainrotESPHighlight'
    highlight.Adornee = model
    highlight.FillTransparency = 0.6
    highlight.OutlineTransparency = 0
    if color ~= 'rainbow' then
        highlight.FillColor = color
        highlight.OutlineColor = color
    end
    highlight.Parent = Workspace

    local part = model.PrimaryPart or model:FindFirstChildWhichIsA('BasePart')
    if not part then return highlight, nil, nil end

    local tag = Instance.new('BillboardGui')
    tag.Name = 'BrainrotESPTag'
    tag.Size = UDim2.new(0, 200, 0, 50)
    tag.AlwaysOnTop = true
    tag.StudsOffset = Vector3.new(0, 8, 0)
    tag.Adornee = part
    tag.Parent = Workspace

    local label = Instance.new('TextLabel')
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = displayText or model.Name
    label.TextStrokeTransparency = 0.5
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.TextColor3 = (color == 'rainbow') and getRainbowColor() or color
    label.Parent = tag

    return highlight, tag, label
end

local function isMyPlot(plot)
    local sign = plot:FindFirstChild("PlotSign")
    return sign and sign:FindFirstChild("YourBase") and sign.YourBase.Enabled
end

local function getBestBrainrots()
    local maxValue = -1
    local bestLabel = nil
    if not Workspace:FindFirstChild('Plots') then return {} end

    for _, plot in pairs(Workspace.Plots:GetChildren()) do
        if isMyPlot(plot) then continue end

        for _, obj in pairs(plot:GetDescendants()) do
            if obj:IsA('TextLabel') then
                local txt = obj.Text or ''
                if txt:find('/') and txt:lower():find('s') then
                    local val = parseNumber(txt)
                    if val and val > maxValue then
                        maxValue = val
                        bestLabel = obj
                    end
                end
            end
        end
    end

    local results = {}
    if bestLabel then
        local model = bestLabel:FindFirstAncestorOfClass('Model')
        if model then table.insert(results, {model, bestLabel.Text}) end
    end
    return results
end

local function clearESP(model)
    local esp = activeBestBrainrotESPs[model]
    if esp then
        for _, obj in pairs(esp) do
            if typeof(obj) == "Instance" then obj:Destroy()
            elseif typeof(obj) == "RBXScriptConnection" then obj:Disconnect() end
        end
        activeBestBrainrotESPs[model] = nil
    end
end

local updateInterval = 3

local function startBrainrotEsp()
    if brainrotEspEnabled then return end
    brainrotEspEnabled = true

    task.spawn(function()
        while brainrotEspEnabled do
            local bestModels = getBestBrainrots()
            local newSet = {}

            for _, data in ipairs(bestModels) do
                local model, labelText = data[1], data[2]
                if model and model.Parent then
                    newSet[model] = true

                    if not activeBestBrainrotESPs[model] then
                        local highlight, tag, label = createESP(model, labelText)
                        activeBestBrainrotESPs[model] = {highlight, tag, label}
                    else
                        local esp = activeBestBrainrotESPs[model]
                        esp[3].Text = labelText
                    end
                end
            end

            for model in pairs(activeBestBrainrotESPs) do
                if not newSet[model] then
                    clearESP(model)
                end
            end

            task.wait(updateInterval)
        end
    end)
end

local function stopBrainrotEsp()
    brainrotEspEnabled = false
    for model, esp in pairs(activeBestBrainrotESPs) do
        clearESP(model)
    end
    activeBestBrainrotESPs = {}
end

-- ========================================
--          Player ESP
-- ========================================

local espEnabled = false
local espConnections = {}
local ESP_NAME = "NyoaEsp_3D_BOX"

local function clearEsp(char)
    for _, v in ipairs(char:GetChildren()) do
        if v.Name == ESP_NAME then v:Destroy() end
    end
end

local function createBox(char)
    if not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart

    local box = Instance.new("BoxHandleAdornment")
    box.Name = ESP_NAME
    box.Adornee = hrp
    box.Size = Vector3.new(4.2, 6.2, 2.4)
    box.Color3 = Color3.fromRGB(255, 255, 255)
    box.Transparency = 0.45
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Parent = char
end

local function setupEsp(player)
    if player == Player then return end

    local function onChar(char)
        clearEsp(char)
        createBox(char)
    end

    if player.Character then onChar(player.Character) end

    local conn = player.CharacterAdded:Connect(onChar)
    table.insert(espConnections, conn)
end

local function enableEsp()
    if espEnabled then return end
    espEnabled = true

    for _, p in ipairs(Players:GetPlayers()) do
        setupEsp(p)
    end

    table.insert(espConnections, Players.PlayerAdded:Connect(setupEsp))
end

local function disableEsp()
    if not espEnabled then return end
    espEnabled = false

    for _, p in ipairs(Players:GetPlayers()) do
        if p.Character then clearEsp(p.Character) end
    end

    for _, conn in ipairs(espConnections) do conn:Disconnect() end
    espConnections = {}
end

-- ========================================
--          Best Price ESP
-- ========================================

spawn(function()
    pcall(function()
        local LocalPlayer = Players.LocalPlayer
        local PlotController = require(ReplicatedStorage.Controllers.PlotController)
        require(ReplicatedStorage.Datas.Animals)
        local AnimalsShared = require(ReplicatedStorage.Shared.Animals)

        local GREEN = Color3.fromRGB(0,255,0)

        local State = {
            highlights = {},
            guis = {},
            beams = {},
            CHECK_DELAY = 2,
            excludeOwnBase = true,
            enabled = false
        }

        local loopConnection = nil

        local function Clear()
            for _,v in pairs(State.highlights) do if v and v.Parent then v:Destroy() end end
            for _,v in pairs(State.guis) do if v and v.Parent then v:Destroy() end end
            for _,v in pairs(State.beams) do if v and v.Parent then v:Destroy() end end
            table.clear(State.highlights)
            table.clear(State.guis)
            table.clear(State.beams)
        end

        local function FormatPrice(v)
            if v >= 1e9 then
                return math.floor(v/1e9).. "B"
            elseif v >= 1e6 then
                return math.floor(v/1e6).. "M"
            elseif v >= 1e3 then
                return math.floor(v/1e3).. "K"
            else
                return tostring(math.floor(v))
            end
        end

        local function AddHighlight(podium)
            local h = Instance.new("Highlight")
            h.FillColor = GREEN
            h.OutlineColor = GREEN
            h.FillTransparency = 0
            h.OutlineTransparency = 0
            h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            h.Parent = podium
            table.insert(State.highlights, h)
        end

        local function AddBeam(podium)
            local part = podium:FindFirstChildWhichIsA("BasePart", true)
            if not part then return end

            local beam = Instance.new("Beam")
            beam.FaceCamera = true
            beam.Width0 = 0.7
            beam.Width1 = 0.7
            beam.Color = ColorSequence.new(GREEN)
            beam.Transparency = NumberSequence.new(0)
            beam.Parent = Workspace

            local a0 = Instance.new("Attachment")
            a0.Parent = Workspace.Terrain

            local a1 = Instance.new("Attachment")
            a1.Parent = part

            beam.Attachment0 = a0
            beam.Attachment1 = a1

            RunService.Heartbeat:Connect(function()
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("Head") then
                    a0.Position = char.Head.Position
                end
            end)

            table.insert(State.beams, beam)
        end

        local function AddBillboard(podium, price)
            local part = podium:FindFirstChildWhichIsA("BasePart", true)
            if not part then return end

            local bb = Instance.new("BillboardGui")
            bb.Adornee = part
            bb.AlwaysOnTop = true
            bb.Size = UDim2.new(0,120,0,30)
            bb.StudsOffset = Vector3.new(0,6,0)
            bb.Parent = Workspace

            local tl = Instance.new("TextLabel")
            tl.Size = UDim2.new(1,0,1,0)
            tl.BackgroundTransparency = 1
            tl.TextScaled = true
            tl.Font = Enum.Font.GothamBold
            tl.TextStrokeTransparency = 0.4
            tl.RichText = true
            tl.Text = "<font color='#00FF00'>$"..FormatPrice(price).."</font>"
            tl.Parent = bb

            table.insert(State.guis, bb)
        end

        local function GetPlots()
            if not getgenv()._plots then
                getgenv()._plots = getupvalue(PlotController.Start,2)
            end
            return getgenv()._plots
        end

        local function GetPlotAnimals(plot)
            local _, data = (plot or PlotController:GetMyPlot()).Channel:Get("AnimalList")
            return data.AnimalList
        end

        local function GetAnimalPrice(index)
            return AnimalsShared:GetPrice(index)
        end

        local function StartBestPriceESP()
            if State.enabled then return end
            State.enabled = true

            loopConnection = task.spawn(function()
                while State.enabled do
                    Clear()

                    local bestPrice = -math.huge
                    local bestAnimal

                    for _, plot in pairs(GetPlots()) do
                        if not State.excludeOwnBase or plot.UID ~= PlotController:GetMyPlot().UID then
                            local animals = GetPlotAnimals(plot)
                            if animals then
                                for idx, data in pairs(animals) do
                                    if data ~= "Empty" and data.Steal == false then
                                        local price = GetAnimalPrice(data.Index)
                                        if price and price > bestPrice then
                                            bestPrice = price
                                            bestAnimal = {plotUID = plot.UID, index = idx, price = price}
                                        end
                                    end
                                end
                            end
                        end
                    end

                    if bestAnimal then
                        local ok, podium = pcall(function()
                            return Workspace.Plots[bestAnimal.plotUID].AnimalPodiums[bestAnimal.index]
                        end)
                        if ok and podium then
                            AddHighlight(podium)
                            AddBeam(podium)
                            AddBillboard(podium, bestAnimal.price)
                        end
                    end

                    task.wait(State.CHECK_DELAY)
                end
            end)
        end

        local function StopBestPriceESP()
            if not State.enabled then return end
            State.enabled = false
            if loopConnection then
                task.cancel(loopConnection)
                loopConnection = nil
            end
            Clear()
        end
    end)
end)

-- ========================================
--          Semi Invisible + Godmode
-- ========================================

local semiConnections = { SemiInvisible = {} }
local isSemiInvisible = false
local clonePart, oldRootPart, savedHipHeight, currentAnimTrack, preSimConn, charAddedConn

local DEPTH_OFFSET = 0.09

local function toggleSemiInvisible(state)
    local char = Player.Character
    if not char or not char:FindFirstChild("Humanoid") or char.Humanoid.Health <= 0 then return end

    local function removeAntiCheatFolders()
        local playerFolder = Workspace:FindFirstChild(Player.Name)
        if not playerFolder then return end
        for _, folderName in pairs({"DoubleRig", "Constraints"}) do
            local folder = playerFolder:FindFirstChild(folderName)
            if folder then folder:Destroy() end
        end
        local conn = playerFolder.ChildAdded:Connect(function(child)
            if child.Name == "DoubleRig" or child.Name == "Constraints" then child:Destroy() end
        end)
        table.insert(semiConnections.SemiInvisible, conn)
    end

    local function cloneRootPart()
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return false end

        savedHipHeight = char.Humanoid.HipHeight
        oldRootPart = hrp

        local tempModel = Instance.new("Model")
        char.Parent = tempModel

        clonePart = hrp:Clone()
        clonePart.Parent = char
        oldRootPart.Parent = Workspace.CurrentCamera
        clonePart.CFrame = oldRootPart.CFrame
        char.PrimaryPart = clonePart
        char.Parent = Workspace

        for _, joint in pairs(char:GetDescendants()) do
            if joint:IsA("Motor6D") or joint:IsA("Weld") then
                if joint.Part0 == oldRootPart then joint.Part0 = clonePart end
                if joint.Part1 == oldRootPart then joint.Part1 = clonePart end
            end
        end

        tempModel:Destroy()
        return true
    end

    local function revertRootPart()
        if not oldRootPart or not clonePart then return end

        local tempModel = Instance.new("Model")
        char.Parent = tempModel

        oldRootPart.Parent = char
        char.PrimaryPart = oldRootPart
        char.Parent = Workspace

        for _, joint in pairs(char:GetDescendants()) do
            if joint:IsA("Motor6D") or joint:IsA("Weld") then
                if joint.Part0 == clonePart then joint.Part0 = oldRootPart end
                if joint.Part1 == clonePart then joint.Part1 = oldRootPart end
            end
        end

        local savedCFrame = clonePart.CFrame
        clonePart:Destroy()
        clonePart = nil
        oldRootPart.CFrame = savedCFrame
        oldRootPart = nil

        if char:FindFirstChild("Humanoid") then
            char.Humanoid.HipHeight = savedHipHeight or 0
        end

        tempModel:Destroy()
    end

    local function playFreezeAnimation()
        local anim = Instance.new("Animation")
        anim.AnimationId = "http://www.roblox.com/asset/?id=18537363391"
        local animator = char.Humanoid:FindFirstChild("Animator") or Instance.new("Animator", char.Humanoid)
        currentAnimTrack = animator:LoadAnimation(anim)
        currentAnimTrack.Priority = Enum.AnimationPriority.Action4
        currentAnimTrack:Play(0, 1, 0)
        anim:Destroy()

        local stoppedConn = currentAnimTrack.Stopped:Connect(function()
            if isSemiInvisible then playFreezeAnimation() end
        end)
        table.insert(semiConnections.SemiInvisible, stoppedConn)

        task.delay(0, function()
            currentAnimTrack.TimePosition = 0.7
            task.delay(1, function() currentAnimTrack:AdjustSpeed(math.huge) end)
        end)
    end

    local function setupGodmode()
        local hum = char:FindFirstChild("Humanoid")
        if not hum then return end

        local mt = getrawmetatable(game)
        local oldNamecall = mt.__namecall
        local oldIndex = mt.__newindex
        setreadonly(mt, false)

        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if self == hum then
                if method == "ChangeState" and select(1, ...) == Enum.HumanoidStateType.Dead then return end
                if method == "SetStateEnabled" then
                    local state, enabled = ...
                    if state == Enum.HumanoidStateType.Dead and enabled then return end
                end
                if method == "Destroy" then return end
            end
            if self == char and method == "BreakJoints" then return end
            return oldNamecall(self, ...)
        end)

        mt.__newindex = newcclosure(function(self, key, value)
            if self == hum then
                if key == "Health" and value <= 0 then return end
                if key == "MaxHealth" and value < hum.MaxHealth then return end
                if key == "BreakJointsOnDeath" and value == true then return end
            end
            return oldIndex(self, key, value)
        end)

        setreadonly(mt, true)
    end

    if state then
        removeAntiCheatFolders()
        setupGodmode()
        if cloneRootPart() then
            task.wait(0.1)
            playFreezeAnimation()

            preSimConn = RunService.PreSimulation:Connect(function()
                if char and char.PrimaryPart and oldRootPart then
                    local root = char.PrimaryPart
                    local offsetY = char.Humanoid.HipHeight + (root.Size.Y / 2) - 1 + DEPTH_OFFSET
                    local cf = root.CFrame - Vector3.new(0, offsetY, 0)
                    oldRootPart.CFrame = cf * CFrame.Angles(math.rad(180), 0, 0)
                    oldRootPart.Velocity = root.Velocity
                    oldRootPart.CanCollide = false
                end
            end)
            table.insert(semiConnections.SemiInvisible, preSimConn)

            charAddedConn = Player.CharacterAdded:Connect(function()
                if isSemiInvisible then toggleSemiInvisible(false) end
            end)
            table.insert(semiConnections.SemiInvisible, charAddedConn)

            isSemiInvisible = true
        end
    else
        if currentAnimTrack then currentAnimTrack:Stop() currentAnimTrack:Destroy() currentAnimTrack = nil end
        if preSimConn then preSimConn:Disconnect() end
        if charAddedConn then charAddedConn:Disconnect() end
        revertRootPart()
        for _, conn in ipairs(semiConnections.SemiInvisible) do
            if conn and conn.Connected then conn:Disconnect() end
        end
        semiConnections.SemiInvisible = {}
        isSemiInvisible = false
    end
end

-- ========================================
--          Float GUI
-- ========================================

local FloatGui_Enabled = false

local function OpenFloatGui()
    if FloatGui_Enabled then return end
    FloatGui_Enabled = true

    local gui = Instance.new("ScreenGui")
    gui.Name = "NyoaSs_FloatGui"
    gui.ResetOnSpawn = false
    gui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 140, 0, 44)
    frame.Position = UDim2.new(0.02, 0, 0.33, 0)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.Active = true
    frame.Draggable = true
    frame.Parent = gui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -12, 1, -12)
    btn.Position = UDim2.new(0, 6, 0, 6)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.Text = "Float: OFF"
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = frame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    local close = Instance.new("TextButton")
    close.Size = UDim2.new(0, 26, 0, 26)
    close.Position = UDim2.new(1, -16, 0, -10)
    close.BackgroundColor3 = Color3.fromRGB(190, 30, 30)
    close.Text = "X"
    close.TextColor3 = Color3.new(1, 1, 1)
    close.TextScaled = true
    close.Font = Enum.Font.GothamBold
    close.Parent = frame
    Instance.new("UICorner", close).CornerRadius = UDim.new(0, 8)

    local enabled = false
    local floatPart, bodyVel, con

    local function startFloat()
        if enabled then return end
        enabled = true
        btn.Text = "Float: ON"
        btn.BackgroundColor3 = Color3.fromRGB(0, 130, 200)

        local char = Player.Character or Player.CharacterAdded:Wait()
        local root = char:WaitForChild("HumanoidRootPart")
        local hum = char:WaitForChild("Humanoid")

        floatPart = Instance.new("Part")
        floatPart.Size = Vector3.new(4, 1, 4)
        floatPart.Transparency = 1
        floatPart.CanCollide = false
        floatPart.Anchored = false
        floatPart.Massless = true
        floatPart.Parent = Workspace

        local weld = Instance.new("Weld")
        weld.Part0 = root
        weld.Part1 = floatPart
        weld.C0 = CFrame.new(0, -3.5, 0)
        weld.Parent = floatPart

        bodyVel = Instance.new("BodyVelocity")
        bodyVel.MaxForce = Vector3.new(0, 99999, 0)
        bodyVel.P = 3000
        bodyVel.Velocity = Vector3.new(0, 0, 0)
        bodyVel.Parent = floatPart

        con = RunService.Stepped:Connect(function()
            if not enabled or hum.Health <= 0 then return end
            local state = hum:GetState()
            local inAir = state == Enum.HumanoidStateType.Freefall or state == Enum.HumanoidStateType.FallingDown or state == Enum.HumanoidStateType.Jumping
            local ray = Workspace:Raycast(root.Position, Vector3.new(0, -5, 0))
            local onGround = ray ~= nil
            if inAir or not onGround then
                bodyVel.Velocity = Vector3.new(0, -3.2, 0)
            else
                bodyVel.Velocity = Vector3.new(0, 0, 0)
            end
        end)
    end

    local function stopFloat()
        enabled = false
        btn.Text = "Float: OFF"
        btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        if floatPart then floatPart:Destroy() end
        if con then con:Disconnect() end
    end

    btn.MouseButton1Click:Connect(function()
        if enabled then stopFloat() else startFloat() end
    end)

    close.MouseButton1Click:Connect(function()
        stopFloat()
        gui:Destroy()
        FloatGui_Enabled = false
    end)

    Player.CharacterAdded:Connect(function()
        task.wait(1)
        if enabled then stopFloat() task.wait(0.1) startFloat() end
    end)
end

-- ========================================
--          Nyoa Fly
-- ========================================

local NyoaFly_Enabled = false

local function OpenNyoaFly()
    if NyoaFly_Enabled then return end
    NyoaFly_Enabled = true

    local gui = Instance.new("ScreenGui")
    gui.Name = "NyoaSsFly"
    gui.ResetOnSpawn = false
    gui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0,140,0,44)
    frame.Position = UDim2.new(0.02,0,0.33,0)
    frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
    frame.Active = true
    frame.Draggable = true
    frame.Parent = gui
    Instance.new("UICorner",frame).CornerRadius = UDim.new(0,10)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,-12,1,-12)
    btn.Position = UDim2.new(0,6,0,6)
    btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
    btn.Text = "NyoaSs Fly: OFF"
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = frame
    Instance.new("UICorner",btn).CornerRadius = UDim.new(0,8)

    local close = Instance.new("TextButton")
    close.Size = UDim2.new(0,26,0,26)
    close.Position = UDim2.new(1,-16,0,-10)
    close.BackgroundColor3 = Color3.fromRGB(190,30,30)
    close.Text = "X"
    close.TextColor3 = Color3.new(1,1,1)
    close.TextScaled = true
    close.Font = Enum.Font.GothamBold
    close.Parent = frame
    Instance.new("UICorner",close).CornerRadius = UDim.new(0,8)

    local flying = false
    local conn = nil
    local speed = 28.5

    local function startFly()
        if flying then return end
        flying = true
        btn.Text = "NyoaSs Fly: ON"
        btn.BackgroundColor3 = Color3.fromRGB(0,170,255)

        conn = RunService.Heartbeat:Connect(function()
            local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
            if hrp and flying then
                hrp.Velocity = Workspace.CurrentCamera.CFrame.LookVector * speed
            end
        end)
    end

    local function stopFly()
        flying = false
        btn.Text = "NyoaSs Fly: OFF"
        btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
        if conn then conn:Disconnect() end
        local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then hrp.Velocity = Vector3.zero end
    end

    btn.MouseButton1Click:Connect(function()
        if flying then stopFly() else startFly() end
    end)

    close.MouseButton1Click:Connect(function()
        stopFly()
        gui:Destroy()
        NyoaFly_Enabled = false
    end)

    Player.CharacterAdded:Connect(function()
        task.wait(0.3)
        if flying then stopFly() task.wait(0.1) startFly() end
    end)

    Player.CharacterRemoving:Connect(stopFly)
end

-- ========================================
--          Nyoa Boost
-- ========================================

local NyoaBoost_Enabled = false

local function OpenNyoaBoost()
    if NyoaBoost_Enabled then return end
    NyoaBoost_Enabled = true

    local gui = Instance.new("ScreenGui")
    gui.Name = "NyoaSsBoost"
    gui.ResetOnSpawn = false
    gui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0,140,0,44)
    frame.Position = UDim2.new(0.02,0,0.33,0)
    frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
    frame.Active = true
    frame.Draggable = true
    frame.Parent = gui
    Instance.new("UICorner",frame).CornerRadius = UDim.new(0,10)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,-12,1,-12)
    btn.Position = UDim2.new(0,6,0,6)
    btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
    btn.Text = "Nyoa.Ss Boost: OFF"
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = frame
    Instance.new("UICorner",btn).CornerRadius = UDim.new(0,8)

    local close = Instance.new("TextButton")
    close.Size = UDim2.new(0,26,0,26)
    close.Position = UDim2.new(1,-16,0,-10)
    close.BackgroundColor3 = Color3.fromRGB(190,30,30)
    close.Text = "X"
    close.TextColor3 = Color3.new(1,1,1)
    close.TextScaled = true
    close.Font = Enum.Font.GothamBold
    close.Parent = frame
    Instance.new("UICorner",close).CornerRadius = UDim.new(0,8)

    local running = false
    local conn = nil
    local speed = 28.5

    local function startBoost()
        if running then return end
        running = true
        btn.Text = "Nyoa.Ss Boost: ON"
        btn.BackgroundColor3 = Color3.fromRGB(0,170,255)

        conn = RunService.Heartbeat:Connect(function()
            local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
            if not hrp or not running then return end
            local direction = Workspace.CurrentCamera.CFrame.LookVector * Vector3.new(1,0,1)
            if direction.Magnitude > 0 then
                direction = direction.Unit
                hrp.Velocity = Vector3.new(direction.X * speed, hrp.Velocity.Y, direction.Z * speed)
            end
        end)
    end

    local function stopBoost()
        running = false
        btn.Text = "Nyoa.Ss Boost: OFF"
        btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
        if conn then conn:Disconnect() end
        local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then hrp.Velocity = Vector3.new(0, hrp.Velocity.Y, 0) end
    end

    btn.MouseButton1Click:Connect(function()
        if running then stopBoost() else startBoost() end
    end)

    close.MouseButton1Click:Connect(function()
        stopBoost()
        gui:Destroy()
        NyoaBoost_Enabled = false
    end)

    Player.CharacterAdded:Connect(function()
        task.wait(0.3)
        if running then stopBoost() task.wait(0.1) startBoost() end
    end)

    Player.CharacterRemoving:Connect(stopBoost)
end

-- ========================================
--          Nyoa Fly Grapple
-- ========================================

local NyoaFlyGrapple_Enabled = false

local function OpenNyoaFlyGrapple()
    if NyoaFlyGrapple_Enabled then return end
    NyoaFlyGrapple_Enabled = true

    local gui = Instance.new("ScreenGui")
    gui.Name = "NyoaSsGrappleFly"
    gui.ResetOnSpawn = false
    gui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0,140,0,44)
    frame.Position = UDim2.new(0.02,0,0.33,0)
    frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
    frame.Active = true
    frame.Draggable = true
    frame.Parent = gui
    Instance.new("UICorner",frame).CornerRadius = UDim.new(0,10)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,-12,1,-12)
    btn.Position = UDim2.new(0,6,0,6)
    btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
    btn.Text = "NyoaSsGrapple Fly: OFF"
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = frame
    Instance.new("UICorner",btn).CornerRadius = UDim.new(0,8)

    local close = Instance.new("TextButton")
    close.Size = UDim2.new(0,26,0,26)
    close.Position = UDim2.new(1,-16,0,-10)
    close.BackgroundColor3 = Color3.fromRGB(190,30,30)
    close.Text = "X"
    close.TextColor3 = Color3.new(1,1,1)
    close.TextScaled = true
    close.Font = Enum.Font.GothamBold
    close.Parent = frame
    Instance.new("UICorner",close).CornerRadius = UDim.new(0,8)

    local enabled = false
    local conn = nil
    local flySpeed = 130
    local item = "Grapple Hook"
    local useRE = ReplicatedStorage:WaitForChild("Packages",10):WaitForChild("Net",10):WaitForChild("RE/UseItem",10)
    local args = {0.10267777442932129}

    local function buy() pcall(function() ReplicatedStorage.Packages.Net["RF/CoinsShopService/RequestBuy"]:InvokeServer(item) end) end
    local function equip() if Player.Character then local t = Player.Character:FindFirstChild(item) or Player.Backpack:FindFirstChild(item) if t then t.Parent = Player.Character end end end
    local function fake() if Player.Character and Player.Character:FindFirstChild(item) then pcall(function() useRE:FireServer(unpack(args)) end) end end

    local function startGrappleFly()
        if enabled then return end
        enabled = true
        btn.Text = "NyoaSsGrapple Fly: ON"
        btn.BackgroundColor3 = Color3.fromRGB(0,170,255)

        buy()
        task.wait(0.5)
        equip()

        conn = RunService.Heartbeat:Connect(function()
            local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
            if hrp and enabled then
                fake()
                hrp.Velocity = Workspace.CurrentCamera.CFrame.LookVector * flySpeed
            end
        end)
    end

    local function stopGrappleFly()
        enabled = false
        btn.Text = "NyoaSsGrapple Fly: OFF"
        btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
        if conn then conn:Disconnect() conn = nil end
        local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then hrp.Velocity = Vector3.zero end
    end

    btn.MouseButton1Click:Connect(function()
        if enabled then stopGrappleFly() else startGrappleFly() end
    end)

    close.MouseButton1Click:Connect(function()
        stopGrappleFly()
        gui:Destroy()
        NyoaFlyGrapple_Enabled = false
    end)

    Player.CharacterAdded:Connect(function()
        task.wait(1)
        if enabled then stopGrappleFly() task.wait(0.1) startGrappleFly() end
    end)

    Player.CharacterRemoving:Connect(stopGrappleFly)
end

-- ========================================
--          Invisible
-- ========================================

local Invisible_Enabled = false

local function OpenInvisible()
    if Invisible_Enabled then return end
    Invisible_Enabled = true

    local gui = Instance.new("ScreenGui")
    gui.Name = "InvisibleGUI"
    gui.ResetOnSpawn = false
    gui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0,140,0,44)
    frame.Position = UDim2.new(0.02,0,0.33,0)
    frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
    frame.Active = true
    frame.Draggable = true
    frame.Parent = gui
    Instance.new("UICorner",frame).CornerRadius = UDim.new(0,10)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,-12,1,-12)
    btn.Position = UDim2.new(0,6,0,6)
    btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
    btn.Text = "Invisible: OFF"
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = frame
    Instance.new("UICorner",btn).CornerRadius = UDim.new(0,8)

    local close = Instance.new("TextButton")
    close.Size = UDim2.new(0,26,0,26)
    close.Position = UDim2.new(1,-16,0,-10)
    close.BackgroundColor3 = Color3.fromRGB(190,30,30)
    close.Text = "X"
    close.TextColor3 = Color3.new(1,1,1)
    close.TextScaled = true
    close.Font = Enum.Font.GothamBold
    close.Parent = frame
    Instance.new("UICorner",close).CornerRadius = UDim.new(0,8)

    local enabled = false

    local function toggleInvisible(state)
        local char = Player.Character or Player.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not humanoid or not hrp then return end

        if state then
            local camCFrame = Workspace.CurrentCamera.CFrame
            Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
            Workspace.CurrentCamera.CFrame = camCFrame
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
            char:PivotTo(hrp.CFrame - Vector3.new(0,70,0))
            task.wait(0.1)
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.Anchored = true end
            end
            humanoid.PlatformStand = true
            task.wait(1.5)
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.Anchored = false end
            end
            humanoid.PlatformStand = false
            char:PivotTo(hrp.CFrame - Vector3.new(0,70,0))
            task.wait(0.1)
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.Anchored = true end
            end
            humanoid.PlatformStand = true
            Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
        else
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.Anchored = false part.CanCollide = true end
            end
            humanoid.PlatformStand = false
            Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
        end
    end

    local function startInvisible()
        if enabled then return end
        enabled = true
        btn.Text = "Invisible: ON"
        btn.BackgroundColor3 = Color3.fromRGB(0,130,200)
        toggleInvisible(true)
    end

    local function stopInvisible()
        enabled = false
        btn.Text = "Invisible: OFF"
        btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
        toggleInvisible(false)
    end

    btn.MouseButton1Click:Connect(function()
        if enabled then stopInvisible() else startInvisible() end
    end)

    close.MouseButton1Click:Connect(function()
        stopInvisible()
        gui:Destroy()
        Invisible_Enabled = false
    end)

    Player.CharacterAdded:Connect(function()
        task.wait(1)
        if enabled then stopInvisible() task.wait(0.1) startInvisible() end
    end)
end

-- ========================================
--          Friends GUI
-- ========================================

local FriendsGUI_Enabled = false

local function OpenFriendsGUI()
    if FriendsGUI_Enabled then return end
    FriendsGUI_Enabled = true

    local gui = Instance.new("ScreenGui")
    gui.Name = "NyoaSsFriendsToggle"
    gui.ResetOnSpawn = false
    gui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0,140,0,44)
    frame.Position = UDim2.new(0.02,0,0.33,0)
    frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
    frame.Active = true
    frame.Draggable = true
    frame.Parent = gui
    Instance.new("UICorner",frame).CornerRadius = UDim.new(0,10)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,-12,1,-12)
    btn.Position = UDim2.new(0,6,0,6)
    btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
    btn.Text = "Allow Friends"
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = frame
    Instance.new("UICorner",btn).CornerRadius = UDim.new(0,8)

    local close = Instance.new("TextButton")
    close.Size = UDim2.new(0,26,0,26)
    close.Position = UDim2.new(1,-16,0,-10)
    close.BackgroundColor3 = Color3.fromRGB(190,30,30)
    close.Text = "X"
    close.TextColor3 = Color3.new(1,1,1)
    close.TextScaled = true
    close.Font = Enum.Font.GothamBold
    close.Parent = frame
    Instance.new("UICorner",close).CornerRadius = UDim.new(0,8)

    local remote = ReplicatedStorage.Packages.Net["RE/PlotService/ToggleFriends"]

    btn.MouseButton1Click:Connect(function()
        remote:FireServer()
    end)

    close.MouseButton1Click:Connect(function()
        gui:Destroy()
        FriendsGUI_Enabled = false
    end)
end

-- ========================================
--          Ragdoll Desync
-- ========================================

local RagdollDesync_Enabled = false
local RagdollConnections = {}

local function EnableRagdollDesync()
    if RagdollDesync_Enabled then return end
    RagdollDesync_Enabled = true

    local char = Player.Character or Player.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid")
    local root = char:WaitForChild("HumanoidRootPart")

    for _, mod in ipairs(getloadedmodules()) do
        if mod.Name:lower():find("ragdoll") then
            local success, controller = pcall(require, mod)
            if success and type(controller) == "table" then
                if isreadonly(controller) then setreadonly(controller, false) end
                controller.Start = function() end
                controller.IsInRagdoll = function() return false end
                controller.ToggleControls = function() end
                setreadonly(controller, true)
            end
        end
    end

    local pkg = ReplicatedStorage:FindFirstChild("Packages")
    if pkg then
        local rag = pkg:FindFirstChild("Ragdoll")
        if rag then
            local remote = rag:FindFirstChild("Ragdoll")
            if remote then
                RagdollConnections.remote = remote.OnClientEvent:Connect(function() end)
            end
        end
    end

    RagdollConnections.heartbeat = RunService.Heartbeat:Connect(function()
        pcall(function()
            if hum:GetState() == Enum.HumanoidStateType.Physics then
                hum:ChangeState(Enum.HumanoidStateType.GettingUp)
            end
            Workspace.CurrentCamera.CameraSubject = hum
            root.CanCollide = true
        end)
    end)

    RagdollConnections.descendant = char.DescendantAdded:Connect(function(obj)
        if obj:IsA("BallSocketConstraint") or obj:IsA("HingeConstraint") or obj:IsA("NoCollisionConstraint") then
            obj:Destroy()
        end
    end)

    RagdollConnections.charAdded = Player.CharacterAdded:Connect(function(newChar)
        char = newChar
        hum = newChar:WaitForChild("Humanoid")
        root = newChar:WaitForChild("HumanoidRootPart")
    end)
end

local function DisableRagdollDesync()
    if not RagdollDesync_Enabled then return end
    RagdollDesync_Enabled = false
    for _, conn in pairs(RagdollConnections) do
        if typeof(conn) == "RBXScriptConnection" then
            conn:Disconnect()
        end
    end
    RagdollConnections = {}
end

-- ========================================
--          Anti Hit
-- ========================================

local AntiHit_Enabled = false
local AntiHit_Connections = {}

local function EnableAntiHit()
    if AntiHit_Enabled then return end
    AntiHit_Enabled = true

    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")

    Humanoid.BreakJointsOnDeath = false

    for _, Part in pairs(Character:GetDescendants()) do
        if Part:IsA("BasePart") then
            Part.CanCollide = false
            Part.Massless = false
            Part.Touched:Connect(function() end)
        end
    end

    AntiHit_Connections.Knockback = RunService.Stepped:Connect(function()
        if not AntiHit_Enabled then return end
        local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        if not root then return end

        for _, Obj in pairs(root:GetChildren()) do
            if Obj:IsA("BodyVelocity") or Obj:IsA("BodyMover") or Obj:IsA("VectorForce") then
                Obj:Destroy()
            end
        end

        local Vel = root.Velocity
        local Move = Humanoid.MoveDirection * Humanoid.WalkSpeed
        root.Velocity = Vector3.new(Move.X, Vel.Y, Move.Z)
    end)

    AntiHit_Connections.Respawn = Player.CharacterAdded:Connect(function(Ch)
        task.wait()
        for _, Part in pairs(Ch:GetDescendants()) do
            if Part:IsA("BasePart") then
                Part.CanCollide = false
                Part.Massless = false
            end
        end
    end)
end

local function DisableAntiHit()
    AntiHit_Enabled = false

    for _, Conn in pairs(AntiHit_Connections) do
        if Conn.Connected then
            Conn:Disconnect()
        end
    end
    AntiHit_Connections = {}

    local Char = Player.Character
    if Char then
        for _, Part in pairs(Char:GetDescendants()) do
            if Part:IsA("BasePart") then
                Part.CanCollide = true
            end
        end
    end
end

-- ========================================
--          Anti Effects (Direct Toggle)
-- ========================================

local enabledAntiEffects = false
local antiEffectsLoop
local fovConn

local function cleanEffects()
    if Workspace.CurrentCamera.FieldOfView ~= 70 then
        Workspace.CurrentCamera.FieldOfView = 70
    end

    for _, effect in ipairs(game.Lighting:GetChildren()) do
        if effect:IsA("BlurEffect") or effect:IsA("PostEffect") or effect.Name:lower():find("bee") or effect.Name:lower():find("colorcorrection") then
            pcall(function() effect:Destroy() end)
        end
    end
end

local function toggleAntiEffects(state)
    enabledAntiEffects = state
    if state then
        cleanEffects()
        Workspace.CurrentCamera.FieldOfView = 70

        antiEffectsLoop = task.spawn(function()
            while enabledAntiEffects do
                task.wait(0.5)
                cleanEffects()
            end
        end)

        fovConn = Workspace.CurrentCamera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
            if enabledAntiEffects then
                Workspace.CurrentCamera.FieldOfView = 70
            end
        end)
    else
        if antiEffectsLoop then task.cancel(antiEffectsLoop) end
        if fovConn then fovConn:Disconnect() end
    end
end

-- ========================================
--          Auto Steal
-- ========================================

_G.AutoStealAllEnabled = false

local function autoStealCreate()
    if playerGui:FindFirstChild("NearestAutoStealGUI") then return end

    local gui = Instance.new("ScreenGui")
    gui.Name = "NearestAutoStealGUI"
    gui.ResetOnSpawn = false
    gui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 160, 0, 44)
    frame.Position = UDim2.new(0.02, 0, 0.33, 0)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.Active = true
    frame.Draggable = true
    frame.Parent = gui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -12, 1, -12)
    btn.Position = UDim2.new(0, 6, 0, 6)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.Text = "Nearest Auto Steal: OFF"
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = frame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    local closebtn = Instance.new("TextButton")
    closebtn.Size = UDim2.new(0, 26, 0, 26)
    closebtn.Position = UDim2.new(1, -16, 0, -10)
    closebtn.BackgroundColor3 = Color3.fromRGB(190, 30, 30)
    closebtn.Text = "X"
    closebtn.TextColor3 = Color3.new(1, 1, 1)
    closebtn.TextScaled = true
    closebtn.Font = Enum.Font.GothamBold
    closebtn.Parent = frame
    Instance.new("UICorner", closebtn).CornerRadius = UDim.new(0, 8)

    local function stealAll()
        local character = Player.Character or Player.CharacterAdded:Wait()
        if not character or not character:FindFirstChild("HumanoidRootPart") then return end
        local myPos = character.HumanoidRootPart.Position

        local closestPrompt = nil
        local closestDist = math.huge

        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("ProximityPrompt") and obj.ActionText == "Steal" and obj.ObjectText ~= nil then
                local attachment = obj.Parent
                if attachment and attachment:IsA("Attachment") then
                    local dist = (myPos - attachment.WorldPosition).Magnitude
                    if dist <= 20 and dist < closestDist then
                        closestDist = dist
                        closestPrompt = obj
                    end
                end
            end
        end

        if closestPrompt then
            closestPrompt:InputHoldBegin()
        end
    end

    local function startAutoSteal()
        if _G.AutoStealAllEnabled then return end
        _G.AutoStealAllEnabled = true

        task.spawn(function()
            while _G.AutoStealAllEnabled do
                pcall(stealAll)
                task.wait(0.2)
            end
        end)
    end

    local function stopAutoSteal()
        _G.AutoStealAllEnabled = false
    end

    btn.MouseButton1Click:Connect(function()
        if _G.AutoStealAllEnabled then
            stopAutoSteal()
            btn.Text = "Nearest Auto Steal: OFF"
            btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        else
            startAutoSteal()
            btn.Text = "Nearest Auto Steal: ON"
            btn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        end
    end)

    closebtn.MouseButton1Click:Connect(function()
        stopAutoSteal()
        gui:Destroy()
    end)
end

-- ========================================
--          Infinite Jump
-- ========================================

local infiniteJumpEnabled = false

local function infiniteJumpCreate()
    if playerGui:FindFirstChild("InfiniteJumpGUI") then return end

    local gui = Instance.new("ScreenGui")
    gui.Name = "InfiniteJumpGUI"
    gui.ResetOnSpawn = false
    gui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 160, 0, 44)
    frame.Position = UDim2.new(0.02, 0, 0.33, 0)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.Active = true
    frame.Draggable = true
    frame.Parent = gui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -12, 1, -12)
    btn.Position = UDim2.new(0, 6, 0, 6)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.Text = "Infinite Jump: OFF"
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = frame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    local closebtn = Instance.new("TextButton")
    closebtn.Size = UDim2.new(0, 26, 0, 26)
    closebtn.Position = UDim2.new(1, -16, 0, -10)
    closebtn.BackgroundColor3 = Color3.fromRGB(190, 30, 30)
    closebtn.Text = "X"
    closebtn.TextColor3 = Color3.new(1, 1, 1)
    closebtn.TextScaled = true
    closebtn.Font = Enum.Font.GothamBold
    closebtn.Parent = frame
    Instance.new("UICorner", closebtn).CornerRadius = UDim.new(0, 8)

    local jumpConnection = nil
    local lastJumpTime = 0
    local jumpCooldown = 0.1

    local function startInfiniteJump()
        if infiniteJumpEnabled then return end
        infiniteJumpEnabled = true

        jumpConnection = UserInputService.JumpRequest:Connect(function()
            local hum = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
            local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
            if not hum or not root then return end

            if tick() - lastJumpTime < jumpCooldown then return end

            local state = hum:GetState()
            if state == Enum.HumanoidStateType.Freefall or state == Enum.HumanoidStateType.Running or state == Enum.HumanoidStateType.Jumping then
                local force = math.random(50, 55)
                root.Velocity = Vector3.new(root.Velocity.X, force, root.Velocity.Z)
                lastJumpTime = tick()
            end
        end)
    end

    local function stopInfiniteJump()
        infiniteJumpEnabled = false
        if jumpConnection then jumpConnection:Disconnect() end
    end

    btn.MouseButton1Click:Connect(function()
        if infiniteJumpEnabled then
            stopInfiniteJump()
            btn.Text = "Infinite Jump: OFF"
            btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        else
            startInfiniteJump()
            btn.Text = "Infinite Jump: ON"
            btn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        end
    end)

    closebtn.MouseButton1Click:Connect(function()
        stopInfiniteJump()
        gui:Destroy()
    end)
end

-- ========================================
--          Semi Invisible GUI
-- ========================================

local function semiInvisibleCreate()
    if playerGui:FindFirstChild("SemiInvisibleGUI") then return end

    local gui = Instance.new("ScreenGui")
    gui.Name = "SemiInvisibleGUI"
    gui.ResetOnSpawn = false
    gui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0,140,0,44)
    frame.Position = UDim2.new(0.02,0,0.33,0)
    frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
    frame.Active = true
    frame.Draggable = true
    frame.Parent = gui
    Instance.new("UICorner",frame).CornerRadius = UDim.new(0,10)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,-12,1,-12)
    btn.Position = UDim2.new(0,6,0,6)
    btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
    btn.Text = "Semi Invisible: OFF"
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = frame
    Instance.new("UICorner",btn).CornerRadius = UDim.new(0,8)

    local closebtn = Instance.new("TextButton")
    closebtn.Size = UDim2.new(0,26,0,26)
    closebtn.Position = UDim2.new(1,-16,0,-10)
    closebtn.BackgroundColor3 = Color3.fromRGB(190,30,30)
    closebtn.Text = "X"
    closebtn.TextColor3 = Color3.new(1,1,1)
    closebtn.TextScaled = true
    closebtn.Font = Enum.Font.GothamBold
    closebtn.Parent = frame
    Instance.new("UICorner",closebtn).CornerRadius = UDim.new(0,8)

    btn.MouseButton1Click:Connect(function()
        toggleSemiInvisible(not isSemiInvisible)
        btn.Text = isSemiInvisible and "Semi Invisible: ON" or "Semi Invisible: OFF"
        btn.BackgroundColor3 = isSemiInvisible and Color3.fromRGB(0,170,255) or Color3.fromRGB(35,35,35)
    end)

    closebtn.MouseButton1Click:Connect(function()
        if isSemiInvisible then toggleSemiInvisible(false) end
        gui:Destroy()
    end)

    Player.CharacterAdded:Connect(function()
        task.wait(1)
        if isSemiInvisible then
            toggleSemiInvisible(false)
            task.wait(0.1)
            toggleSemiInvisible(true)
        end
    end)
end

-- ========================================
--          Kick After Steal
-- ========================================

local KickAfterSteal = false
local oldFire

local targetRemote = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Net"):WaitForChild("RE/5c8f0dd0-0f9e-44ba-8f9b-197958b661ab")

local function enableKickAfterSteal()
    if KickAfterSteal then return end
    KickAfterSteal = true

    oldFire = hookfunction(targetRemote.FireServer, function(self, ...)
        local args = {...}
        if args[1] == "7799aa8a-03f9-4df1-ab0f-b6df84f6b36c" then
            task.spawn(function()
                task.wait(1)
                Player:Kick("You stole a brainrot")
            end)
        end
        return oldFire(self, ...)
    end)
end

local function disableKickAfterSteal()
    if not KickAfterSteal then return end
    KickAfterSteal = false
    if oldFire then
        hookfunction(targetRemote.FireServer, oldFire)
    end
end

-- ========================================
--          Config System
-- ========================================

local configFolder = "NyoaSs_configs"
if not isfolder(configFolder) then makefolder(configFolder) end

_G.FeatureStates = {}
_G.FeatureCallbacks = {}
_G.ToggleSets = {}

local lastConfigFile = configFolder .. "/last.txt"
local lastConfig = isfile(lastConfigFile) and readfile(lastConfigFile) or nil

local function loadLastConfig()
    if not lastConfig then return end
    local autoLoadFile = configFolder .. "/" .. lastConfig .. ".json"
    if isfile(autoLoadFile) then
        local data = readfile(autoLoadFile)
        local success, loadedStates = pcall(HttpService.JSONDecode, HttpService, data)
        if success then
            for feature, state in pairs(loadedStates) do
                if _G.ToggleSets[feature] then
                    _G.ToggleSets[feature](state)
                end
            end
            createNotify("Auto-loaded last config '" .. lastConfig .. "'")
        end
    end
end

local function resetConfigs()
    for feature in pairs(_G.ToggleSets) do
        _G.ToggleSets[feature](false)
    end
    for i = #configDropdown:GetChildren(), 1, -1 do
        local child = configDropdown:GetChildren()[i]
        if child:IsA("TextButton") then child:Destroy() end
    end
    local configs = listfiles(configFolder)
    for _, file in ipairs(configs) do
        if file:match("%.json$") then
            delfile(file)
        end
    end
    if isfile(lastConfigFile) then delfile(lastConfigFile) end
    createNotify("Configs reset!")
end

-- ========================================
--          Floating Button
-- ========================================

local floatingButtonEnabled = true
local floatingButton

local function createFloatingButton()
    if playerGui:FindFirstChild("NyoaFloatingButton") then return end

    local gui = Instance.new("ScreenGui")
    gui.Name = "NyoaFloatingButton"
    gui.ResetOnSpawn = false
    gui.Parent = playerGui

    floatingButton = Instance.new("TextButton")
    floatingButton.Size = UDim2.new(0, 60, 0, 60)
    floatingButton.Position = UDim2.new(0.02, 0, 0.02, 0)
    floatingButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    floatingButton.Text = "NY"
    floatingButton.TextColor3 = Color3.new(1,1,1)
    floatingButton.Font = Enum.Font.GothamBold
    floatingButton.TextSize = 20
    floatingButton.Parent = gui
    Instance.new("UICorner", floatingButton).CornerRadius = UDim.new(1, 0)

    local stroke = Instance.new("UIStroke", floatingButton)
    stroke.Thickness = 2
    stroke.Color = Color3.new(1,1,1)
    stroke.Transparency = 0.8

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 255))
    }
    gradient.Parent = stroke

    Drag(floatingButton, floatingButton)

    floatingButton.MouseButton1Down:Connect(function()
        TweenService:Create(floatingButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 55, 0, 55)}):Play()
    end)

    floatingButton.MouseButton1Up:Connect(function()
        TweenService:Create(floatingButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 60, 0, 60)}):Play()
    end)

    floatingButton.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible
    end)
end

local function toggleFloatingButton(state)
    floatingButtonEnabled = state
    if state then
        createFloatingButton()
    else
        if playerGui:FindFirstChild("NyoaFloatingButton") then
            playerGui.NyoaFloatingButton:Destroy()
        end
    end
end

-- Initial create if enabled
if floatingButtonEnabled then
    createFloatingButton()
end

-- ========================================
--          Main GUI
-- ========================================

local mainGui = Instance.new("ScreenGui")
mainGui.Name = "NyoaSs"
mainGui.ResetOnSpawn = false
mainGui.IgnoreGuiInset = true
mainGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 420, 0, 300)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
mainFrame.ClipsDescendants = true
mainFrame.Parent = mainGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)
local mstroke = Instance.new("UIStroke", mainFrame)
mstroke.Color = Color3.new(1,1,1)
mstroke.Transparency = 0.85
mstroke.Thickness = 2

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 255))
}
gradient.Parent = mstroke

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1,0,0,44)
titleBar.BackgroundColor3 = Color3.fromRGB(22,22,26)
titleBar.Parent = mainFrame
Instance.new("UICorner",titleBar).CornerRadius = UDim.new(0,10)

Drag(mainFrame, titleBar)

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0,300,1,0)
titleLabel.Position = UDim2.new(0,16,0,0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "NyoaSs | discord.gg/WBYkWfPQC2"
titleLabel.TextColor3 = Color3.fromRGB(240,240,245)
titleLabel.Font = Enum.Font.GothamMedium
titleLabel.TextSize = 15
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0,40,0,40)
closeBtn.Position = UDim2.new(1,-44,0,2)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "x"
closeBtn.TextColor3 = Color3.fromRGB(255,100,100)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 26
closeBtn.Parent = titleBar

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0,40,0,40)
minimizeBtn.Position = UDim2.new(1,-84,0,2)
minimizeBtn.BackgroundTransparency = 1
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.fromRGB(200,200,200)
minimizeBtn.Font = Enum.Font.Gotham
minimizeBtn.TextSize = 30
minimizeBtn.Parent = titleBar

local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1,0,1,-44)
contentContainer.Position = UDim2.new(0,0,0,44)
contentContainer.BackgroundTransparency = 1
contentContainer.ClipsDescendants = true
contentContainer.Parent = mainFrame

local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1,-20,0,46)
tabContainer.Position = UDim2.new(0,10,0,2)
tabContainer.BackgroundTransparency = 1
tabContainer.Parent = contentContainer

local contentArea = Instance.new("ScrollingFrame")
contentArea.Size = UDim2.new(1, -20, 1, -56)
contentArea.Position = UDim2.new(0, 10, 0, 50)
contentArea.BackgroundTransparency = 1
contentArea.ScrollBarThickness = 6
contentArea.ScrollBarImageColor3 = Color3.fromRGB(100, 180, 255)
contentArea.ScrollingDirection = Enum.ScrollingDirection.Y
contentArea.Parent = contentContainer

contentArea.AutomaticCanvasSize = Enum.AutomaticSize.Y
contentArea.CanvasSize = UDim2.new(0, 0, 0, 0)

local pages = {
    Combat = Instance.new("Frame"),
    Visual = Instance.new("Frame"),
    Perform = Instance.new("Frame"),
    Tuff = Instance.new("Frame"),
    Movement = Instance.new("Frame"),
    Setting = Instance.new("Frame")
}

for _, page in pairs(pages) do
    page.Size = UDim2.new(1,0,0,0)
    page.BackgroundTransparency = 1
    page.AutomaticSize = Enum.AutomaticSize.Y
    page.Visible = false
    page.Parent = contentArea

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0,8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = page
end

pages.Combat.Visible = true

local tabOrder = {"Combat", "Visual", "Perform", "Tuff", "Movement", "Setting"}
local tabButtons = {}

for i, name in ipairs(tabOrder) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0,70,1,0)
    btn.Position = UDim2.new(0,(i-1)*70,0,0)
    btn.BackgroundTransparency = 1
    btn.Text = name
    btn.TextColor3 = i==1 and Color3.new(1,1,1) or Color3.fromRGB(140,140,150)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 14
    btn.Parent = tabContainer

    local ind = Instance.new("Frame")
    ind.Size = UDim2.new(0,54,0,2)
    ind.Position = UDim2.new(0.5,-27,1,-2)
    ind.BackgroundColor3 = Color3.new(1,1,1)
    ind.Visible = i==1
    ind.Parent = btn

    tabButtons[name] = {Button = btn, Indicator = ind}

    btn.MouseButton1Click:Connect(function()
        for _, tab in pairs(tabButtons) do
            tab.Button.TextColor3 = Color3.fromRGB(140,140,150)
            tab.Indicator.Visible = false
        end

        btn.TextColor3 = Color3.new(1,1,1)
        ind.Visible = true

        for _, page in pairs(pages) do
            page.Visible = false
        end
        pages[name].Visible = true
    end)
end

local function createToggle(parent, text, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, 40)
    frame.BackgroundTransparency = 1
    frame.Parent = parent

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1,-70,1,0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(200,200,200)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0,52,0,26)
    btn.Position = UDim2.new(1,-62,0.5,-13)
    btn.BackgroundColor3 = Color3.fromRGB(60,60,65)
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.Parent = frame
    Instance.new("UICorner",btn).CornerRadius = UDim.new(0,13)

    local circle = Instance.new("Frame")
    circle.Size = UDim2.new(0,20,0,20)
    circle.Position = UDim2.new(0,4,0.5,-10)
    circle.BackgroundColor3 = Color3.fromRGB(180,180,180)
    circle.Parent = btn
    Instance.new("UICorner",circle).CornerRadius = UDim.new(1,0)

    local state = false
    _G.FeatureStates[text] = state
    _G.FeatureCallbacks[text] = callback

    local function set(s)
        state = s
        _G.FeatureStates[text] = s
        btn.BackgroundColor3 = s and Color3.fromRGB(100,180,255) or Color3.fromRGB(60,60,65)
        TweenService:Create(circle,TweenInfo.new(0.2),{Position = s and UDim2.new(0,28,0.5,-10) or UDim2.new(0,4,0.5,-10)}):Play()
        callback(s)
    end
    _G.ToggleSets[text] = set

    btn.MouseButton1Click:Connect(function()
        set(not state)
    end)

    return set
end

local function createButton(parent, text, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, 40)
    frame.BackgroundTransparency = 1
    frame.Parent = parent

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,0,1,0)
    btn.BackgroundColor3 = Color3.fromRGB(70,130,180)
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 15
    btn.Parent = frame
    Instance.new("UICorner",btn).CornerRadius = UDim.new(0,8)
    btn.MouseButton1Click:Connect(callback)
end

createToggle(pages.Visual, "Xray", function(state)
    xrayEnabled = state
    if state then
        EnableXray()
    else
        DisableXray()
    end
end)

createToggle(pages.Visual, "Base ESP", function(state)
    if state then
        for _,p in obj:GetChildren() do if p:IsA("Model") then CreatePlotESP(p) end end
        obj.ChildAdded:Connect(function(p) task.wait(0.5) if p:IsA("Model") then CreatePlotESP(p) end end)
        obj.ChildRemoved:Connect(RemovePlotESP)
    else
        for p,_ in PlotESP_Data do RemovePlotESP(p) end
    end
end)

createToggle(pages.Visual, "Plot Timer", function(state)
    if state then
        for _,p in obj:GetChildren() do if p:IsA("Model") then CreateTimeESP(p) end end
        obj.ChildAdded:Connect(function(p) task.wait(0.5) if p:IsA("Model") then CreateTimeESP(p) end end)
        obj.ChildRemoved:Connect(RemoveTimeESP)
    else
        for p,_ in PlotTimeESP_Data do RemoveTimeESP(p) end
    end
end)

createToggle(pages.Visual, "Best Value ESP", function(state)
    if state then startBrainrotEsp() else stopBrainrotEsp() end
end)

createToggle(pages.Visual, "Best Price ESP", function(state)
    if state then
        StartBestPriceESP()
    else
        StopBestPriceESP()
    end
end)

createToggle(pages.Visual, "Player ESP", function(state)
    if state then enableEsp() else disableEsp() end
end)

createButton(pages.Combat, "Melee Aura [GUI]", function()
    if getgenv().MeleeAuraLoaded then createNotify("Melee Aura already loaded!") return end
    getgenv().MeleeAuraLoaded = true
    loadstring(game:HttpGet("https://pastefy.app/QGZ2PBmO/raw"))()
end)

createToggle(pages.Combat, "Web & Laser Aimbot", function(state)
    if state then
        loadstring(game:HttpGet("https://pastefy.app/bZnijZHh/raw"))()
        createNotify("Web & Laser Aimbot enabled!")
    end
end)

createToggle(pages.Combat, "Anti Ragdoll", function(state)
    if state then EnableRagdollDesync() else DisableRagdollDesync() end
end)

createToggle(pages.Combat, "Anti Knockback", function(state)
    if state then EnableAntiHit() else DisableAntiHit() end
end)

createToggle(pages.Movement, "NyoaSs Fly", function(state)
    if state then OpenNyoaFly() else
        for _, scr in playerGui:GetChildren() do
            if scr:IsA("ScreenGui") and scr.Name == "NyoaSsFly" then scr:Destroy() end
        end
        NyoaFly_Enabled = false
    end
end)

createToggle(pages.Movement, "Nyoa.Ss Boost", function(state)
    if state then OpenNyoaBoost() else
        for _, scr in playerGui:GetChildren() do
            if scr:IsA("ScreenGui") and scr.Name == "NyoaSsBoost" then scr:Destroy() end
        end
        NyoaBoost_Enabled = false
    end
end)

createToggle(pages.Movement, "Float", function(state)
    if state then OpenFloatGui() else
        for _, scr in playerGui:GetChildren() do
            if scr:IsA("ScreenGui") and scr.Name == "NyoaSs_FloatGui" then scr:Destroy() end
        end
        FloatGui_Enabled = false
    end
end)

createToggle(pages.Movement, "NyoaSS Infinite Jump", function(state)
    if state then infiniteJumpCreate() else
        for _, scr in playerGui:GetChildren() do
            if scr:IsA("ScreenGui") and scr.Name == "InfiniteJumpGUI" then scr:Destroy() end
        end
    end
end)

createToggle(pages.Movement, "NyoaSS Grapple Fly", function(state)
    if state then OpenNyoaFlyGrapple() else
        for _, scr in playerGui:GetChildren() do
            if scr:IsA("ScreenGui") and scr.Name == "NyoaSsGrappleFly" then scr:Destroy() end
        end
        NyoaFlyGrapple_Enabled = false
    end
end)

createToggle(pages.Tuff, "Invisible", function(state)
    if state then OpenInvisible() else
        for _, scr in playerGui:GetChildren() do
            if scr:IsA("ScreenGui") and scr.Name == "InvisibleGUI" then scr:Destroy() end
        end
        Invisible_Enabled = false
    end
end)

createToggle(pages.Tuff, "Semi Invisible", function(state)
    if state then semiInvisibleCreate() else
        for _, scr in playerGui:GetChildren() do
            if scr:IsA("ScreenGui") and scr.Name == "SemiInvisibleGUI" then scr:Destroy() end
        end
        if isSemiInvisible then toggleSemiInvisible(false) end
    end
end)

createToggle(pages.Tuff, "Desync Combined", function(state)
    if state then
        loadstring(game:HttpGet("https://pastefy.app/D1xVVUU6/raw"))()
        createNotify("Desync enabled!")
    end
end)

createToggle(pages.Tuff, "Bypass Desync", function(state)
    if state then
        loadstring(game:HttpGet("https://pastefy.app/uM8hMvu8/raw"))()
        createNotify("Bypass enabled!")
    end
end)

createToggle(pages.Tuff, "Unwalk [No Walk Anim]", function(state)
    local anim = Player.Character and Player.Character:FindFirstChild("Animate")
    if anim then anim.Disabled = state end
end)

createToggle(pages.Tuff, "Friends Allowed", function(state)
    if state then OpenFriendsGUI() else
        for _, scr in playerGui:GetChildren() do
            if scr:IsA("ScreenGui") and scr.Name == "NyoaSsFriendsToggle" then scr:Destroy() end
        end
        FriendsGUI_Enabled = false
    end
end)

createToggle(pages.Tuff, "Auto Steal", function(state)
    if state then autoStealCreate() else
        _G.AutoStealAllEnabled = false
        for _, scr in playerGui:GetChildren() do
            if scr:IsA("ScreenGui") and scr.Name == "NearestAutoStealGUI" then scr:Destroy() end
        end
    end
end)

createToggle(pages.Tuff, "Kick After Steal", function(state)
    if state then enableKickAfterSteal() else disableKickAfterSteal() end
end)

local optimizationEnabled = false

createToggle(pages.Perform, "Delete Parts", function(state)
    if state then
        optimizationEnabled = true
        task.spawn(function()
            while optimizationEnabled do
                for _,v in Workspace:GetDescendants() do
                    if v:IsA("BasePart") and not v.Anchored and v.Parent ~= Player.Character and not v.Parent:FindFirstChild("Humanoid") then
                        v:Destroy()
                    end
                end
                task.wait(2)
            end
        end)
    else
        optimizationEnabled = false
    end
end)

createToggle(pages.Perform, "Anti Effects", function(state)
    toggleAntiEffects(state)
end)

-- Settings Tab with Config System
local configList = Instance.new("Frame")
configList.Size = UDim2.new(1, -20, 0, 150)  -- Smaller height
configList.Position = UDim2.new(0, 0, 0, 70)  -- Adjusted for new toggles
configList.BackgroundTransparency = 1
configList.Parent = pages.Setting

local configDropdown = Instance.new("ScrollingFrame")
configDropdown.Size = UDim2.new(1, 0, 1, 0)
configDropdown.BackgroundTransparency = 1
configDropdown.ScrollBarThickness = 4
configDropdown.Parent = configList
configDropdown.AutomaticCanvasSize = Enum.AutomaticSize.Y

local dropdownStroke = Instance.new("UIStroke", configDropdown)
dropdownStroke.Color = Color3.new(1,1,1)
dropdownStroke.Transparency = 0.8
dropdownStroke.Thickness = 2

local configLayout = Instance.new("UIListLayout")
configLayout.SortOrder = Enum.SortOrder.LayoutOrder
configLayout.Padding = UDim.new(0, 5)
configLayout.Parent = configDropdown

local function loadConfigs()
    local configs = listfiles(configFolder)
    for i = #configDropdown:GetChildren(), 1, -1 do
        local child = configDropdown:GetChildren()[i]
        if child:IsA("TextButton") then child:Destroy() end
    end
    for _, file in ipairs(configs) do
        local configName = file:match("([^/\\]+)%.json$")
        if configName then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 30)
            btn.BackgroundColor3 = Color3.fromRGB(45,45,50)
            btn.Text = configName
            btn.TextColor3 = Color3.new(1,1,1)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 14
            btn.Parent = configDropdown
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)

            btn.MouseButton1Click:Connect(function()
                local data = readfile(file)
                local success, loadedStates = pcall(HttpService.JSONDecode, HttpService, data)
                if success then
                    for feature, s in pairs(loadedStates) do
                        if _G.ToggleSets[feature] then
                            _G.ToggleSets[feature](s)
                        end
                    end
                    createNotify("Config '" .. configName .. "' loaded!")
                end
            end)
        end
    end
end

local loadBtn = createButton(pages.Setting, "Load Configs", loadConfigs)

createToggle(pages.Setting, "Floating Button [drag]", function(state)
    toggleFloatingButton(state)
end)(true)

local saveInput = Instance.new("TextBox")
saveInput.Size = UDim2.new(1, -20, 0, 30)
saveInput.Position = UDim2.new(0, 0, 0, 250)  -- Adjusted position
saveInput.BackgroundColor3 = Color3.fromRGB(35,35,35)
saveInput.PlaceholderText = "Enter config name"
saveInput.Text = ""
saveInput.TextColor3 = Color3.new(1,1,1)
saveInput.Font = Enum.Font.Gotham
saveInput.TextSize = 14
saveInput.Parent = pages.Setting
Instance.new("UICorner", saveInput).CornerRadius = UDim.new(0,6)

local saveBtn = createButton(pages.Setting, "Save Config", function()
    local configName = saveInput.Text
    if configName ~= "" then
        local json = HttpService:JSONEncode(_G.FeatureStates)
        writefile(configFolder .. "/" .. configName .. ".json", json)
        writefile(lastConfigFile, configName)
        createNotify("Config '" .. configName .. "' saved!")
        loadConfigs()
    end
end)

createButton(pages.Setting, "Reset Configs", resetConfigs)

createButton(pages.Setting, "Nyoa Helper", function()
    loadstring(game:HttpGet("https://pastefy.app/MItLJzDI/raw"))()
end)

createToggle(pages.Setting, "Anti Kick", function(state)
    if state then
        createNotify("Anti Kick enabled")
    else
        createNotify("Anti Kick disabled")
    end
end)(true)

task.spawn(function()
    local hk = false
    for _, v in pairs(getgc(true)) do
        if typeof(v) == "table" then
            local fn = rawget(v, "observeTag")
            if typeof(fn) == "function" and not hk then
                hk = true
                hookfunction(fn, newcclosure(function(_, _)
                    return {
                        Disconnect = function() end,
                        disconnect = function() end
                    }
                end))
            end
        end
    end
end)

local minimized = false

closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    createNotify("NyoaSs Unloading, Please wait :/")
    task.wait(6.3)
    mainGui:Destroy()
end)

minimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(0,420,0,44)}):Play()
        minimizeBtn.Text = "+"
    else
        TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(0,420,0,300)}):Play()
        minimizeBtn.Text = "-"
    end
end)

-- Initial auto load
loadLastConfig()
