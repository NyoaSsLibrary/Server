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
local Lighting = game:GetService("Lighting")

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
--          Xray Base (Invisible Base Walls)
-- ========================================

local invisibleWallsLoaded = false
local originalTransparency = {}

local function isBaseWall(obj)
    if not obj:IsA("BasePart") then return false end
    local n = obj.Name:lower()
    local parent = obj.Parent and obj.Parent.Name:lower() or ""
    return n:find("base") or parent:find("base")
end

local function enableInvisibleBaseWalls()
    if invisibleWallsLoaded then return end
    invisibleWallsLoaded = true
    
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Anchored and obj.CanCollide and isBaseWall(obj) then
            originalTransparency[obj] = obj.LocalTransparencyModifier
            obj.LocalTransparencyModifier = 0.85
        end
    end
    
    Workspace.DescendantAdded:Connect(function(obj)
        if invisibleWallsLoaded and isBaseWall(obj) then
            originalTransparency[obj] = obj.LocalTransparencyModifier
            obj.LocalTransparencyModifier = 0.85
        end
    end)
end

local function disableInvisibleBaseWalls()
    invisibleWallsLoaded = false
    for part, value in pairs(originalTransparency) do
        if part then
            part.LocalTransparencyModifier = value
        end
    end
    originalTransparency = {}
end

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
--          Desync System
-- ========================================

local DESYNC_FLAGS = {
    LargeReplicatorEnabled9 = true,
    GameNetDontSendRedundantNumTimes = 1,
    MaxTimestepMultiplierAcceleration = 2147483647,
    InterpolationFrameVelocityThresholdMillionth = 5,
    CheckPVDifferencesForInterpolationMinRotVelThresholdRadsPerSecHundredth = 1,
    TimestepArbiterVelocityCriteriaThresholdTwoDt = 2147483646,
    GameNetPVHeaderLinearVelocityZeroCutoffExponent = -5000,
    TimestepArbiterHumanoidTurningVelThreshold = 1,
    LargeReplicatorSerializeWrite4 = true,
    SimExplicitlyCappedTimestepMultiplier = 2147483646,
    InterpolationFrameRotVelocityThresholdMillionth = 5,
    ServerMaxBandwith = 52,
    LargeReplicatorSerializeRead3 = true,
    GameNetDontSendRedundantDeltaPositionMillionth = 1,
    PhysicsSenderMaxBandwidthBps = 20000,
    CheckPVCachedVelThresholdPercent = 10,
    NextGenReplicatorEnabledWrite4 = true,
    LargeReplicatorWrite5 = true,
    MaxMissedWorldStepsRemembered = -2147483648,
    StreamJobNOUVolumeCap = 2147483647,
    CheckPVLinearVelocityIntegrateVsDeltaPositionThresholdPercent = 1,
    DisableDPIScale = true,
    WorldStepMax = 30,
    InterpolationFramePositionThresholdMillionth = 5,
    MaxAcceptableUpdateDelay = 1,
    TimestepArbiterOmegaThou = 1073741823,
    CheckPVCachedRotVelThresholdPercent = 10,
    StreamJobNOUVolumeLengthCap = 2147483647,
    S2PhysicsSenderRate = 15000,
    MaxTimestepMultiplierBuoyancy = 2147483647,
    SimOwnedNOUCountThresholdMillionth = 2147483647,
    ReplicationFocusNouExtentsSizeCutoffForPauseStuds = 2147483647,
    LargeReplicatorRead5 = true,
    CheckPVDifferencesForInterpolationMinVelThresholdStudsPerSecHundredth = 1,
    MaxDataPacketPerSend = 2147483647,
    MaxTimestepMultiplierContstraint = 2147483647,
    DebugSendDistInSteps = -2147483648,
    GameNetPVHeaderRotationalVelocityZeroCutoffExponent = -5000,
    AngularVelociryLimit = 360
}

local function runDesyncEngine()
    for key, value in pairs(DESYNC_FLAGS) do
        pcall(function()
            setfflag(tostring(key), tostring(value))
        end)
    end
end

local function enableDesync()
    task.spawn(runDesyncEngine)
    createNotify("Desync Enabled")
end

-- ========================================
--          Anti Ragdoll v2 (Moveable)
-- ========================================

local ANTI_RAGDOLL = {}

local antiRagdollMode = nil
local ragdollConnections = {}
local cachedCharData = {}

local function cacheCharacterData()
    local char = Player.Character
    if not char then return false end
    
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    
    if not hum or not root then return false end
    
    cachedCharData = {
        character = char,
        humanoid = hum,
        root = root,
        originalWalkSpeed = hum.WalkSpeed,
        originalJumpPower = hum.JumpPower,
        isFrozen = false
    }
    
    return true
end

local function disconnectAllRagdoll()
    for _, conn in ipairs(ragdollConnections) do
        if typeof(conn) == "RBXScriptConnection" then
            pcall(function() conn:Disconnect() end)
        end
    end
    ragdollConnections = {}
end

local function isRagdolled()
    if not cachedCharData.humanoid then return false end
    
    local hum = cachedCharData.humanoid
    local state = hum:GetState()
    
    local ragdollStates = {
        [Enum.HumanoidStateType.Physics] = true,
        [Enum.HumanoidStateType.Ragdoll] = true,
        [Enum.HumanoidStateType.FallingDown] = true
    }
    
    if ragdollStates[state] then
        return true
    end
    
    local endTime = Player:GetAttribute("RagdollEndTime")
    if endTime then
        local now = Workspace:GetServerTimeNow()
        if (endTime - now) > 0 then
            return true
        end
    end
    
    return false
end

local function removeRagdollConstraints()
    if not cachedCharData.character then return end
    
    local removed = false
    
    for _, descendant in ipairs(cachedCharData.character:GetDescendants()) do
        if descendant:IsA("BallSocketConstraint") or 
           (descendant:IsA("Attachment") and descendant.Name:find("RagdollAttachment")) then
            pcall(function()
                descendant:Destroy()
                removed = true
            end)
        end
    end
    
    return removed
end

local function forceExitRagdoll()
    if not cachedCharData.humanoid or not cachedCharData.root then return end
    
    local hum = cachedCharData.humanoid
    local root = cachedCharData.root
    
    pcall(function()
        local now = Workspace:GetServerTimeNow()
        Player:SetAttribute("RagdollEndTime", now)
    end)
    
    if hum.Health > 0 then
        hum:ChangeState(Enum.HumanoidStateType.Running)
    end
    
    root.Anchored = false
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero
end

local function v1HeartbeatLoop()
    while antiRagdollMode == "v2" and cachedCharData.humanoid do
        task.wait()
        
        if isRagdolled() then
            removeRagdollConstraints()
            forceExitRagdoll()
        end
    end
end

local function setupCameraBinding()
    if not cachedCharData.humanoid then return end
    
    local conn = RunService.RenderStepped:Connect(function()
        if antiRagdollMode ~= "v2" then return end
        
        local cam = Workspace.CurrentCamera
        if cam and cachedCharData.humanoid and cam.CameraSubject ~= cachedCharData.humanoid then
            cam.CameraSubject = cachedCharData.humanoid
        end
    end)
    
    table.insert(ragdollConnections, conn)
end

local function onCharacterAddedRagdoll(char)
    task.wait(0.5)
    
    if not antiRagdollMode then return end
    
    if cacheCharacterData() then
        if antiRagdollMode == "v2" then
            setupCameraBinding()
            task.spawn(v1HeartbeatLoop)
        end
    end
end

local function enableAntiRagdollV2()
    ANTI_RAGDOLL.Enable("v2")
end

local function disableAntiRagdoll()
    ANTI_RAGDOLL.Disable()
end

