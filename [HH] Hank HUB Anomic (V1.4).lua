-- Variables

local Toggled_TransparentUI = false
local Toggled_StreamingMode = false
local Toggled_MenuBankGUI = false
local Toggled_MenuPaintGUI = false
local Toggled_MenuAvatarEditorGUI = false

local Dropdown_ViewCamears = false
local Dropdown_TeleportPlaces = false
local Dropdown_ScriptHub = false

local tweenservice = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

-- Game Place ID

local AnomicPlaceID = 4581966615

-- Toggle Button

local FirstTogglePos = UDim2.new(0, 0,0.027, 0)
local LastTogglePos = UDim2.new(0, 27,0.027, 0)

-- Slider Button

local FirstSliderPos = UDim2.new(0.035, 0,0.55, 0)
local LastSliderPos = UDim2.new(0.9, 0,0.55, 0)

-- Dropdown Button

local FirstDropdownRot = 90
local LastDropdownRot = 270

-- Button Color

local FirstButtonCol = Color3.fromRGB(25, 25, 25)
local LastButtonCol = Color3.fromRGB(208, 124, 27)

-- ToggleBtn_TransparentUI

local IsToggleTransparentUI = false

-- Slider

local SliderPos = UDim2.new(0.035, 0,0.63, 0)
local SliderSize = UDim2.new(0, 266, 0, 7)

-- _G --

_G.Flying = false
_G.HitboxSize = 3
_G.HitboxTransparency = 0.8
_G.HitboxColor = 0
_G.EnabledHitbox = false
_G.HitboxPart = "HumanoidRootPart"
_G.plresp = false
_G.PrinterESP = false
_G.XrayOnOrOff = false
_G.BuyAmmo = "9mm"

-- Button Icons --

local BtnIcons = {
    "rbxassetid://3926305904", -- Local
    "rbxassetid://3926307971", -- Tools
    "rbxassetid://3926307971", -- Visual
    "rbxassetid://3926305904", -- Teleport
    "rbxassetid://3926305904", -- Misc
    "rbxassetid://3926307971", -- Settings
    "rbxassetid://3926305904", -- Credits
}

-- Notification --

local function notify(name,text,length)
    name = name or "Notification"
    text = text or "Hello!"
    length = length or 5
    
    local tweenservice = game:GetService("TweenService")

    local NotifyFirstPosition = UDim2.new(-0.3, 0,0.885, 0)
    local NotifyLastPosition = UDim2.new(0.008, 0,0.885, 0)

    local NotificationGUI = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local UIGradient = Instance.new("UIGradient")
    local Top = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UICorner_2 = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local Text = Instance.new("TextLabel")
    local Button = Instance.new("TextButton")

    NotificationGUI.Name = "NotificationGUI"
    NotificationGUI.Parent = game:GetService("CoreGui")

    Background.Name = "Background"
    Background.Parent = NotificationGUI
    Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Background.Position = UDim2.new(-0.300000012, 0, 0.88499999, 0)
    Background.Size = UDim2.new(0, 315, 0, 57)
    Background.Visible = false
    Background.ZIndex = 0

    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 25, 25)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(56, 56, 56))}
    UIGradient.Parent = Background

    Top.Name = "Top"
    Top.Parent = Background
    Top.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Top.Size = UDim2.new(0, 315, 0, 21)

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Top

    UICorner_2.CornerRadius = UDim.new(0, 5)
    UICorner_2.Parent = Background

    Title.Name = "Title"
    Title.Parent = Background
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Size = UDim2.new(0, 315, 0, 21)
    Title.ZIndex = 2
    Title.Font = Enum.Font.SourceSansBold
    Title.Text = "Notify"
    Title.TextColor3 = Color3.fromRGB(208, 124, 27)
    Title.TextSize = 20.000

    Text.Name = "Text"
    Text.Parent = Background
    Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text.BackgroundTransparency = 1.000
    Text.Position = UDim2.new(0, 0, 0.368421048, 0)
    Text.Size = UDim2.new(0, 315, 0, 36)
    Text.ZIndex = 2
    Text.Font = Enum.Font.SourceSansSemibold
    Text.Text = "Hi"
    Text.TextColor3 = Color3.fromRGB(208, 124, 27)
    Text.TextSize = 14.000
    Text.TextWrapped = true

    Button.Name = "Button"
    Button.Parent = Background
    Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Button.BackgroundTransparency = 1.000
    Button.Position = UDim2.new(0.933333337, 0, 0, 0)
    Button.Size = UDim2.new(0, 21, 0, 21)
    Button.ZIndex = 2
    Button.Font = Enum.Font.SourceSansBold
    Button.Text = "X"
    Button.TextColor3 = Color3.fromRGB(208, 124, 27)
    Button.TextSize = 20.000

    Button.MouseButton1Click:Connect(function()
        tweenservice:Create(Background,TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = NotifyFirstPosition}):Play()
        wait(2)
        Background.Visible = false
    end)
    spawn(function()
        Title.Text = name
        Text.Text = text
        Background.Visible = true
        tweenservice:Create(Background,TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = NotifyLastPosition}):Play()
        wait(length)
        tweenservice:Create(Background,TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = NotifyFirstPosition}):Play()
        wait(2)
        Background.Visible = false
    end)
