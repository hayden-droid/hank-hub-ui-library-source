local Blacklisted = {

	["ROBLOX"] = true,
	["Builderman"] = true,
	["KRYJIOT123"] = true, -- he just want revange bcs get killed many times
	["NOOB"] = true

}

local Whitelisted = {
	
	["UnboxingSimFarmer"] = true,
	["WantAballoon_123"] = true,
	["micearedumb"] = true,
	["T3_BAGXx"] = true,
	["250x50k"] = true,
	["AliefAthallah"] = true,
	["surviviadev"] = true, -- bruhhill#8549
	["ScriptixPro741"] = true, -- bruhhill#8549
	["S3VS3V"] = true, -- !. K#0804
	["CallMeAkri"] = false, -- banned lol (!. K#0804)
	["Shirahoshi121"] = true,
	["TROLLITOPROXD"] = true, -- brokenfase#1010
	["ImArsenalProPlayerPC"] = true, -- brokenfase#1010
	["565656899"] = true, -- 565656899#9410
	["llllllllllllllllllat"] = true, -- Officer6aby#0413
	["Akmal_DI"] = true,
	["QylMum"] = true, -- BigMaX#0001
	["BigMaX_74"] = true, -- BigMaX#0001
	["vapidhunter"] = true,-- Vosial#1522
	["guest666her_e"] = true, -- ariskr#6259
	["EvilHanks"] = true,
	["Q_xX8KHH30LNB95VREXx"] = true,
	["NOOB"] = true

}

local function notify(name,text)
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
        wait(10)
        tweenservice:Create(Background,TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = NotifyFirstPosition}):Play()
        wait(2)
        Background.Visible = false
    end)
end

spawn(function()
    pcall(function()
        if Whitelisted[game.Players.LocalPlayer.Name] then
            notify("Welcome to Hank HUB","You have been whitelisted from Hank HUB")
            loadstring(game:HttpGet("https://raw.githubusercontent.com/HankRBXHelper/Hank-HUB-UI-Library/main/%5BHH%5D%20Hank%20HUB%20Game%20Checker.lua", true))()
        else
            loadstring(game:HttpGet("https://raw.githubusercontent.com/HankRBXHelper/Hank-HUB-UI-Library/main/%5BHH%5D%20Hank%20HUB%20Login%20(new).lua", true))()
        end
    end)
end)

spawn(function()
    pcall(function()
        if Blacklisted[game.Players.LocalPlayer.Name] then
            game.Players.LocalPlayer:Kick("You have been blacklisted from Hank HUB")
        end
    end)
end)

spawn(function()
	local https = game:GetService("HttpService"):JSONEncode({
	['content'] =  "Has logged into Hank HUB Main Menu | Player Username: "..player.Name.." | Player ID: "..player.UserId.." | Player AccountAge: "..player.AccountAge
	})
	syn.request({
	Url = "https://discord.com/api/webhooks/851500702869225493/m2ycPpe7zWyj0rJj6TzhP6VmuhM77dJTFqblA-bj4QeaxkEkbxhqFnvC9yEDMYavDsd4",
	Method = "POST",
	Headers = {["Content-Type"] = "application/json"},
	Body = https,
	})
end)