function ANTI_RAGDOLL.Enable(mode)
    if mode ~= "v2" then return end
    
    if antiRagdollMode == mode then return end
    
    ANTI_RAGDOLL.Disable()
    
    if not cacheCharacterData() then
        createNotify("Failed to cache character data")
        return
    end
    
    antiRagdollMode = mode
    
    local charConn = Player.CharacterAdded:Connect(onCharacterAddedRagdoll)
    table.insert(ragdollConnections, charConn)
    
    setupCameraBinding()
    task.spawn(v1HeartbeatLoop)
    createNotify("Anti-Ragdoll v2 (Moveable) Enabled")
end

function ANTI_RAGDOLL.Disable()
    if not antiRagdollMode then return end
    
    antiRagdollMode = nil
    
    disconnectAllRagdoll()
    
    cachedCharData = {}
    
    createNotify("Anti-Ragdoll Disabled")
end

-- ========================================
--          Anti Lag
-- ========================================

local ANTI_LAG = {}

local antiLagRunning = false
local antiLagConnections = {}
local cleanedCharacters = {}

local function destroyAllEquippableItems(character)
    if not character then return end
    if not antiLagRunning then return end
    
    pcall(function()
        for _, child in ipairs(character:GetChildren()) do
            if child:IsA("Accessory") or child:IsA("Hat") then
                child:Destroy()
            end
        end
        
        for _, child in ipairs(character:GetChildren()) do
            if child:IsA("Shirt") or child:IsA("Pants") or child:IsA("ShirtGraphic") then
                child:Destroy()
            end
        end
        
        local bodyColors = character:FindFirstChildOfClass("BodyColors")
        if bodyColors then
            bodyColors:Destroy()
        end
        
        for _, child in ipairs(character:GetChildren()) do
            if child:IsA("CharacterMesh") then
                child:Destroy()
            end
        end
        
        for _, child in ipairs(character:GetDescendants()) do
            if child.ClassName == "LayeredClothing" or child.ClassName == "WrapLayer" then
                child:Destroy()
            end
        end
        
        for _, child in ipairs(character:GetChildren()) do
            if child:IsA("BasePart") then
                local mesh = child:FindFirstChildOfClass("SpecialMesh")
                if mesh then
                    mesh:Destroy()
                end
            end
        end
        
        for _, child in ipairs(character:GetDescendants()) do
            if child:IsA("ParticleEmitter") or child:IsA("Trail") or child:IsA("Beam") then
                child:Destroy()
            end
        end
        
        for _, child in ipairs(character:GetDescendants()) do
            if child:IsA("PointLight") or child:IsA("SpotLight") or child:IsA("SurfaceLight") then
                child:Destroy()
            end
        end
        
        for _, child in ipairs(character:GetDescendants()) do
            if child:IsA("Fire") or child:IsA("Smoke") or child:IsA("Sparkles") then
                child:Destroy()
            end
        end
        
        for _, child in ipairs(character:GetDescendants()) do
            if child:IsA("Highlight") then
                child:Destroy()
            end
        end
        
        for _, child in ipairs(character:GetDescendants()) do
            if child:IsA("Decal") or child:IsA("Texture") then
                if not (child.Name == "face" and child.Parent and child.Parent.Name == "Head") then
                    child:Destroy()
                end
            end
        end
    end)
end