end

--[[
notify("Notification","Hi",5)
]]

local function Bnotify(name,text,length,button1,button2,funcbut1,funcbut2)
    name = name or "Notification"
    text = text or "Test Buttons"
    length = length or 5
    button1 = button1 or "Yes"
    button2 = button2 or "No"
    
    local tweenservice = game:GetService("TweenService")
    
    local NotifyFirstPosition = UDim2.new(-0.3, 0,0.82, 0)
    local NotifyLastPosition = UDim2.new(0.008, 0,0.82, 0)
    
    local NotifyFirstColor = Color3.fromRGB(25, 25, 25)
    local NotifyLastColor = Color3.fromRGB(208, 124, 27)
    
    local BNotificationGUI = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local UIGradient = Instance.new("UIGradient")
    local Top = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UICorner_2 = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local Text = Instance.new("TextLabel")
    local Exit = Instance.new("TextButton")
    local Button1 = Instance.new("TextButton")
    local UICorner_3 = Instance.new("UICorner")
    local Button2 = Instance.new("TextButton")
    local UICorner_4 = Instance.new("UICorner")

    BNotificationGUI.Name = "BNotificationGUI"
    BNotificationGUI.Parent = game:GetService("CoreGui")

    Background.Name = "Background"
    Background.Parent = BNotificationGUI
    Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Background.Position = UDim2.new(0.00799999665, 0, 0.817980587, 0)
    Background.Size = UDim2.new(0, 315, 0, 95)
    Background.ZIndex = 0

    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 25, 25)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(56, 56, 56))}
    UIGradient.Parent = Background

    Top.Name = "Top"
    Top.Parent = Background
    Top.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Top.Size = UDim2.new(0, 315, 0, 21)

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Top

    UICorner_2.CornerRadius = UDim.new(0, 5)
    UICorner_2.Parent = Background

    Title.Name = "Title"
    Title.Parent = Background
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Size = UDim2.new(0, 315, 0, 21)
    Title.ZIndex = 2
    Title.Font = Enum.Font.SourceSansBold
    Title.Text = "Notify"
    Title.TextColor3 = Color3.fromRGB(208, 124, 27)
    Title.TextSize = 20.000

    Text.Name = "Text"
    Text.Parent = Background
    Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text.BackgroundTransparency = 1.000
    Text.Position = UDim2.new(0, 0, 0.216494843, 0)
    Text.Size = UDim2.new(0, 315, 0, 42)
    Text.ZIndex = 2
    Text.Font = Enum.Font.SourceSansSemibold
    Text.Text = "Hi"
    Text.TextColor3 = Color3.fromRGB(208, 124, 27)
    Text.TextSize = 14.000
    Text.TextWrapped = true

    Exit.Name = "Exit"
    Exit.Parent = Background
    Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Exit.BackgroundTransparency = 1.000
    Exit.Position = UDim2.new(0.933333337, 0, 0, 0)
    Exit.Size = UDim2.new(0, 21, 0, 21)
    Exit.ZIndex = 2
    Exit.Font = Enum.Font.SourceSansBold
    Exit.Text = "X"
    Exit.TextColor3 = Color3.fromRGB(208, 124, 27)
    Exit.TextSize = 20.000

    Button1.Name = "Button1"
    Button1.Parent = Background
    Button1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Button1.Position = UDim2.new(0.244444445, 0, 0.721758068, 0)
    Button1.Size = UDim2.new(0, 70, 0, 20)
    Button1.ZIndex = 2
    Button1.Font = Enum.Font.SourceSansSemibold
    Button1.Text = "Ok"
    Button1.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button1.TextSize = 14.000
    Button1.TextWrapped = true

    UICorner_3.CornerRadius = UDim.new(0, 5)
    UICorner_3.Parent = Button1

    Button2.Name = "Button2"
    Button2.Parent = Background
    Button2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Button2.Position = UDim2.new(0.517460346, 0, 0.721758068, 0)
    Button2.Size = UDim2.new(0, 70, 0, 20)
    Button2.ZIndex = 2
    Button2.Font = Enum.Font.SourceSansSemibold
    Button2.Text = "Cancel"
    Button2.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button2.TextSize = 14.000
    Button2.TextWrapped = true

    UICorner_4.CornerRadius = UDim.new(0, 5)
    UICorner_4.Parent = Button2
    
    Exit.MouseButton1Click:Connect(function()
        tweenservice:Create(Background,TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = NotifyFirstPosition}):Play()
        wait(2)
        Background.Visible = false
    end)
    
    Button1.MouseButton1Click:Connect(funcbut1)
    
    Button2.MouseButton1Click:Connect(funcbut2)
    
    spawn(function()
        Title.Text = name
        Text.Text = text
        Button1.Text = button1
        Button2.Text = button2
        Background.Visible = true
        tweenservice:Create(Background,TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = NotifyLastPosition}):Play()
        wait(length)
        tweenservice:Create(Background,TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = NotifyFirstPosition}):Play()
        wait(2)
        Background.Visible = false
    end)