local function destroyBackpackTools(player)
    if not antiLagRunning then return end
    
    pcall(function()
        local backpack = player:FindFirstChild("Backpack")
        if backpack then
            for _, tool in ipairs(backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    for _, desc in ipairs(tool:GetDescendants()) do
                        if desc:IsA("ParticleEmitter") or desc:IsA("Trail") or desc:IsA("Beam") or
                           desc:IsA("SpecialMesh") or desc:IsA("PointLight") or desc:IsA("SpotLight") or
                           desc:IsA("Fire") or desc:IsA("Smoke") or desc:IsA("Sparkles") then
                            desc:Destroy()
                        end
                    end
                end
            end
        end
    end)
end

local function destroyEquippedTools(character)
    if not character then return end
    if not antiLagRunning then return end
    
    pcall(function()
        for _, tool in ipairs(character:GetChildren()) do
            if tool:IsA("Tool") then
                for _, desc in ipairs(tool:GetDescendants()) do
                    if desc:IsA("ParticleEmitter") or desc:IsA("Trail") or desc:IsA("Beam") or
                       desc:IsA("SpecialMesh") or desc:IsA("PointLight") or desc:IsA("SpotLight") or
                       desc:IsA("Fire") or desc:IsA("Smoke") or desc:IsA("Sparkles") then
                        desc:Destroy()
                    end
                end
            end
        end
    end)
end

local function antiLagCleanCharacter(char)
    if not char then return end
    
    destroyAllEquippableItems(char)
    destroyEquippedTools(char)
    cleanedCharacters[char] = true
end

local function antiLagDisconnectAll()
    for _, conn in ipairs(antiLagConnections) do
        if typeof(conn) == "RBXScriptConnection" then
            conn:Disconnect()
        end
    end
    antiLagConnections = {}
    cleanedCharacters = {}
end

local function enableAntiLag()
    ANTI_LAG.Enable()
end

local function disableAntiLag()
    ANTI_LAG.Disable()
end

function ANTI_LAG.Enable()
    if antiLagRunning then return end
    antiLagRunning = true
    
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Character then
            antiLagCleanCharacter(plr.Character)
            destroyBackpackTools(plr)
        end
        
        table.insert(antiLagConnections, plr.CharacterAdded:Connect(function(char)
            if not antiLagRunning then return end
            task.wait(0.5)
            antiLagCleanCharacter(char)
            destroyBackpackTools(plr)
            
            table.insert(antiLagConnections, char.ChildAdded:Connect(function(child)
                if not antiLagRunning then return end
                task.wait(0.1)
                
                if child:IsA("Accessory") or child:IsA("Hat") or child:IsA("Shirt") or 
                   child:IsA("Pants") or child:IsA("ShirtGraphic") then
                    child:Destroy()
                elseif child:IsA("Tool") then
                    destroyEquippedTools(char)
                end
            end))
        end))
        
        if plr.Backpack then
            table.insert(antiLagConnections, plr.Backpack.ChildAdded:Connect(function()
                if antiLagRunning then
                    task.wait(0.1)
                    destroyBackpackTools(plr)
                end
            end))
        end
    end
    
    table.insert(antiLagConnections, Players.PlayerAdded:Connect(function(plr)
        table.insert(antiLagConnections, plr.CharacterAdded:Connect(function(char)
            if not antiLagRunning then return end
            task.wait(0.5)
            antiLagCleanCharacter(char)
            destroyBackpackTools(plr)
            
            table.insert(antiLagConnections, char.ChildAdded:Connect(function(child)
                if not antiLagRunning then return end
                task.wait(0.1)
                
                if child:IsA("Accessory") or child:IsA("Hat") or child:IsA("Shirt") or 
                   child:IsA("Pants") or child:IsA("ShirtGraphic") then
                    child:Destroy()
                elseif child:IsA("Tool") then
                    destroyEquippedTools(char)
                end
            end))
        end))
        
        if plr.Character then
            antiLagCleanCharacter(plr.Character)
            destroyBackpackTools(plr)
        end
        
        if plr.Backpack then
            table.insert(antiLagConnections, plr.Backpack.ChildAdded:Connect(function()
                if antiLagRunning then
                    task.wait(0.1)
                    destroyBackpackTools(plr)
                end
            end))
        end
    end))
    
    table.insert(antiLagConnections, task.spawn(function()
        while antiLagRunning do
            task.wait(3)
            
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr.Character and not cleanedCharacters[plr.Character] then
                    antiLagCleanCharacter(plr.Character)
                    destroyBackpackTools(plr)
                end
            end
        end
    end))
    
    createNotify("Optimized Anti-Lag Enabled")
end

function ANTI_LAG.Disable()
    if not antiLagRunning then return end
    antiLagRunning = false
    
    antiLagDisconnectAll()
    
    createNotify("Anti-Lag Disabled")
end

-- ========================================
--          Anti Bee & Disco
-- ========================================

local FOV_MANAGER = {
    activeCount = 0,
    conn = nil,
    forcedFOV = 70,
}

function FOV_MANAGER:Start()
    if self.conn then return end
    
    self.conn = RunService.RenderStepped:Connect(function()
        local cam = Workspace.CurrentCamera
        if cam and cam.FieldOfView ~= self.forcedFOV then
            cam.FieldOfView = self.forcedFOV
        end
    end)
end

function FOV_MANAGER:Stop()
    if self.conn then
        self.conn:Disconnect()
        self.conn = nil
    end
end

function FOV_MANAGER:Push()
    self.activeCount += 1
    self:Start()
end

function FOV_MANAGER:Pop()
    if self.activeCount > 0 then
        self.activeCount -= 1
    end
    if self.activeCount == 0 then
        self:Stop()
    end
end

local ANTI_BEE_DISCO = {}

local antiBeeDiscoRunning = false
local antiBeeDiscoConnections = {}
local originalMoveFunction = nil
local controlsProtected = false

local BAD_LIGHTING_NAMES = {
    Blue = true,
    DiscoEffect = true,
    BeeBlur = true,
    ColorCorrection = true,
}

local function antiBeeDiscoNuke(obj)
    if not obj or not obj.Parent then return end
    if BAD_LIGHTING_NAMES[obj.Name] then
        pcall(function()
            obj:Destroy()
        end)
    end
end

local function antiBeeDiscoDisconnectAll()
    for _, conn in ipairs(antiBeeDiscoConnections) do
        if typeof(conn) == "RBXScriptConnection" then
            conn:Disconnect()
        end
    end
    antiBeeDiscoConnections = {}
end

local function protectControls()
    if controlsProtected then return end
    
    pcall(function()
        local PlayerScripts = Player.PlayerScripts
        local PlayerModule = PlayerScripts:FindFirstChild("PlayerModule")
        if not PlayerModule then return end
        
        local Controls = require(PlayerModule):GetControls()
        if not Controls then return end
        
        if not originalMoveFunction then
            originalMoveFunction = Controls.moveFunction
        end
        
        local function protectedMoveFunction(self, moveVector, relativeToCamera)
            if originalMoveFunction then
                originalMoveFunction(self, moveVector, relativeToCamera)
            end
        end
        
        local controlCheckConn = RunService.Heartbeat:Connect(function()
            if not antiBeeDiscoRunning then return end
            
            if Controls.moveFunction ~= protectedMoveFunction then
                Controls.moveFunction = protectedMoveFunction
            end
        end)
        
        table.insert(antiBeeDiscoConnections, controlCheckConn)
        
        Controls.moveFunction = protectedMoveFunction
        controlsProtected = true
    end)
end

local function restoreControls()
    if not controlsProtected then return end
    
    pcall(function()
        local PlayerScripts = Player.PlayerScripts
        local PlayerModule = PlayerScripts:FindFirstChild("PlayerModule")
        if not PlayerModule then return end
        
        local Controls = require(PlayerModule):GetControls()
        if not Controls or not originalMoveFunction then return end
        
        Controls.moveFunction = originalMoveFunction
        controlsProtected = false
    end)
end

local function blockBuzzingSound()
    pcall(function()
        local PlayerScripts = Player.PlayerScripts
        local beeScript = PlayerScripts:FindFirstChild("Bee", true)
        if beeScript then
            local buzzing = beeScript:FindFirstChild("Buzzing")
            if buzzing and buzzing:IsA("Sound") then
                buzzing:Stop()
                buzzing.Volume = 0
            end
        end
    end)
end

local function enableAntiBeeDisco()
    ANTI_BEE_DISCO.Enable()
end

local function disableAntiBeeDisco()
    ANTI_BEE_DISCO.Disable()
end

function ANTI_BEE_DISCO.Enable()
    if antiBeeDiscoRunning then return end
    antiBeeDiscoRunning = true
    
    for _, inst in ipairs(Lighting:GetDescendants()) do
        antiBeeDiscoNuke(inst)
    end
    
    table.insert(antiBeeDiscoConnections, Lighting.DescendantAdded:Connect(function(obj)
        if not antiBeeDiscoRunning then return end
        antiBeeDiscoNuke(obj)
    end))
    
    protectControls()
    
    table.insert(antiBeeDiscoConnections, RunService.Heartbeat:Connect(function()
        if not antiBeeDiscoRunning then return end
        blockBuzzingSound()
    end))
    
    createNotify("Anti-Bee & Anti-Disco Enabled")
    FOV_MANAGER:Push()
end

function ANTI_BEE_DISCO.Disable()
    if not antiBeeDiscoRunning then return end
    antiBeeDiscoRunning = false
    
    restoreControls()
    
    antiBeeDiscoDisconnectAll()
    
    createNotify("Anti-Bee & Anti-Disco Disabled")
    FOV_MANAGER:Pop()
end

-- ========================================
--          Floor Steal
-- ========================================

local floatPlatform = nil

local function startFloorSteal()
    if floatPlatform then floatPlatform:Destroy() end
    
    floatPlatform = Instance.new("Part")
    floatPlatform.Size = Vector3.new(6, 1, 6)
    floatPlatform.Anchored = true
    floatPlatform.CanCollide = true
    floatPlatform.Transparency = 1
    floatPlatform.Parent = Workspace
    
    task.spawn(function()
        while floatPlatform do
            local hrp = Player.Character and (Player.Character:FindFirstChild("HumanoidRootPart") or Player.Character:FindFirstChild("UpperTorso"))
            if hrp then
                floatPlatform.Position = hrp.Position - Vector3.new(0, 3, 0)
            end
            task.wait(0.05)
        end
    end)
end

local function stopFloorSteal()
    if floatPlatform then
        floatPlatform:Destroy()
        floatPlatform = nil
    end
end

-- ========================================
--          Disable Animation During Steal
-- ========================================

local animDisableConn = nil
local originalAnimIds = {}
local animateScript = nil

local ANIM_TYPES = {
    "walk", "run", "jump", "fall"
}

local function cacheOriginalAnimations()
    local char = Player.Character
    if not char then return false end
    
    animateScript = char:FindFirstChild("Animate")
    if not animateScript then return false end
    
    originalAnimIds = {}
    
    for _, animType in ipairs(ANIM_TYPES) do
        local animFolder = animateScript:FindFirstChild(animType)
        if animFolder then
            originalAnimIds[animType] = {}
            for _, anim in ipairs(animFolder:GetChildren()) do
                if anim:IsA("Animation") then
                    originalAnimIds[animType][anim.Name] = anim.AnimationId
                end
            end
        end
    end
    
    return true
end

local function disableAnimations()
    if not animateScript then return end
    
    for _, animType in ipairs(ANIM_TYPES) do
        local animFolder = animateScript:FindFirstChild(animType)
        if animFolder then
            for _, anim in ipairs(animFolder:GetChildren()) do
                if anim:IsA("Animation") then
                    anim.AnimationId = ""
                end
            end
        end
    end
    
    local char = Player.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
                track:Stop(0)
            end
        end
    end
end

local function restoreAnimations()
    if not animateScript or not originalAnimIds then return end
    
    for animType, anims in pairs(originalAnimIds) do
        local animFolder = animateScript:FindFirstChild(animType)
        if animFolder then
            for animName, animId in pairs(anims) do
                local anim = animFolder:FindFirstChild(animName)
                if anim and anim:IsA("Animation") then
                    anim.AnimationId = animId
                end
            end
        end
    end
end

local function startAnimDisable()
    if animDisableConn then return end
    
    if not next(originalAnimIds) then
        if not cacheOriginalAnimations() then
            createNotify("Failed to cache animations")
            return
        end
    end

    animDisableConn = RunService.Heartbeat:Connect(function()
        if not Player:GetAttribute("Stealing") then return end

        disableAnimations()
    end)
end

local function stopAnimDisable()
    if animDisableConn then
        animDisableConn:Disconnect()
        animDisableConn = nil
    end
    restoreAnimations()
end

Player:GetAttributeChangedSignal("Stealing"):Connect(function()
    if Player:GetAttribute("Stealing") then
        startAnimDisable()
    else
        stopAnimDisable()
    end
end)

Player.CharacterAdded:Connect(function()
    task.wait(1)
    originalAnimIds = {}
    animateScript = nil
    cacheOriginalAnimations()
end)

-- ========================================
--          Speed Boost During Steal
-- ========================================

local STEAL_SPEED = 25.5
local stealSpeedConn = nil

local function startStealSpeed()
    if stealSpeedConn then return end

    stealSpeedConn = RunService.Heartbeat:Connect(function()
        if not Player:GetAttribute("Stealing") then return end

        local char = Player.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hum or not hrp then return end

        local move = hum.MoveDirection
        if move.Magnitude > 0 then
            hrp.AssemblyLinearVelocity = Vector3.new(
                move.X * STEAL_SPEED,
                hrp.AssemblyLinearVelocity.Y,
                move.Z * STEAL_SPEED
            )
        end
    end)
end

local function stopStealSpeed()
    if stealSpeedConn then
        stealSpeedConn:Disconnect()
        stealSpeedConn = nil
    end
end

Player:GetAttributeChangedSignal("Stealing"):Connect(function()
    if Player:GetAttribute("Stealing") then
        startStealSpeed()
    else
        stopStealSpeed()
    end
end)

-- ========================================
--          Auto Steal Nearest
-- ========================================

local _G.AutoStealAllEnabled = false
local InternalStealCache = {}
local AUTO_STEAL_PROX_RADIUS = 20
local PromptMemoryCache = {}
local LastTargetUID = nil
local LastPlayerPosition = nil
local PlayerVelocity = Vector3.zero
local PREDICTION_LOOKAHEAD = 1.25

local function isMyBaseAnimal(animalData)
    if not animalData or not animalData.plot then
        return false
    end
    
    local plots = Workspace:FindFirstChild("Plots")
    if not plots then
        return false
    end
    
    local plot = plots:FindFirstChild(animalData.plot)
    if not plot then
        return false
    end
    
    local channel = ReplicatedStorage.Packages.Synchronizer:Get(plot.Name)
    if channel then
        local owner = channel:Get("Owner")
        if owner then
            if typeof(owner) == "Instance" and owner:IsA("Player") then
                return owner.UserId == Player.UserId
            elseif typeof(owner) == "table" and owner.UserId then
                return owner.UserId == Player.UserId
            elseif typeof(owner) == "Instance" then
                return owner == Player
            end
        end
    end
    
    local sign = plot:FindFirstChild("PlotSign")
    if sign then
        local yourBase = sign:FindFirstChild("YourBase")
        if yourBase and yourBase:IsA("BillboardGui") then
            return yourBase.Enabled == true
        end
    end
    
    return false
end

local function findProximityPromptForAnimal(animalData)
    if not animalData then return nil end
    
    local cachedPrompt = PromptMemoryCache[animalData.uid]
    if cachedPrompt and cachedPrompt.Parent then
        return cachedPrompt
    end
    
    local plot = Workspace.Plots:FindFirstChild(animalData.plot)
    if not plot then return nil end
    
    local podiums = plot:FindFirstChild("AnimalPodiums")
    if not podiums then return nil end
    
    local podium = podiums:FindFirstChild(animalData.slot)
    if not podium then return nil end
    
    local base = podium:FindFirstChild("Base")
    if not base then return nil end
    
    local spawn = base:FindFirstChild("Spawn")
    if not spawn then return nil end
    
    local attach = spawn:FindFirstChild("PromptAttachment")
    if not attach then return nil end
    
    for _, p in ipairs(attach:GetChildren()) do
        if p:IsA("ProximityPrompt") then
            PromptMemoryCache[animalData.uid] = p
            return p
        end
    end
    
    return nil
end

local function getAnimalPosition(animalData)
    local plot = Workspace.Plots:FindFirstChild(animalData.plot)
    if not plot then return nil end
    
    local podiums = plot:FindFirstChild("AnimalPodiums")
    if not podiums then return nil end
    
    local podium = podiums:FindFirstChild(animalData.slot)
    if not podium then return nil end
    
    return podium:GetPivot().Position
end

local function getNearestAnimal()
    local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    
    local nearest = nil
    local minDist = math.huge
    
    for _, animalData in ipairs(allAnimalsCache) do
        if isMyBaseAnimal(animalData) then
            continue
        end
        
        local pos = getAnimalPosition(animalData)
        if pos then
            local dist = (hrp.Position - pos).Magnitude
            
            if dist < minDist then
                minDist = dist
                nearest = animalData
            end
        end
    end
    
    return nearest
end

local function updatePlayerVelocity()
    local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local currentPos = hrp.Position
    
    if LastPlayerPosition then
        PlayerVelocity = (currentPos - LastPlayerPosition) / task.wait()
    end
    
    LastPlayerPosition = currentPos
end

local function getTimeToReach(targetPos)
    local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return math.huge end
    
    local currentPos = hrp.Position
    local distance = (targetPos - currentPos).Magnitude
    
    if PlayerVelocity.Magnitude < 0.1 then
        return math.huge
    end
    
    local directionToTarget = (targetPos - currentPos).Unit
    
    local velocityTowardTarget = PlayerVelocity:Dot(directionToTarget)
    
    if velocityTowardTarget <= 0 then
        return math.huge
    end
    
    return distance / velocityTowardTarget
end

local function shouldPreFire(animalData)
    local animalPos = getAnimalPosition(animalData)
    if not animalPos then return false end
    
    local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    
    local currentDistance = (hrp.Position - animalPos).Magnitude
    
    if currentDistance <= AUTO_STEAL_PROX_RADIUS then
        return true
    end
    
    local timeToReach = getTimeToReach(animalPos)
    
    if timeToReach <= PREDICTION_LOOKAHEAD and timeToReach > 0 then
        return true
    end
    
    return false
end

local function buildStealCallbacks(prompt)
    if InternalStealCache[prompt] then return end
    
    local data = {
        holdCallbacks = {},
        triggerCallbacks = {},
        ready = true,
    }
    
    local ok1, conns1 = pcall(getconnections, prompt.PromptButtonHoldBegan)
    if ok1 and type(conns1) == "table" then
        for _, conn in ipairs(conns1) do
            if type(conn.Function) == "function" then
                table.insert(data.holdCallbacks, conn.Function)
            end
        end
    end
    
    local ok2, conns2 = pcall(getconnections, prompt.Triggered)
    if ok2 and type(conns2) == "table" then
        for _, conn in ipairs(conns2) do
            if type(conn.Function) == "function" then
                table.insert(data.triggerCallbacks, conn.Function)
            end
        end
    end
    
    if (#data.holdCallbacks > 0) or (#data.triggerCallbacks > 0) then
        InternalStealCache[prompt] = data
    end
end

local function runCallbackList(list)
    for _, fn in ipairs(list) do
        task.spawn(fn)
    end
end

local function executeInternalStealAsync(prompt)
    local data = InternalStealCache[prompt]
    if not data or not data.ready then return false end
    
    data.ready = false
    
    task.spawn(function()
        if #data.holdCallbacks > 0 then
            runCallbackList(data.holdCallbacks)
        end
        
        task.wait(1.3)
        
        if #data.triggerCallbacks > 0 then
            runCallbackList(data.triggerCallbacks)
        end
        
        task.wait()
        data.ready = true
    end)
    
    return true
end

local function attemptSteal(prompt)
    if not prompt or not prompt.Parent then
        return false
    end
    
    buildStealCallbacks(prompt)
    if not InternalStealCache[prompt] then
        return false
    end
    
    return executeInternalStealAsync(prompt)
end

local function prebuildStealCallbacks()
    for uid, prompt in pairs(PromptMemoryCache) do
        if prompt and prompt.Parent then
            buildStealCallbacks(prompt)
        end
    end
end

task.spawn(function()
    while task.wait() do
        prebuildStealCallbacks()
    end
end)

local stealConnection = nil
local velocityConnection = nil

local function autoStealLoop()
    if stealConnection then
        stealConnection:Disconnect()
    end
    if velocityConnection then
        velocityConnection:Disconnect()
    end
    
    velocityConnection = RunService.Heartbeat:Connect(function()
        updatePlayerVelocity()
    end)
    
    stealConnection = RunService.Heartbeat:Connect(function()
        local targetAnimal = getNearestAnimal()
        
        if not targetAnimal or isMyBaseAnimal(targetAnimal) then
            return
        end
        
        if not shouldPreFire(targetAnimal) then
            return
        end
        
        if LastTargetUID ~= targetAnimal.uid then
            LastTargetUID = targetAnimal.uid
        end
        
        local prompt = PromptMemoryCache[targetAnimal.uid]
        if not prompt or not prompt.Parent then
            prompt = findProximityPromptForAnimal(targetAnimal)
        end
        
        if prompt then
            attemptSteal(prompt)
        end
    end)
end

local function enableAutoStealNearest()
    autoStealLoop()
end

local function disableAutoStealNearest()
    if stealConnection then
        stealConnection:Disconnect()
        stealConnection = nil
    end
    if velocityConnection then
        velocityConnection:Disconnect()
        velocityConnection = nil
    end
end

local function setupPromptCacheCleanup()
    local plots = Workspace:WaitForChild("Plots", 8)
    if not plots then return end
    
    plots.ChildRemoved:Connect(function(plot)
        for uid, prompt in pairs(PromptMemoryCache) do
            if uid:find(plot.Name) then
                PromptMemoryCache[uid] = nil
            end
        end
    end)
end

-- ========================================
--          Tuff Optimizer
-- ========================================

local OPTIMIZER = {}
local optimizerThreads = {}
local optimizerConnections = {}
local originalSettings = {}

local function storeOriginalSettings()
    pcall(function()
        originalSettings = {
            streamingEnabled = Workspace.StreamingEnabled,
            streamingMinRadius = Workspace.StreamingMinRadius,
            streamingTargetRadius = Workspace.StreamingTargetRadius,
            
            qualityLevel = settings().Rendering.QualityLevel,
            meshPartDetailLevel = settings().Rendering.MeshPartDetailLevel,
            
            globalShadows = Lighting.GlobalShadows,
            brightness = Lighting.Brightness,
            fogEnd = Lighting.FogEnd,
            technology = Lighting.Technology,
            environmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
            environmentSpecularScale = Lighting.EnvironmentSpecularScale,
            
            decoration = Workspace.Terrain.Decoration,
            waterWaveSize = Workspace.Terrain.WaterWaveSize,
            waterWaveSpeed = Workspace.Terrain.WaterWaveSpeed,
            waterReflectance = Workspace.Terrain.WaterReflectance,
            waterTransparency = Workspace.Terrain.WaterTransparency,
        }
    end)
end

local PERFORMANCE_FFLAGS = {
    ["DFIntTaskSchedulerTargetFps"] = 999,
    ["FFlagDebugGraphicsPreferVulkan"] = true,
    ["FFlagDebugGraphicsDisableDirect3D11"] = true,
    ["FFlagDebugGraphicsPreferD3D11FL10"] = false,
    ["DFFlagDebugRenderForceTechnologyVoxel"] = true,
    ["FFlagDisablePostFx"] = true,
    ["FIntRenderShadowIntensity"] = 0,
    ["FIntRenderLocalLightUpdatesMax"] = 0,
    ["FIntRenderLocalLightUpdatesMin"] = 0,
    ["DFIntTextureCompositorActiveJobs"] = 1,
    ["DFIntDebugFRMQualityLevelOverride"] = 1,
    
    ["FFlagFixPlayerCollisionWhenSwimming"] = false,
    ["DFIntMaxInterpolationSubsteps"] = 0,
    ["DFIntS2PhysicsSenderRate"] = 15,
    
    ["DFIntConnectionMTUSize"] = 1492,
    ["DFIntHttpCurlConnectionCacheSize"] = 134217728,
    
    ["DFIntCSGLevelOfDetailSwitchingDistance"] = 0,
    ["DFIntCSGLevelOfDetailSwitchingDistanceL12"] = 0,
    ["DFIntCSGLevelOfDetailSwitchingDistanceL23"] = 0,
    ["DFIntCSGLevelOfDetailSwitchingDistanceL34"] = 0,
    
    ["FFlagEnableInGameMenuChromeABTest3"] = false,
    ["FFlagEnableInGameMenuModernization"] = false,
    ["FFlagEnableReportAbuseMenuRoactABTest2"] = false,
    ["FFlagDisableNewIGMinDUA"] = true,
    ["FFlagEnableAccessoryValidation"] = false,
    ["FFlagEnableV3MenuABTest3"] = false,
    
    ["FIntRobloxGuiBlurIntensity"] = 0,
    ["DFIntTimestepArbiterThresholdCFLThou"] = 10,
    
    ["DFIntTextureQualityOverride"] = 1,
    ["DFIntPerformanceControlTextureQualityBestUtility"] = 1,
    ["DFIntTexturePoolSizeMB"] = 64,
    
    ["DFIntMaxFrameBufferSize"] = 1,
    
    ["FFlagDebugDisableParticleRendering"] = false,
    ["DFIntParticleMaxCount"] = 100,
    
    ["FFlagEnableWaterReflections"] = false,
    ["DFIntWaterReflectionQuality"] = 0,
}

local function applyFFlags()
    local success = 0
    local failed = 0
    
    for flag, value in pairs(PERFORMANCE_FFLAGS) do
        local ok = pcall(function()
            setfflag(flag, tostring(value))
        end)
        
        if ok then
            success = success + 1
        else
            failed = failed + 1
        end
    end
    
    createNotify(string.format("Applied %d/%d FFlags", success, success + failed))
end

local function nukeVisualEffects()
    pcall(function()
        for _, obj in ipairs(Workspace:GetDescendants()) do
            pcall(function()
                if obj:IsA("ParticleEmitter") then
                    obj.Enabled = false
                    obj.Rate = 0
                    obj:Destroy()
                    
                elseif obj:IsA("Trail") then
                    obj.Enabled = false
                    obj:Destroy()
                    
                elseif obj:IsA("Beam") then
                    obj.Enabled = false
                    obj:Destroy()
                    
                elseif obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
                    obj.Enabled = false
                    obj.Brightness = 0
                    obj:Destroy()
                    
                elseif obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
                    obj.Enabled = false
                    obj:Destroy()
                    
                elseif obj:IsA("Explosion") then
                    obj:Destroy()
                    
                elseif obj:IsA("SpecialMesh") then
                    obj.TextureId = ""
                    
                elseif obj:IsA("Decal") or obj:IsA("Texture") then
                    if not (obj.Name == "face" and obj.Parent and obj.Parent.Name == "Head") then
                        obj.Transparency = 1
                    end
                    
                elseif obj:IsA("BasePart") then
                    obj.CastShadow = false
                    obj.Material = Enum.Material.Plastic
                    
                    if obj.Material == Enum.Material.Glass then
                        obj.Reflectance = 0
                    end
                end
            end)
        end
    end)
end

local function optimizeCharacter(char)
    if not char then return end
    
    task.spawn(function()
        task.wait(0.5)
        
        pcall(function()
            for _, part in ipairs(char:GetDescendants()) do
                pcall(function()
                    if part:IsA("BasePart") then
                        part.CastShadow = false
                        part.Material = Enum.Material.Plastic
                        part.Reflectance = 0
                        
                    elseif part:IsA("ParticleEmitter") or part:IsA("Trail") or part:IsA("Beam") then
                        part:Destroy()
                        
                    elseif part:IsA("PointLight") or part:IsA("SpotLight") or part:IsA("SurfaceLight") then
                        part:Destroy()
                        
                    elseif part:IsA("Fire") or part:IsA("Smoke") or part:IsA("Sparkles") then
                        part:Destroy()
                    end
                end)
            end
        end)
    end)
end

local function enableOptimizer()
    OPTIMIZER.Enable()
end

local function disableOptimizer()
    OPTIMIZER.Disable()
end

function OPTIMIZER.Enable()
    if getgenv().OPTIMIZER_ACTIVE then 
        createNotify("Already running!")
        return 
    end
    
    getgenv().OPTIMIZER_ACTIVE = true
    storeOriginalSettings()
    
    pcall(applyFFlags)
    
    pcall(function()
        Workspace.StreamingEnabled = true
        Workspace.StreamingMinRadius = 64
        Workspace.StreamingTargetRadius = 256
        Workspace.StreamingIntegrityMode = Enum.StreamingIntegrityMode.MinimumRadiusPause
    end)
    
    pcall(function()
        local renderSettings = settings().Rendering
        renderSettings.QualityLevel = Enum.QualityLevel.Level01
        renderSettings.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level01
        renderSettings.EditQualityLevel = Enum.QualityLevel.Level01
        
        Lighting.GlobalShadows = false
        Lighting.Brightness = 3
        Lighting.FogEnd = 9e9
        Lighting.Technology = Enum.Technology.Legacy
        Lighting.EnvironmentDiffuseScale = 0
        Lighting.EnvironmentSpecularScale = 0
        
        for _, effect in ipairs(Lighting:GetChildren()) do
            if effect:IsA("PostEffect") then
                pcall(function() 
                    effect.Enabled = false 
                    effect:Destroy()
                end)
            end
        end
        
        local atmo = Lighting:FindFirstChildOfClass("Atmosphere")
        if atmo then atmo:Destroy() end
        
        local bloom = Lighting:FindFirstChildOfClass("BloomEffect")
        if bloom then bloom:Destroy() end
        
        local blur = Lighting:FindFirstChildOfClass("BlurEffect")
        if blur then blur:Destroy() end
        
        local cc = Lighting:FindFirstChildOfClass("ColorCorrectionEffect")
        if cc then cc:Destroy() end
        
        local sunrays = Lighting:FindFirstChildOfClass("SunRaysEffect")
        if sunrays then sunrays:Destroy() end
        
        local dof = Lighting:FindFirstChildOfClass("DepthOfFieldEffect")
        if dof then dof:Destroy() end
    end)
    
    pcall(function()
        local physics = settings().Physics
        physics.AllowSleep = true
        physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Skip
        physics.ThrottleAdjustTime = 0
    end)
    
    pcall(function()
        Workspace.Terrain.WaterWaveSize = 0
        Workspace.Terrain.WaterWaveSpeed = 0
        Workspace.Terrain.WaterReflectance = 0
        Workspace.Terrain.WaterTransparency = 1
        Workspace.Terrain.Decoration = false
    end)
    
    task.spawn(function()
        task.wait(1)
        nukeVisualEffects()
    end)
    
    table.insert(optimizerConnections, Workspace.DescendantAdded:Connect(function(obj)
        if not getgenv().OPTIMIZER_ACTIVE then return end
        
        pcall(function()
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or
               obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") or
               obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") or obj:IsA("Explosion") then
                obj:Destroy()
            elseif obj:IsA("BasePart") then
                obj.CastShadow = false
                obj.Material = Enum.Material.Plastic
            end
        end)
    end))
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            optimizeCharacter(player.Character)
        end
        
        table.insert(optimizerConnections, player.CharacterAdded:Connect(function(char)
            if getgenv().OPTIMIZER_ACTIVE then
                optimizeCharacter(char)
            end
        end))
    end
    
    table.insert(optimizerConnections, Players.PlayerAdded:Connect(function(player)
        table.insert(optimizerConnections, player.CharacterAdded:Connect(function(char)
            if getgenv().OPTIMIZER_ACTIVE then
                optimizeCharacter(char)
            end
        end))
    end))
    
    table.insert(optimizerThreads, task.spawn(function()
        while getgenv().OPTIMIZER_ACTIVE do
            task.wait(15)
            
            pcall(function()
                collectgarbage("collect")
            end)
        end
    end))
    
    pcall(function()
        setfpscap(999)
    end)
    
    pcall(function()
        local cam = Workspace.CurrentCamera
        cam.FieldOfView = 70
    end)
    
    createNotify("ULTRA POTATO Optimizer Enabled")
end

function OPTIMIZER.Disable()
    if not getgenv().OPTIMIZER_ACTIVE then return end
    
    getgenv().OPTIMIZER_ACTIVE = false
    
    for _, thread in ipairs(optimizerThreads) do
        pcall(function()
            task.cancel(thread)
        end)
    end
    optimizerThreads = {}
    
    for _, conn in ipairs(optimizerConnections) do
        pcall(function()
            conn:Disconnect()
        end)
    end
    optimizerConnections = {}
    
    pcall(function()
        Workspace.StreamingEnabled = originalSettings.streamingEnabled or true
        Workspace.StreamingMinRadius = originalSettings.streamingMinRadius or 64
        Workspace.StreamingTargetRadius = originalSettings.streamingTargetRadius or 1024
        
        settings().Rendering.QualityLevel = originalSettings.qualityLevel or Enum.QualityLevel.Automatic
        settings().Rendering.MeshPartDetailLevel = originalSettings.meshPartDetailLevel or Enum.MeshPartDetailLevel.DistanceBased
        
        Lighting.GlobalShadows = originalSettings.globalShadows ~= false
        Lighting.Brightness = originalSettings.brightness or 1
        Lighting.FogEnd = originalSettings.fogEnd or 100000
        Lighting.Technology = originalSettings.technology or Enum.Technology.ShadowMap
        Lighting.EnvironmentDiffuseScale = originalSettings.environmentDiffuseScale or 1
        Lighting.EnvironmentSpecularScale = originalSettings.environmentSpecularScale or 1
        
        Workspace.Terrain.WaterWaveSize = originalSettings.waterWaveSize or 0.15
        Workspace.Terrain.WaterWaveSpeed = originalSettings.waterWaveSpeed or 10
        Workspace.Terrain.WaterReflectance = originalSettings.waterReflectance or 1
        Workspace.Terrain.WaterTransparency = originalSettings.waterTransparency or 0.3
        Workspace.Terrain.Decoration = originalSettings.decoration ~= false
    end)
    
    createNotify("Optimizer Disabled")
end

-- ========================================
--          Brainrot ESP
-- ========================================

local ESP_INSTANCES = {}
local ESP_BEST_UID = nil

local function clearESPForUID(uid)
    local rec = ESP_INSTANCES[uid]
    if not rec then return end
    if rec.highlight then pcall(function() rec.highlight:Destroy() end) end
    if rec.billboard then pcall(function() rec.billboard:Destroy() end) end
    ESP_INSTANCES[uid] = nil
end

local function clearAllESP()
    for uid in pairs(ESP_INSTANCES) do
        clearESPForUID(uid)
    end
    ESP_BEST_UID = nil
end

local function getPodiumWorldPart(animal)
    if not animal.plot or not animal.slot then return nil end
    
    local plot = Workspace.Plots:FindFirstChild(animal.plot)
    if not plot then return nil end
    
    local podiums = plot:FindFirstChild("AnimalPodiums")
    if not podiums then return nil end
    
    local podium = podiums:FindFirstChild(animal.slot)
    if not podium then return nil end
    
    local base = podium:FindFirstChild("Base")
    if not base then return podium end
    
    local spawn = base:FindFirstChild("Spawn")
    return spawn or base or podium
end

local function refreshAllESP()
    clearAllESP()
    
    local activeUIDs = {}
    local bestAnimal = nil
    
    for _, animal in ipairs(allAnimalsCache) do
        if not isMyBaseAnimal(animal) then
            bestAnimal = animal
            break
        end
    end
    
    ESP_BEST_UID = bestAnimal and bestAnimal.uid or nil
    
    for _, animalData in ipairs(allAnimalsCache) do
        if isMyBaseAnimal(animalData) then
            continue
        end
        
        if (animalData.uid == ESP_BEST_UID) or (animalData.genValue >= 50000000) then
            local uid = animalData.uid
            activeUIDs[uid] = true
            
            local model = getPodiumWorldPart(animalData)
            
            if model then
                local rec = { part = model }
                
                local highlight = Instance.new("Highlight")
                highlight.Adornee = model
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.FillTransparency = 0.7
                highlight.FillColor = Color3.fromRGB(220, 120, 255)
                highlight.OutlineTransparency = 0.5
                highlight.OutlineColor = Color3.fromRGB(255, 180, 255)
                highlight.Parent = playerGui
                rec.highlight = highlight
                
                local bb = Instance.new("BillboardGui")
                bb.Name = "BrainrotESP"
                bb.Adornee = model
                bb.AlwaysOnTop = true
                bb.Size = UDim2.new(0, 220, 0, 80)
                bb.SizeOffset = Vector2.new(0, 0)
                bb.StudsOffset = Vector3.new(0, 3.5, 0)
                bb.Parent = playerGui
                
                local bgFrame = Instance.new("Frame")
                bgFrame.Size = UDim2.new(1, 0, 1, 0)
                bgFrame.BackgroundColor3 = Color3.fromRGB(100, 50, 150)
                bgFrame.BackgroundTransparency = 0.8
                bgFrame.BorderSizePixel = 0
                bgFrame.Parent = bb
                
                local gradient = Instance.new("UIGradient")
                gradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 80, 200)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 180, 255)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 200, 150))
                })
                gradient.Rotation = 45
                gradient.Parent = bgFrame
                
                local corner = Instance.new("UICorner")
                corner.CornerRadius = UDim.new(0, 10)
                corner.Parent = bgFrame
                
                local stroke = Instance.new("UIStroke")
                stroke.Color = Color3.fromRGB(255, 255, 255)
                stroke.Thickness = 2
                stroke.Transparency = 0.4
                stroke.Parent = bgFrame
                
                task.spawn(function()
                    while bgFrame.Parent do
                        for rot = 45, 405, 2 do
                            if not bgFrame.Parent then break end
                            gradient.Rotation = rot
                            task.wait(0.03)
                        end
                    end
                end)
                
                local nameLabel = Instance.new("TextLabel")
                nameLabel.Size = UDim2.new(1, -10, 0.5, 0)
                nameLabel.Position = UDim2.new(0, 5, 0, 5)
                nameLabel.BackgroundTransparency = 1
                nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                nameLabel.TextScaled = true
                nameLabel.Font = Enum.Font.GothamBold
                nameLabel.TextStrokeTransparency = 0
                nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                nameLabel.Parent = bgFrame
                
                local genLabel = Instance.new("TextLabel")
                genLabel.Size = UDim2.new(1, -10, 0.5, -5)
                genLabel.Position = UDim2.new(0, 5, 0.5, 0)
                genLabel.BackgroundTransparency = 1
                genLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                genLabel.TextScaled = true
                genLabel.Font = Enum.Font.GothamBold
                genLabel.TextStrokeTransparency = 0
                genLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                genLabel.Parent = bgFrame
                
                rec.billboard = bb
                rec.labelName = nameLabel
                rec.labelGen = genLabel
                
                ESP_INSTANCES[uid] = rec
                
                rec.labelName.Text = animalData.name
                rec.labelGen.Text = animalData.genText
            end
        end
    end
    
    for uid in pairs(ESP_INSTANCES) do
        if not activeUIDs[uid] then
            clearESPForUID(uid)
        end
    end