end

local function CopyInvite()
    local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
    
    clipBoard("https://discord.io/hankhub")
end

local function Canceled()
    tweenservice:Create(Background,TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = NotifyFirstPosition}):Play()
    wait(2)
    Background.Visible = false
end

--[[
Bnotify("Noob","Troll",5,"Copy","Cancel",CopyInvite,False)
]]

-- Player Added Function --

spawn(function()
	for i,v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
		if v.Name == "ToolModel" then
		local distance = ((Vector3.new(1000.79315, -38.7140503, -132.486191))-(v.hitbox.Position)).Magnitude
			if distance < 30 then
			v:Destroy()
			end
		end
	end
end)

-- UI Lib --

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/HankRBXHelper/Hank-HUB-UI-Library/main/%5BHH%5D%20Hank%20HUB%20UI%20Library.lua",true))()

local NewWindow = lib:Window("Anomic")

LocalTab = NewWindow:Tab("Local", "rbxassetid://3926305904", Vector2.new(964, 924))

ToolsTab = NewWindow:Tab("Tools", "rbxassetid://3926307971", Vector2.new(964, 4))

VisualsTab = NewWindow:Tab("Visuals", "rbxassetid://3926307971", Vector2.new(84, 44))

TeleportTab = NewWindow:Tab("Teleport", "rbxassetid://3926305904", Vector2.new(138, 4))

MiscTab = NewWindow:Tab("Misc", "rbxassetid://3926305904", Vector2.new(644, 364))

SettingsTab = NewWindow:Tab("Settings", "rbxassetid://3926307971", Vector2.new(324, 124))

CreditsTab = NewWindow:Tab("Credits", "rbxassetid://3926305904", Vector2.new(564, 564))

-- Local --

LocalTab:Section("LOCAL")

LocalTab:Section("MAIN")

LocalTab:Button("Main Bypass", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Shariiii/Anomic-Stuff/main/Main%20Bypass.lua", true))()
    notify("Notification","Main Bypass has been executed",5)
end)

LocalTab:Button("Chat Display", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HANKRBX/Chat-Display/main/%5BAnomic%5D%20Chat%20Logs.lua", true))()
end)

LocalTab:Button("Anti Spawn Countdown", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Shariiii/Anomic-Stuff/main/Anti%20Spawn%20CD.lua", true))()
    notify("Notification","Anti Spawn Count Down has been executed",5)
end)

LocalTab:Button("Force Respawn", function()
    local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
    local GUI = PlayerGui.AvatarEditor
    
    GUI.Enabled = true
    GUI.MainFrame.Visible = false
    GUI.WearButton.Visible = true
    GUI.WearButton.Text = "Force Respawn"
end)

LocalTab:Section("HUMANOID")

LocalTab:Button("Walk Speed Bypass", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Shariiii/Anomic-Stuff/main/WalkSpeed%20Bypass%20(Open%20Source).lua", true))()
    notify("Notification","Walkspeed bypass has been executed",5)
end)

LocalTab:Toggle("Noclip", function(t)
    if t == true then
        notify("Notification","Noclip Enabled",5)
        noclip = game:GetService("RunService").Stepped:Connect(function()
            for i, v in ipairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                if v:IsA("BasePart")then
                    v.CanCollide = false
                end
            end
        end)
    else
        notify("Notification","Noclip Disabled",5)
        noclip:Disconnect()
    end
end)

LocalTab:Button("Fly", function()
    notify("Notification","Press X to fly",15)
    local ScreenGui = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local title = Instance.new("TextLabel")
    local fly = Instance.new("TextButton")
    local bypass = Instance.new("TextButton")
    
    ScreenGui.Name = "FlyGUI"
    ScreenGui.Parent = game.CoreGui
    
    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.Active = true
    Main.BackgroundColor3 = Color3.fromRGB(208, 124, 27)
    Main.BorderColor3 = Color3.fromRGB(0, 46, 255)
    Main.Position = UDim2.new(0.358463615, 0, 0.491279036, 0)
    Main.Size = UDim2.new(0, 198, 0, 117)
    Main.Active = true
    Main.Draggable = true
    
    title.Name = "title"
    title.Parent = Main
    title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    title.BorderColor3 = Color3.fromRGB(255, 0, 0)
    title.Position = UDim2.new(0.0404041931, 0, 0.0854700878, 0)
    title.Size = UDim2.new(0, 179, 0, 13)
    title.Font = Enum.Font.SourceSans
    title.Text = "Fly GUI"
    title.TextColor3 = Color3.fromRGB(208, 124, 27)
    title.TextSize = 14.000
    
    fly.Name = "fly"
    fly.Parent = Main
    fly.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    fly.BorderColor3 = Color3.fromRGB(255, 0, 0)
    fly.Position = UDim2.new(0.0404041857, 0, 0.341880351, 0)
    fly.Size = UDim2.new(0, 68, 0, 37)
    fly.Font = Enum.Font.SourceSans
    fly.Text = "Fly (X)"
    fly.TextColor3 = Color3.fromRGB(208, 124, 27)
    fly.TextSize = 14.000
    fly.MouseButton1Down:connect(function()
        ScreenGui:Destroy()
    	local plr = game.Players.LocalPlayer
    	local mouse = plr:GetMouse()
    
    	localplayer = plr
    
    	if workspace:FindFirstChild("Core") then
    		workspace.Core:Destroy()
    	end
    
    	local Core = Instance.new("Part")
    	Core.Name = "Core"
    	Core.Size = Vector3.new(0.05, 0.05, 0.05)
    
    	spawn(function()
    		Core.Parent = workspace
    		local Weld = Instance.new("Weld", Core)
    		Weld.Part0 = Core
    		Weld.Part1 = localplayer.Character.LowerTorso
    		Weld.C0 = CFrame.new(0, 0, 0)
    	end)
    
    	workspace:WaitForChild("Core")
    
    	local torso = workspace.Core
    	flying = true
    	local speed=10
    	local keys={a=false,d=false,w=false,s=false}
    	local e1
    	local e2
    	local function start()
    		local pos = Instance.new("BodyPosition",torso)
    		local gyro = Instance.new("BodyGyro",torso)
    		pos.Name="EPIXPOS"
    		pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
    		pos.position = torso.Position
    		gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    		gyro.cframe = torso.CFrame
    		repeat
    			wait()
    			localplayer.Character.Humanoid.PlatformStand=true
    			local new=gyro.cframe - gyro.cframe.p + pos.position
    			if not keys.w and not keys.s and not keys.a and not keys.d then
    				speed=5
    			end
    			if keys.w then
    				new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
    				speed=speed+0
    			end
    			if keys.s then
    				new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
    				speed=speed+0
    			end
    			if keys.d then
    				new = new * CFrame.new(speed,0,0)
    				speed=speed+0
    			end
    			if keys.a then
    				new = new * CFrame.new(-speed,0,0)
    				speed=speed+0
    			end
    			if speed>10 then
    				speed=5
    			end
    			pos.position=new.p
    			if keys.w then
    				gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*0),0,0)
    			elseif keys.s then
    				gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*0),0,0)
    			else
    				gyro.cframe = workspace.CurrentCamera.CoordinateFrame
    			end
    		until flying == false
    		if gyro then gyro:Destroy() end
    		if pos then pos:Destroy() end
    		flying=false
    		localplayer.Character.Humanoid.PlatformStand=false
    		speed=10
    	end
    	e1=mouse.KeyDown:connect(function(key)
    		if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
    		if key=="w" then
    			keys.w=true
    		elseif key=="s" then
    			keys.s=true
    		elseif key=="a" then
    			keys.a=true
    		elseif key=="d" then
    			keys.d=true
    		elseif key=="x" then
    			if flying==true then
    				flying=false
    			else
    				flying=true
    				start()
    			end
    		end
    	end)
    	e2=mouse.KeyUp:connect(function(key)
    		if key=="w" then
    			keys.w=false
    		elseif key=="s" then
    			keys.s=false
    		elseif key=="a" then
    			keys.a=false
    		elseif key=="d" then
    			keys.d=false
    		end
    	end)
    	start()
    end)
end)

LocalTab:Button("Click Teleport", function()
    notify("Notification","Press Left Control then click Left Mouse Button",15)
    local Plr = game.Players.LocalPlayer
    local Mouse = Plr:GetMouse()

    function To(position)
        local Chr = Plr.Character
        if Chr ~= nil then
            Chr:MoveTo(position)
        end
    end

    UIS.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
            To(Mouse.Hit.p)
        end
    end)
end)