end

local function enableBrainrotEsp()
    refreshAllESP()
end

local function disableBrainrotEsp()
    clearAllESP()
end

-- ========================================
--          Player ESP
-- ========================================

local PLAYER_ESP = {}

local function clearPlayerESP(plr)
    local rec = PLAYER_ESP[plr]
    if not rec then return end
    
    if rec.highlightMain then pcall(function() rec.highlightMain:Destroy() end) end
    if rec.highlightSoft then pcall(function() rec.highlightSoft:Destroy() end) end
    if rec.billboard then pcall(function() rec.billboard:Destroy() end) end
    
    PLAYER_ESP[plr] = nil
end

local function clearAllPlayerESP()
    for plr in pairs(PLAYER_ESP) do
        clearPlayerESP(plr)
    end
end

local function createPlayerESP(plr)
    local char = plr.Character
    if not char then return end
    
    local hrp = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso") or char.PrimaryPart
    if not hrp then return end
    
    local rec = {}
    
    local hMain = Instance.new("Highlight")
    hMain.Adornee = char
    hMain.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hMain.FillTransparency = 1
    hMain.OutlineTransparency = 0
    hMain.OutlineColor = Color3.fromRGB(220, 120, 255)
    hMain.Parent = playerGui
    rec.highlightMain = hMain
    
    local hSoft = Instance.new("Highlight")
    hSoft.Adornee = char
    hSoft.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hSoft.FillTransparency = 1
    hSoft.OutlineTransparency = 0
    hSoft.OutlineColor = Color3.new(0.345098, 0.066667, 0.952941)
    hSoft.Parent = playerGui
    rec.highlightSoft = hSoft
    
    local bb = Instance.new("BillboardGui")
    bb.Size = UDim2.new(0, 160, 0, 32)
    bb.Adornee = hrp
    bb.AlwaysOnTop = true
    bb.StudsOffset = Vector3.new(0, 3.2, 0)
    bb.Parent = playerGui
    rec.billboard = bb
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.fromRGB(120, 240, 255)
    nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.TextStrokeTransparency = 0.3
    nameLabel.TextScaled = true
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.Text = plr.Name
    nameLabel.Parent = bb
    rec.nameLabel = nameLabel
    
    PLAYER_ESP[plr] = rec
end

local function refreshPlayerESP()
    clearAllPlayerESP()
    
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= Player then
            createPlayerESP(plr)
        end
    end
    
    local myChar = Player.Character
    local myHRP = myChar and (myChar:FindFirstChild("HumanoidRootPart") or myChar:FindFirstChild("UpperTorso") or myChar.PrimaryPart)
    
    for plr, rec in pairs(PLAYER_ESP) do
        local char = plr.Character
        local hrp = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso") or char.PrimaryPart)
        
        if not char or not hrp or not myHRP then
            clearPlayerESP(plr)
        else
            local dist = (myHRP.Position - hrp.Position).Magnitude
            local distInt = math.floor(dist + 0.5)
            
            if rec.nameLabel then
                rec.nameLabel.Text = string.format("%s [%dm]", plr.Name, distInt)
            end
        end
    end
end

local function playerESPHeartbeat()
    refreshPlayerESP()
end

local function enablePlayerEsp()
    RunService.Heartbeat:Connect(playerESPHeartbeat)
end

local function disablePlayerEsp()
    clearAllPlayerESP()
end

-- ========================================
--          Auto Teleport to Highest
-- ========================================

local allAnimalsCache = {}

local function getHighestAnimal()
    if #allAnimalsCache == 0 then return nil end
    table.sort(allAnimalsCache, function(a, b)
        return a.genValue > b.genValue
    end)
    return allAnimalsCache[1]