LocalTab:Button("Infinite Jump", function()
    local Player = game:GetService'Players'.LocalPlayer;
    local UIS = game:GetService'UserInputService';

    _G.JumpHeight = 30;
    
    function Action(Object, Function) if Object ~= nil then Function(Object); end end
    
    UIS.InputBegan:connect(function(UserInput)
       if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
           Action(Player.Character.Humanoid, function(self)
               if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                   Action(self.Parent.HumanoidRootPart, function(self)
                       self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                   end)
               end
           end)
       end
    end)
end)

LocalTab:Slider("Walk Speed", 13, 500, function(value)
    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = value
end)

LocalTab:Slider("Jump Power", 30, 500, function(value)
    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").JumpPower = value
end)

-- Tools --

ToolsTab:Section("TOOLS")

ToolsTab:Section("PICK AND CLAIM ITEMS")

ToolsTab:Button("Pick All Dropped Tools", function()
    notify("Notification","Grabbing Tools",5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Shariiii/Anomic-Stuff/main/Pick%20all%20dropped%20tools.lua", true))()
end)

ToolsTab:Button("Baton Farm", function()
    notify("Notification","Destroying printers...",5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Shariiii/Anomic-Stuff/main/Baton%20Farm%20Script.lua", true))()
end)

getgenv().FarmingTools = false

ToolsTab:Toggle("Pick All Tools Farm", function(t)
    getgenv().FarmingTools = t
    while getgenv().FarmingTools do wait()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shariiii/Anomic-Stuff/main/Pick%20all%20dropped%20tools.lua", true))()
    end
end)

getgenv().FarmingBaton = false

ToolsTab:Toggle("Baton Auto Farm", function(t)
    getgenv().FarmingBaton = t
    while getgenv().FarmingBaton do wait()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shariiii/Anomic-Stuff/main/Baton%20Farm%20Script.lua", true))()
    end
end)

ToolsTab:Button("Teleport To Printers", function()
    local Player = game:GetService("Players")
    local Character = Player.LocalPlayer.Character
    for i,v in pairs (game.Workspace.Entities:GetChildren()) do 
		if v:IsA("Model") and v.Name == "Simple Printer" then
		    Phandle = v:FindFirstChild("Handle")
		    RootPart = Character:FindFirstChild("HumanoidRootPart")
		    RootPart.CFrame = Phandle.CFrame + Vector3.new(0,3,0)
        end
	end
end)

ToolsTab:Button("Claim All Unlocked Printers", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Shariiii/Anomic-Stuff/main/Pick%20All%20UnLocked%20Printers.lua", true))()
end)

ToolsTab:Button("Picklock All Printers", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Shariiii/Anomic-Stuff/main/Unlock%20and%20Cash%20Printers.lua", true))()
end)

ToolsTab:Section("AUTO BUY ITEM")

ToolsTab:Dropdown("Select Ammo", {"9mm", ".45 ACP", "5.56", "12 Gauge", ".50", "5.7x28"}, function(v)
    _G.BuyAmmo = v
end)

getgenv().BuyingAmmo = false

ToolsTab:Toggle("Auto Buy Ammo", function(t)
    if t == true then
        getgenv().BuyingAmmo = true
        while getgenv().BuyingAmmo do wait(3.5)
            local A_1 = _G.BuyAmmo
            local A_2 = "Single"
            local Event = game:GetService("ReplicatedStorage")["_CS.Events"].PurchaseTeamItem
            Event:FireServer(A_1, A_2)
        end
    else
        getgenv().BuyAmmo = false
    end
end)

getgenv().AutoFarmPrinter = false

ToolsTab:Toggle("Auto Farm Printer", function(t)
    getgenv().AutoFarmPrinter = t
    while getgenv().AutoFarmPrinter do wait()
        notify("Notification","Please unlock your printer",5)
        local A_1 = "Simple Printer"
        local A_2 = "Single"
        local Event = game:GetService("ReplicatedStorage")["_CS.Events"].PurchaseTeamItem
        Event:FireServer(A_1, A_2)
        wait(5)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shariiii/Anomic-Stuff/main/Pick%20All%20UnLocked%20Printers.lua", true))()
    end
end)

ToolsTab:Section("GUN SUPPORT")

ToolsTab:Button("One Shot Shotgun", function()
    notify("Notification","Note, Just execute this for once",10)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Shariiii/Anomic-Stuff/main/OP%20shotgun%20script.lua", true))()
end)

ToolsTab:Button("Aimbot", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HankRBXHelper/Aimbot-GUI/main/%5BArsenal%5D%20GUI.lua", true))()
    
    local CoreGUI = game:GetService("CoreGui")
    
    CoreGUI.ScreenGui:WaitForChild("Menu Frame").Visible = false
    CoreGUI.ScreenGui.Frame.Visible = true
    CoreGUI.ScreenGui.Frame.Draggable = true
    CoreGUI.ScreenGui.Frame.Titel.Text = "GUI"
    CoreGUI.ScreenGui.Frame.MainFrame.Frame2:WaitForChild("Bring all").Visible = false
    CoreGUI.ScreenGui.Frame.MainFrame.Frame2:WaitForChild("God mode").Visible = false
    CoreGUI.ScreenGui.Frame.MainFrame.Frame2:WaitForChild("Esp").Visible = false
    CoreGUI.ScreenGui.Frame.MainFrame.Frame2:WaitForChild("Speed").Visible = false
    CoreGUI.ScreenGui.Frame.MainFrame.Frame2:WaitForChild("Admin").Visible = false
    
    CoreGUI.ScreenGui.Frame.MainFrame.Frame2.Aimbot.MouseButton1Click:Connect(function()
        wait(3)
        CoreGUI.ScreenGui:Destroy()
    end)
end)

ToolsTab:Section("HITBOX EXPANDER")

ToolsTab:Dropdown("Hitbox Part", {"Head", "HumanoidRootPart"}, function(v)
    _G.HitboxPart = v
end)

ToolsTab:Slider("Hitbox Size", 3, 500, function(value)
    _G.HitboxSize = value
end)

ToolsTab:Slider("Hitbox Transparency", 0, 100, function(value)
    if value < 100 then
        _G.HitboxTransparency = "0."..value
    elseif value == 100 then
        _G.HitboxTransparency = 1
    end
end)

ToolsTab:Slider("Hitbox Color", 0, 255, function(value)
    _G.HitboxColor = value
end)

ToolsTab:Toggle("Enabled Hitbox", function(t)
    _G.EnabledHitbox = t
end)

spawn(function()
    game:GetService('RunService').Stepped:connect(function()
        if _G.EnabledHitbox == true then
        pcall(function()
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
    
            for _, Player in pairs(Players:GetChildren()) do
                if Player ~= LocalPlayer then
                    local Character = Player.Character
                    HitPart = Character:FindFirstChild(_G.HitboxPart)
                    if HitPart then
                        HitPart.Size = Vector3.new(_G.HitboxSize, _G.HitboxSize, _G.HitboxSize)
                        HitPart.Transparency = _G.HitboxTransparency
                        HitPart.CanCollide = false
                        HitPart.Material = Enum.Material.SmoothPlastic 
                        HitPart.Color = Color3.fromRGB(_G.HitboxColor, _G.HitboxColor, 0)
                        end
                    end
                end
            end)
        elseif _G.EnabledHitbox == false then
            pcall(function()
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
    
            for _, Player in pairs(Players:GetChildren()) do
                if Player ~= LocalPlayer then
                    local Character = Player.Character
                    Root = Character:FindFirstChild("HumanoidRootPart")
                    Head = Character:FindFirstChild("Head")
                        Root.Size = Vector3.new(3, 3, 3)
                        Root.Transparency = 1
                        Root.CanCollide = false
                        Root.Material = Enum.Material.SmoothPlastic 
                        Root.Color = Color3.fromRGB(208, 124, 27)
                        Head.Size = Vector3.new(1.2, 1.2, 1.2)
                        Head.Transparency = 0
                        Head.CanCollide = false
                        Head.Material = Enum.Material.SmoothPlastic
                        Head.Color = Color3.fromRGB(234, 184, 146)
                    end
                end
            end)
        end
    end)
end)

-- Visuals --

VisualsTab:Section("VISUALS")

VisualsTab:Section("GUI")

VisualsTab:Toggle("Streaming Mode", function(t)
    notify("Notification","Remember when you using streaming mode other people can still see your name",15)
    local Character = game:GetService("Players").LocalPlayer.Character
    local PlayerDisplay = Character.Head.PlayerDisplay
    if t == true then
        PlayerDisplay.Enabled = false
    else
        PlayerDisplay.Enabled = true
    end
end)

VisualsTab:Toggle("Menu Bank", function(t)
    local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
    local GUI = PlayerGui.MainUIHolder.Menus.BankUI
    if t == true then
        GUI.Visible = true
    else
        GUI.Visible = false
    end
end)

VisualsTab:Toggle("Menu Paint", function(t)
    local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
    local GUI = PlayerGui.MainUIHolder.Menus.ItemRecolorGUI
    if t == true then
        GUI.Visible = true
    else
        GUI.Visible = false
    end
end)

VisualsTab:Toggle("Avatar Editor", function(t)
    local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
    local GUI = PlayerGui.AvatarEditor
    if t == true then
        GUI.Enabled = true
        GUI.WearButton.Visible = false
    else
        GUI.Enabled = false
        GUI.WearButton.Visible = true
    end
end)

VisualsTab:Section("CAMERA PART")

VisualsTab:Dropdown("View Cameras", {"Arway", "Pahrump", "Eaphis Plateau", "Eastdike", "Okby Steppe", "Airfield", "Depository", "Sheriff Station", "Clinic", "Towing Company", "Depot",}, function(v)
    local CamPart = game:GetService("Workspace").Spawns.CameraParts:WaitForChild(v)

    repeat wait()
        game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
    until game.Workspace.CurrentCamera.CameraType == Enum.CameraType.Scriptable
    game.Workspace.CurrentCamera.CFrame = CamPart.CFrame
end)

VisualsTab:Button("Reset Camera", function()
    repeat wait()
        game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    until game.Workspace.CurrentCamera.CameraType == Enum.CameraType.Custom
end)

VisualsTab:Section("VIEW PLAYER")

VisualsTab:TextBox("View Player", function(text)
    local Camera = game.Workspace.CurrentCamera
    
    Camera.CameraSubject = game.Workspace:WaitForChild(text)
end)

VisualsTab:Button("Return Player", function()
    local Camera = game.Workspace.CurrentCamera
    local player = gae:GetService("Players").LocalPlayer.Name
    
    Camera.CameraSubject = game.Workspace:WaitForChild(player)
end)

VisualsTab:Section("ESP")

VisualsTab:Button("Player ESP", function()
    _G.chams = true
    local function CreateGui(name,parent,face) -- function that creates the Chams
        local SurfaceGui = Instance.new("SurfaceGui",parent) --- Creates a SurfaceGui in the game
        SurfaceGui.Parent = parent
        SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        SurfaceGui.Face = Enum.NormalId[face]
        SurfaceGui.LightInfluence = 0
        SurfaceGui.ResetOnSpawn = false
        SurfaceGui.Name = name
        SurfaceGui.AlwaysOnTop = true
        local Frame = Instance.new("Frame",SurfaceGui)
        Frame.BackgroundColor3 = Color3.fromRGB(208, 124, 27) -- colour for the surfacgui
        Frame.Size = UDim2.new(1,0,1,0)
	Frame.Transparency = 0.8
    end
    
    game:GetService("RunService").Stepped:Connect(function(plr)
        local Players = game:GetService("Players")
        for i,v in pairs (Players:GetPlayers()) do --- gets all the players in the game and loops through them
            if v ~= Players.LocalPlayer and v.Character ~= nil and v.Character:FindFirstChild("Head") and _G.chams and v.Character.Head:FindFirstChild("cham") == nil then --- Checks to check if the player is appropiate to make a cham
                for i,v in pairs (v.Character:GetChildren()) do -- looping through every child in the character of the player
                    if v:IsA("MeshPart") or v.Name == "Head" then -- checking if the child is a body part
                        CreateGui("cham",v,"Back")
                        CreateGui("cham",v,"Front")
                        CreateGui("cham",v,"Top")
                        CreateGui("cham",v,"Bottom")
                        CreateGui("cham",v,"Right")
                        CreateGui("cham",v,"Left")
                    end
                end
            end
        end
    end)
end)

VisualsTab:Button("Printer ESP", function()
    local function CreatePrinterESP(name,parent)
    	local PrinterESP = Instance.new("BillboardGui",parent)
    	local Text = Instance.new("TextLabel",PrinterESP)
    
    	PrinterESP.Name = name
    	PrinterESP.Parent = parent
    	PrinterESP.Active = true
    	PrinterESP.AlwaysOnTop = true
    	PrinterESP.LightInfluence = 1.000
    	PrinterESP.Size = UDim2.new(0, 200, 0, 50)
    
    	Text.Name = "Text"
    	Text.Parent = PrinterESP
    	Text.Active = true
    	Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    	Text.BackgroundTransparency = 1.000
    	Text.Size = UDim2.new(0, 200, 0, 50)
    	Text.Font = Enum.Font.SourceSansSemibold
    	Text.Text = "Simple Printer"
    	Text.TextColor3 = Color3.fromRGB(208, 124, 27)
    	Text.TextSize = 20.000
    	Text.TextWrapped = true
    end
    
    for i,v in pairs (game.Workspace.Entities:GetChildren()) do 
		if v:IsA("Model") and v.Name == "Simple Printer" then
			CreatePrinterESP("PrinterESP",v)
		end
	end
end)
--[[
VisualsTab:Toggle("Xray", function(t)
    _G.XrayOnOrOff = t
    for i, descendant in pairs(wokrspace:GetDescendants()) do
        if _G.XrayOnOrOff == true then
            if not descendant:FindFirstChild("OriginalTransparency") then
                
                local originalTransparency = Instance.new("NumberValue")
                originalTransparency.Name = "OriginalTransparency"
                originalTransparency.Value = descendant.Transparency
                originalTransparency.Parent = descendant
            end
            descendant.Transparency = 0.5
        end
        else
            descendant.Transparency = descendant.OriginalTransparency.Value
    end
end)
]]
VisualsTab:Button("Full Bright", function()
    local Lighting = game:GetService("Lighting")
    Lighting.Ambient = Color3.fromRGB(255, 255, 255)
end)

-- Teleport --

TeleportTab:Section("TELEPORT")

TeleportTab:Dropdown("Teleport Places", {"Arway", "Pahrump", "Eaphis Plateau", "Eastdike", "Okby Steppe", "Airfield", "Depository", "Sheriff Station", "Clinic", "Towing Company", "Depot",}, function(v)
    local SpawnPart = game:GetService("Workspace").Spawns.SpawnLocations:WaitForChild(v).Spawn

    local Player = game:GetService("Players")
    local Character = Player.LocalPlayer.Character
    RootPart = Character:FindFirstChild("HumanoidRootPart")
    RootPart.CFrame = SpawnPart.CFrame + Vector3.new(0,5,0)
end)

-- Misc -- 

MiscTab:Section("MISC")

MiscTab:Section("SCRIPT HUB")

MiscTab:Button("Infinite Yield", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

MiscTab:Button("IY Anomic", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/HankRBXHelper/IY-Anomic/main/%5BAnomic%5D%20IY%20Commands.lua'))()
end)

MiscTab:Button("Reviz Admin", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/HankRBXHelper/Reviz-Admin/main/%5BFE%5D%20Reviz%20Admin.lua'))()
end)

MiscTab:Button("CMD X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
end)

MiscTab:Section("OTHERS")

MiscTab:Button("Anti Car Stuff", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Shariiii/Anomic-Stuff/main/Anti%20Car%20Stuff.lua", true))()
end)

-- Settings --

SettingsTab:Section("SETTINGS")

SettingsTab:TextBox("Hotkey UI", function(text)
    game:GetService("UserInputService").InputBegan:connect(
    function(key, gpe)
        if key.KeyCode == Enum.KeyCode[text] then
            print("Key pressed")
            pcall(
                function()
                    for i, v in pairs(game.CoreGui.HankHubUI:GetChildren()) do
                        v.Visible = not v.Visible
                    end
                end
            )
        end
    end
    )
end)

SettingsTab:Toggle("Transparent UI", function(t)
    if t == true then
        game.CoreGui.HankHubUI.TopBar.BackgroundTransparency = 0.8
        game.CoreGui.HankHubUI.TopBar.MainBackground.BackgroundTransparency = 0.8
        game.CoreGui.HankHubUI.TopBar.MainBackground.SideBar.BackgroundTransparency = 0.8
        
        for i, obj in pairs(game.CoreGui.HankHubUI.TopBar.MainBackground.SideBar:GetChildren()) do
            if obj:IsA("TextButton") or obj:IsA("TextLabel") then
                obj.BackgroundTransparency = 0.8
            end
        end
        for i, obj_1 in pairs(game.CoreGui.HankHubUI.TopBar.MainBackground.Container:GetChildren()) do
            for v, obj_2 in pairs(obj_1:GetChildren()) do
                if obj_2:IsA("TextButton") or obj_2:IsA("TextLabel") or obj_2:IsA("Frame") then
                    obj_2.BackgroundTransparency = 0.8
                end
            end
        end
    else
        game.CoreGui.HankHubUI.TopBar.BackgroundTransparency = 0
        game.CoreGui.HankHubUI.TopBar.MainBackground.BackgroundTransparency = 0
        game.CoreGui.HankHubUI.TopBar.MainBackground.SideBar.BackgroundTransparency = 0
        
        for i, obj in pairs(game.CoreGui.HankHubUI.TopBar.MainBackground.SideBar:GetChildren()) do
            if obj:IsA("TextButton") or obj:IsA("TextLabel") then
                obj.BackgroundTransparency = 0
            end
        end
        for i, obj_1 in pairs(game.CoreGui.HankHubUI.TopBar.MainBackground.Container:GetChildren()) do
            for v, obj_2 in pairs(obj_1:GetChildren()) do
                if obj_2:IsA("TextButton") or obj_2:IsA("TextLabel") or obj_2:IsA("Frame") then
                    obj_2.BackgroundTransparency = 0
                end
            end
        end
    end
end)

-- Credits --

CreditsTab:Section("Founder of Hank HUB : Hank#4242")

CreditsTab:Section("Co Founder of Hank HUB : Zodiac#3200")

CreditsTab:Button("Join our discord server", function() 
    Bnotify("Hank HUB","Join our discord server UwU",15,"Copy Invite","Cancel",CopyInvite,Canceled)
end)