end

local function teleportToHighest()
    local highest = getHighestAnimal()
    if highest then
        teleportToAnimal(highest)
    else
        createNotify("No brainrots found!")
    end
end

local function autoTeleportOnStart()
    task.wait(0.5)
    if #allAnimalsCache > 0 then
        teleportToHighest()
    end
end

local function enableAutoTpOnStart()
    task.spawn(autoTeleportOnStart)
end

-- ========================================
--          Auto Desync on Start
-- ========================================

local function autoDesyncOnStart()
    task.wait(1)
    enableDesync()
end

local function enableAutoDesyncOnStart()
    task.spawn(autoDesyncOnStart)
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
    createNotify("Configs deleted!")
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

local function createKeybindButton(parent, text, currentKey, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -20, 0, 55)
    container.BackgroundTransparency = 1
    container.Parent = parent

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.55, 0, 1, 0)
    label.Position = UDim2.new(0, 15, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(200,200,200)
    label.Font = Enum.Font.GothamSemibold
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container

    local keyButton = Instance.new("TextButton")
    keyButton.Size = UDim2.new(0, 90, 0, 38)
    keyButton.Position = UDim2.new(1, -100, 0.5, -19)
    keyButton.BackgroundColor3 = Color3.fromRGB(60,60,65)
    keyButton.Text = currentKey and currentKey.Name or "Not Set"
    keyButton.TextColor3 = Color3.new(1,1,1)
    keyButton.TextSize = 14
    keyButton.Font = Enum.Font.GothamBold
    keyButton.Parent = container
    Instance.new("UICorner", keyButton).CornerRadius = UDim.new(0, 8)

    local isListening = false
    keyButton.MouseButton1Click:Connect(function()
        if isListening then return end
        isListening = true
        keyButton.Text = "..."
        keyButton.BackgroundColor3 = Color3.fromRGB(255,215,120)

        local conn
        conn = UserInputService.InputBegan:Connect(function(input, gp)
            if gp then return end
            if input.UserInputType == Enum.UserInputType.Keyboard then
                local newKey = input.KeyCode
                keyButton.Text = newKey.Name
                keyButton.BackgroundColor3 = Color3.fromRGB(60,60,65)
                callback(newKey)
                isListening = false
                conn:Disconnect()
            end
        end)
    end)

    return container
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

-- Existing toggles (keep old ones)
createToggle(pages.Visual, "Xray", function(state)
    -- old xray logic if needed, but we replaced with Xray Base
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

-- NEW TOGGLES FROM BRAINROT FINDER

createToggle(pages.Visual, "Xray Base", function(state)
    if state then
        enableInvisibleBaseWalls()
    else
        disableInvisibleBaseWalls()
    end
end)

createToggle(pages.Visual, "Brainrot ESP", function(state)
    if state then
        enableBrainrotEsp()
    else
        disableBrainrotEsp()
    end
end)

createToggle(pages.Visual, "Player ESP", function(state)
    if state then
        enablePlayerEsp()
    else
        disablePlayerEsp()
    end
end)

createToggle(pages.Combat, "Anti Ragdoll v2 (Moveable)", function(state)
    if state then
        enableAntiRagdollV2()
    else
        disableAntiRagdoll()
    end
end)

createToggle(pages.Perform, "Load Tuff Optimizer", function(state)
    if state then
        enableOptimizer()
    else
        disableOptimizer()
    end
end)

createToggle(pages.Perform, "Anti Lag", function(state)
    if state then
        enableAntiLag()
    else
        disableAntiLag()
    end
end)

createToggle(pages.Tuff, "Floor Steal", function(state)
    if state then
        startFloorSteal()
    else
        stopFloorSteal()
    end
end)

createToggle(pages.Tuff, "Auto Steal Nearest", function(state)
    if state then
        enableAutoStealNearest()
    else
        disableAutoStealNearest()
    end
end)

createToggle(pages.Tuff, "Disable Animation During Steal", function(state)
    CONFIG.STEAL_DISABLE_ANIM_ENABLED = state
    if state then
        if Player:GetAttribute("Stealing") then
            startAnimDisable()
        end
    else
        stopAnimDisable()
    end
end)

createToggle(pages.Tuff, "Speed Boost During Steal", function(state)
    CONFIG.STEAL_SPEED_ENABLED = state
    if state then
        if Player:GetAttribute("Stealing") then
            startStealSpeed()
        end
    else
        stopStealSpeed()
    end
end)

-- Setting tab - Auto start toggles and keybinds
createToggle(pages.Setting, "Auto Teleport On Start", function(state)
    CONFIG.AUTO_TP_ENABLED = state
end)

createToggle(pages.Setting, "Auto Desync On Start", function(state)
    CONFIG.AUTO_DESYNC_ENABLED = state
end)

-- Keybinds in Setting
local TELEPORT_KEYBIND = Enum.KeyCode.T
local TOGGLE_GUI_KEYBIND = Enum.KeyCode.Insert
local DESYNC_KEYBIND = Enum.KeyCode.G

createKeybindButton(pages.Setting, "Toggle GUI", TOGGLE_GUI_KEYBIND, function(key)
    TOGGLE_GUI_KEYBIND = key
end)

createKeybindButton(pages.Setting, "Teleport to Highest", TELEPORT_KEYBIND, function(key)
    TELEPORT_KEYBIND = key
end)

createKeybindButton(pages.Setting, "Desync V3", DESYNC_KEYBIND, function(key)
    DESYNC_KEYBIND = key
end)

-- Floating Toggle Button (NY)
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 80, 0, 50)
toggleBtn.Position = UDim2.new(0, 20, 0.5, -25)
toggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleBtn.Text = "NY"
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.TextScaled = true
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.AutoButtonColor = false
toggleBtn.Parent = mainGui
toggleBtn.Visible = false

Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 12)
local toggleStroke = Instance.new("UIStroke", toggleBtn)
toggleStroke.Color = Color3.fromRGB(255, 0, 0)
toggleStroke.Thickness = 3
toggleStroke.Transparency = 0.2

Drag(toggleBtn)

toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

createToggle(pages.Setting, "Floating Button", function(state)
    toggleBtn.Visible = state
end)

mainFrame.Visible = false

closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

local minimized = false

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

-- Keybinds handling
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end

    if input.KeyCode == TOGGLE_GUI_KEYBIND then
        mainFrame.Visible = not mainFrame.Visible
    elseif input.KeyCode == TELEPORT_KEYBIND then
        teleportToHighest()
    elseif input.KeyCode == DESYNC_KEYBIND then
        enableDesync()
    end
end)

-- Init new features
setupPromptCacheCleanup()
initializePlotScanner() -- if you added the scanner logic
autoStealLoop()

-- Auto start
if CONFIG.AUTO_TP_ENABLED then
    enableAutoTpOnStart()
end
if CONFIG.AUTO_DESYNC_ENABLED then
    enableAutoDesyncOnStart()
end

loadLastConfig()

createNotify("Load success")
