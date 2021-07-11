local TweenService = game:GetService("TweenService")
local UserInput = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local GetMouse = game.Players.LocalPlayer:GetMouse()

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

local function TweenObj(obj, properties, duration)
    TweenService:Create(obj,TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), properties):Play()
end

local function Ripple(obj) -- Dark Hub
    spawn(
        function()
            local Mouse = game.Players.LocalPlayer:GetMouse()
            local Circle = Instance.new("ImageLabel")
            Circle.Name = "Circle"
            Circle.Parent = obj
            Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Circle.BackgroundTransparency = 1.000
            Circle.ZIndex = 10
            Circle.Image = "rbxassetid://266543268"
            Circle.ImageColor3 = Color3.fromRGB(211, 211, 211)
            Circle.ImageTransparency = 0.6
            local NewX, NewY = Mouse.X - Circle.AbsolutePosition.X, Mouse.Y - Circle.AbsolutePosition.Y
            Circle.Position = UDim2.new(0, NewX, 0, NewY)
            local Size = 0
            if obj.AbsoluteSize.X > obj.AbsoluteSize.Y then
                Size = obj.AbsoluteSize.X * 1
            elseif obj.AbsoluteSize.X < obj.AbsoluteSize.Y then
                Size = obj.AbsoluteSize.Y * 1
            elseif obj.AbsoluteSize.X == obj.AbsoluteSize.Y then
                Size = obj.AbsoluteSize.X * 1
            end
            Circle:TweenSizeAndPosition(
                UDim2.new(0, Size, 0, Size),
                UDim2.new(0.5, -Size / 2, 0.5, -Size / 2),
                "Out",
                "Quad",
                0.2,
                false
            )
            for i = 1, 15 do
                Circle.ImageTransparency = Circle.ImageTransparency + 0.05
                wait()
            end
            Circle:Destroy()
        end
    )
end

local function DraggingEnabled(frame, parent)

    parent = parent or frame

    -- stolen from kavo loolololololololololol
    local dragging = false
    local dragInput, mousePos, framePos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = parent.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInput.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)
end

local HankLib = {}

function HankLib:Window(text)
    text = text or "hank HUB"
    local SelectedTab
    local FalseHank = "HankHubUI"
    local FirstTab = true
    local toggled = false
    for i,v in pairs(game.CoreGui:GetChildren()) do
        if v:IsA("ScreenGui") and v.Name == FalseHank then
            v:Destroy()
        end
    end
    local HankHubUI = Instance.new("ScreenGui")
    local TopBar = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local MainBackground = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local SideBar = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")
    local UIListLayout = Instance.new("UIListLayout")
    local MainTitle = Instance.new("TextLabel")
    local UICorner_4 = Instance.new("UICorner")
    local Container = Instance.new("Folder")
    local TopTitle = Instance.new("TextLabel")
    local TopButton = Instance.new("TextButton")

    HankHubUI.Name = "HankHubUI"
    HankHubUI.Parent = game:GetService("CoreGui")
    HankHubUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    HankHubUI.ResetOnSpawn = false

    TopBar.Name = "TopBar"
    TopBar.Parent = HankHubUI
    TopBar.Active = true
    TopBar.BackgroundColor3 = Color3.fromRGB(208, 124, 27)
    TopBar.BorderColor3 = Color3.fromRGB(25, 25, 25)
    TopBar.BorderSizePixel = 0
    TopBar.Draggable = true
    TopBar.Position = UDim2.new(0.280012637, 0, 0.180987641, 0)
    TopBar.Selectable = true
    TopBar.Size = UDim2.new(0, 480, 0, 30)
    TopBar.ZIndex = 10

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = TopBar

    MainBackground.Name = "MainBackground"
    MainBackground.Parent = TopBar
    MainBackground.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainBackground.BorderColor3 = Color3.fromRGB(25, 25, 25)
    MainBackground.BorderSizePixel = 0
    MainBackground.ClipsDescendants = true
    MainBackground.Position = UDim2.new(-0.00178161263, 0, 1.00152564, 0)
    MainBackground.Size = UDim2.new(0, 480, 0, 300)
    MainBackground.ZIndex = 0
    
    DraggingEnabled(MainBackground, TopBar)

    UICorner_2.CornerRadius = UDim.new(0, 5)
    UICorner_2.Parent = MainBackground

    SideBar.Name = "SideBar"
    SideBar.Parent = MainBackground
    SideBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    SideBar.Size = UDim2.new(0, 140, 0, 300)

    UICorner_3.CornerRadius = UDim.new(0, 5)
    UICorner_3.Parent = SideBar

    UIListLayout.Parent = SideBar
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)

    MainTitle.Name = "MainTitle"
    MainTitle.Parent = SideBar
    MainTitle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainTitle.Position = UDim2.new(0.0357142873, 0, 0, 0)
    MainTitle.Size = UDim2.new(0, 130, 0, 30)
    MainTitle.ZIndex = 2
    MainTitle.Font = Enum.Font.SourceSansBold
    MainTitle.Text = text
    MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainTitle.TextSize = 20.000
    MainTitle.TextWrapped = true

    UICorner_4.CornerRadius = UDim.new(0, 5)
    UICorner_4.Parent = MainTitle

    Container.Name = "Container"
    Container.Parent = MainBackground

    TopTitle.Name = "TopTitle"
    TopTitle.Parent = TopBar
    TopTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopTitle.BackgroundTransparency = 1.000
    TopTitle.Position = UDim2.new(0.375, 0, 0, 0)
    TopTitle.Size = UDim2.new(0, 130, 0, 30)
    TopTitle.Font = Enum.Font.SourceSansBold
    TopTitle.Text = "Hank HUB - V1.4"
    TopTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    TopTitle.TextSize = 20.000
    TopTitle.TextWrapped = true

    TopButton.Name = "TopButton"
    TopButton.Parent = TopBar
    TopButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopButton.BackgroundTransparency = 1.000
    TopButton.Position = UDim2.new(0.935416639, 0, 0, 0)
    TopButton.Rotation = 90.000
    TopButton.Size = UDim2.new(0, 30, 0, 30)
    TopButton.Font = Enum.Font.SourceSansBold
    TopButton.Text = ">"
    TopButton.TextColor3 = Color3.fromRGB(25, 25, 25)
    TopButton.TextSize = 20.000
    TopButton.TextWrapped = true

    TopButton.MouseButton1Click:Connect(function()
        if toggled == false then
            toggled = true
            print("Hank HUB UI Closed")
            TweenObj(TopButton,{Rotation = 270},0.4)
            TweenObj(MainBackground,{Size = UDim2.new(0, 480,0, 1)},0.4)
        elseif toggled == true then
            toggled = false
            print("Hank HUB UI Opened")
            TweenObj(TopButton,{Rotation = 90},0.4)
            TweenObj(MainBackground,{Size = UDim2.new(0, 480,0, 300)},0.4)
        end
    end)


    local TabsLib = {}

    function TabsLib:Tab(text, icon, offset)
        text = text or "Tab"
        local TabButton = Instance.new("TextButton")
        local UICorner_5 = Instance.new("UICorner")
        local Icon = Instance.new("ImageButton")
        local Tab = Instance.new("ScrollingFrame")
        local UIListLayout_2 = Instance.new("UIListLayout")

        TabButton.Name = text.." TabButton"
        TabButton.Parent = SideBar
        TabButton.BackgroundColor3 = Color3.fromRGB(208, 124, 27)
        TabButton.LayoutOrder = 1
        TabButton.Size = UDim2.new(0, 130, 0, 30)
        TabButton.ZIndex = 2
        TabButton.Text = text
        TabButton.ClipsDescendants = true
        TabButton.Font = Enum.Font.SourceSansSemibold
        TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabButton.TextSize = 14.000
        TabButton.TextWrapped = true

        UICorner_5.CornerRadius = UDim.new(0, 5)
        UICorner_5.Parent = TabButton

        Icon.Name = "Icon"
        Icon.Parent = TabButton
        Icon.BackgroundTransparency = 1.000
        Icon.LayoutOrder = 8
        Icon.Position = UDim2.new(0.0413793102, 0, 0.0666666701, 0)
        Icon.Size = UDim2.new(0, 25, 0, 25)
        Icon.ZIndex = 2
        Icon.Image = icon
        Icon.ImageColor3 = Color3.fromRGB(25, 25, 25)
        Icon.ImageRectOffset = offset
        Icon.ImageRectSize = Vector2.new(36, 36)

        Tab.Name = "Tab"
        Tab.Parent = Container
        Tab.Active = true
        Tab.Visible = false
        Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundTransparency = 1.000
        Tab.Position = UDim2.new(0.291666657, 0, 0, 0)
        Tab.Size = UDim2.new(0, 340, 0, 300)
        Tab.CanvasSize = UDim2.new(0, 0, 100, 0)
        Tab.ScrollBarThickness = 0

        UIListLayout_2.Parent = Tab
        UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.Padding = UDim.new(0, 8)

        if FirstTab == true then
            FirstTab = false
            Tab.Visible = false
        end

        TabButton.MouseButton1Click:Connect(function()
            TweenObj(TabButton,{BackgroundColor3 = Color3.fromRGB(35,35,35)},0.4)
            Ripple(TabButton)
            for i,v in next, Container:GetChildren() do
                if v.Name == "Tab" then
                v.Visible = false
               end
            end
            Tab.Visible = true
            wait(0.5)
            TweenObj(TabButton,{BackgroundColor3 = Color3.fromRGB(208, 124, 27)},0.4)
        end)
        
        TabButton.MouseEnter:Connect(function()
            TweenObj(TabButton,{BackgroundColor3 = Color3.fromRGB(35,35,35)},0.4)
        end)

        TabButton.MouseLeave:Connect(function()
            TweenObj(TabButton,{BackgroundColor3 = Color3.fromRGB(208, 124, 27)},0.4)
        end)
        
        local SectionLib = {}
        
        function SectionLib:Section(text)
            text = text or "Section"
            local Section = Instance.new("TextLabel")
            local UICorner_6 = Instance.new("UICorner")
            
            Section.Name = text.." Section"
            Section.Parent = Tab
            Section.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            Section.Position = UDim2.new(0.0294117648, 0, 0, 0)
            Section.Size = UDim2.new(0, 320, 0, 35)
            Section.ZIndex = 2
            Section.Font = Enum.Font.SourceSansBold
            Section.Text = text
            Section.TextColor3 = Color3.fromRGB(255, 255, 255)
            Section.TextSize = 20.000
            Section.TextWrapped = true

            UICorner_6.CornerRadius = UDim.new(0, 5)
            UICorner_6.Parent = Section

            function SectionLib:Button(text, callback)
                text = text or "Button"
                local callback = callback or function() end

                local Button = Instance.new("TextButton")
                local UICorner_7 = Instance.new("UICorner")

                Button.Name = text.." Button"
                Button.Parent = Tab
                Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                Button.Size = UDim2.new(0, 300, 0, 30)
                Button.Text = text
                Button.ClipsDescendants = true
                Button.Font = Enum.Font.SourceSansSemibold
                Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                Button.TextSize = 14.000
                Button.TextWrapped = true

                UICorner_7.CornerRadius = UDim.new(0, 5)
                UICorner_7.Parent = Button

                Button.MouseButton1Click:Connect(function()
                    callback()
                    Ripple(Button)
                    TweenObj(Button,{BackgroundColor3 = Color3.fromRGB(208, 124, 27)},0.4)
                    wait(0.5)
                    TweenObj(Button,{BackgroundColor3 = Color3.fromRGB(35,35,35)},0.4)
                end)
                
                Button.MouseEnter:Connect(function()
                    TweenObj(Button,{BackgroundColor3 = Color3.fromRGB(25,25,25)},0.4)
                end)
                
                Button.MouseLeave:Connect(function()
                    TweenObj(Button,{BackgroundColor3 = Color3.fromRGB(35,35,35)},0.4)
                end)
            end
            
            function SectionLib:Toggle(text, callback)
                text = text or "Toggle"
                local callback = callback or function() end
                local Istoggled = false
                
                local Toggle_Back = Instance.new("Frame")
                local UICorner_8 = Instance.new("UICorner")
                local Toggle_Text = Instance.new("TextLabel")
                local Toggle_Button = Instance.new("TextButton")
                local UICorner_9 = Instance.new("UICorner")
                
                Toggle_Back.Name = text.." Toggle_Back"
                Toggle_Back.Parent = Tab
                Toggle_Back.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                Toggle_Back.Size = UDim2.new(0, 300, 0, 30)

                UICorner_8.CornerRadius = UDim.new(0, 5)
                UICorner_8.Parent = Toggle_Back

                Toggle_Text.Name = "Toggle_Text"
                Toggle_Text.Parent = Toggle_Back
                Toggle_Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Toggle_Text.BackgroundTransparency = 1.000
                Toggle_Text.Size = UDim2.new(0, 140, 0, 30)
                Toggle_Text.Position = UDim2.new(0.033, 0,0, 0)
                Toggle_Text.Font = Enum.Font.SourceSansSemibold
                Toggle_Text.TextXAlignment = Enum.TextXAlignment.Left
                Toggle_Text.Text = text
                Toggle_Text.TextColor3 = Color3.fromRGB(255, 255, 255)
                Toggle_Text.TextSize = 14.000
                Toggle_Text.TextWrapped = true

                Toggle_Button.Name = "Toggle_Button"
                Toggle_Button.Parent = Toggle_Back
                Toggle_Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                Toggle_Button.Position = UDim2.new(0.899999976, 0, 0.13333334, 0)
                Toggle_Button.Size = UDim2.new(0, 20, 0, 20)
                Toggle_Button.Font = Enum.Font.SourceSansSemibold
                Toggle_Button.Text = ""
                Toggle_Button.TextColor3 = Color3.fromRGB(25, 25, 25)
                Toggle_Button.TextSize = 14.000
                Toggle_Button.TextWrapped = true

                UICorner_9.CornerRadius = UDim.new(0, 5)
                UICorner_9.Parent = Toggle_Button
                
                Toggle_Button.MouseButton1Click:Connect(function()
                    if Istoggled == false then
                        TweenObj(Toggle_Button,{BackgroundColor3 = Color3.fromRGB(208, 124, 27)},0.4)
                    else
                        TweenObj(Toggle_Button,{BackgroundColor3 = Color3.fromRGB(25, 25, 25)},0.4)
                    end
                    Istoggled = not Istoggled
                    pcall(callback, Istoggled)
                end)
            end
            
            function SectionLib:Dropdown(text, list, callback)
                text = text or "Dropdown"
                local callback = callback or function() end
                local IsDrop = false
                local BodySize = 0
                local DropYSize = 0
                list = list or {}
                
                local Dropdown_Back = Instance.new("Frame")
                local UICorner_10 = Instance.new("UICorner")
                local Dropdown_Text = Instance.new("TextLabel")
                local Dropdown_Button = Instance.new("TextButton")
                local UICorner_11 = Instance.new("UICorner")
                local Dropdown_In = Instance.new("Frame")
                local UICorner_12 = Instance.new("UICorner")
                local UIListLayout_3 = Instance.new("UIListLayout")
                
                local function Resize(value)
                    BodySize = BodySize + value
                    Dropdown_In.Size = UDim2.new(0, 300, 0, BodySize)
                end
                
                Dropdown_Back.Name = text.." Dropdown_Back"
                Dropdown_Back.Parent = Tab
                Dropdown_Back.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                Dropdown_Back.Size = UDim2.new(0, 300, 0, 30)

                UICorner_10.CornerRadius = UDim.new(0, 5)
                UICorner_10.Parent = Dropdown_Back

                Dropdown_Text.Name = "Dropdown_Text"
                Dropdown_Text.Parent = Dropdown_Back
                Dropdown_Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Dropdown_Text.BackgroundTransparency = 1.000
                Dropdown_Text.Size = UDim2.new(0, 140, 0, 30)
                Dropdown_Text.Position = UDim2.new(0.033, 0,0, 0)
                Dropdown_Text.Font = Enum.Font.SourceSansSemibold
                Dropdown_Text.TextXAlignment = Enum.TextXAlignment.Left
                Dropdown_Text.Text = text
                Dropdown_Text.TextColor3 = Color3.fromRGB(255, 255, 255)
                Dropdown_Text.TextSize = 14.000
                Dropdown_Text.TextWrapped = true

                Dropdown_Button.Name = "Dropdown_Button"
                Dropdown_Button.Parent = Dropdown_Back
                Dropdown_Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                Dropdown_Button.BackgroundTransparency = 1.000
                Dropdown_Button.Position = UDim2.new(0.899999976, 0, 0.13333334, 0)
                Dropdown_Button.Rotation = 90.000
                Dropdown_Button.Size = UDim2.new(0, 20, 0, 20)
                Dropdown_Button.Font = Enum.Font.SourceSansSemibold
                Dropdown_Button.Rotation = 270
                Dropdown_Button.Text = ">"
                Dropdown_Button.TextColor3 = Color3.fromRGB(208, 124, 27)
                Dropdown_Button.TextSize = 14.000
                Dropdown_Button.TextWrapped = true

                UICorner_11.CornerRadius = UDim.new(0, 5)
                UICorner_11.Parent = Dropdown_Button

                Dropdown_In.Name = text.." Dropdown_In"
                Dropdown_In.Parent = Tab
                Dropdown_In.ClipsDescendants = true
                Dropdown_In.ZIndex = 3
                Dropdown_In.Visible = false
                Dropdown_In.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                Dropdown_In.Position = UDim2.new(0, 0, 1.16666663, 0)
                Dropdown_In.Size = UDim2.new(0, 300, 0, 120)

                UICorner_12.CornerRadius = UDim.new(0, 5)
                UICorner_12.Parent = Dropdown_In

                UIListLayout_3.Parent = Dropdown_In
                UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center
                UIListLayout_3.Padding = UDim.new(0, 5)
                
                Dropdown_Button.MouseButton1Down:Connect(function()
                    if IsDrop == true then
                        TweenObj(Dropdown_Button,{Rotation = 90},0.4)
                        TweenObj(Dropdown_In,{Size = UDim2.new(0, 300,0, 0)},0.4)
                        wait(0.5)
                        Dropdown_In.Visible = false
                    else
                        TweenObj(Dropdown_Button,{Rotation = 270},0.4)
                        TweenObj(Dropdown_In,{Size = UDim2.new(0, 300,0, DropYSize)},0.4)
                        wait(0.5)
                        Dropdown_In.Visible = true
                    end
                    IsDrop = not IsDrop
                end)
                
                for i,v in next, list do
                    local Button_Option = Instance.new("TextButton")
                    local UICorner_13 = Instance.new("UICorner")
                    
                    Button_Option.Name = v.."Button"
                    Button_Option.Parent = Dropdown_In
                    Button_Option.BackgroundColor3 = Color3.fromRGB(208, 124, 27)
                    Button_Option.Position = UDim2.new(0, 0, 0.375, 0)
                    Button_Option.Size = UDim2.new(0, 280, 0, 30)
                    Button_Option.Text = " "..v
                    Button_Option.ZIndex = 4
                    Button_Option.Font = Enum.Font.SourceSansSemibold
                    Button_Option.ClipsDescendants = true
                    Button_Option.TextColor3 = Color3.fromRGB(0, 0, 0)
                    Button_Option.TextSize = 14.000
                    Button_Option.TextWrapped = true
                    DropYSize = DropYSize + 45

                    UICorner_13.CornerRadius = UDim.new(0, 5)
                    UICorner_13.Parent = Button_Option
                    
                    Button_Option.MouseButton1Click:Connect(function()
                        callback(v)
                        Ripple(Button_Option)
                        TweenObj(Button_Option,{BackgroundColor3 = Color3.fromRGB(35,35,35)},0.4)
                        wait(0.5)
                        TweenObj(Button_Option,{BackgroundColor3 = Color3.fromRGB(208, 124, 27)},0.4)
                    end)
                    
                    Button_Option.MouseEnter:Connect(function()
                        TweenObj(Button_Option,{BackgroundColor3 = Color3.fromRGB(208, 124, 27)},0.4)
                    end)
                    
                    Button_Option.MouseLeave:Connect(function()
                        TweenObj(Button_Option,{BackgroundColor3 = Color3.fromRGB(208, 124, 27)},0.4)
                    end)
                end
            end

            function SectionLib:TextBox(text, callback)
                callback = callback or function() end
                
                local TextBox_Back = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local TextBox_Text = Instance.new("TextLabel")
                local TextBox = Instance.new("TextBox")
                local UICorner_2 = Instance.new("UICorner")

                TextBox_Back.Name = text.." TextBox_Back"
                TextBox_Back.Parent = Tab
                TextBox_Back.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                TextBox_Back.Size = UDim2.new(0, 300, 0, 30)

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = TextBox_Back

                TextBox_Text.Name = "TextBox_Text"
                TextBox_Text.Parent = TextBox_Back
                TextBox_Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextBox_Text.BackgroundTransparency = 1.000
                TextBox_Text.Size = UDim2.new(0, 140, 0, 30)
                TextBox_Text.Position = UDim2.new(0.033, 0,0, 0)
                TextBox_Text.Font = Enum.Font.SourceSansSemibold
                TextBox_Text.TextXAlignment = Enum.TextXAlignment.Left
                TextBox_Text.Text = text
                TextBox_Text.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextBox_Text.TextSize = 14.000
                TextBox_Text.TextWrapped = true
                
                TextBox.Name = "TextBox"
                TextBox.Parent = TextBox_Back
                TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                TextBox.Position = UDim2.new(0.629999995, 0, 0.166666672, 0)
                TextBox.Size = UDim2.new(0, 100, 0, 20)
                TextBox.Font = Enum.Font.SourceSans
                TextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
                TextBox.PlaceholderText = "Insert"
                TextBox.Text = ""
                TextBox.TextColor3 = Color3.fromRGB(208, 124, 27)
                TextBox.TextSize = 14.000
                TextBox.TextWrapped = true

                UICorner_2.CornerRadius = UDim.new(0, 5)
                UICorner_2.Parent = TextBox
                
                TextBox.FocusLost:Connect(function()
                    callback(TextBox.Text)
                end)
            end

            function SectionLib:Slider(text, minvalue, maxvalue, callback)
                text = text or "Slider"
                minvalue = minvalue or 0
                maxvalue = maxvalue or 500
                callback = callback or function() end
                local Value;
                
                local Slider_Back = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local Slider_Text = Instance.new("TextLabel")
                local Slider_Button = Instance.new("TextButton")
                local UICorner_2 = Instance.new("UICorner")
                local Slider_Bar = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local Slider_Value = Instance.new("TextLabel")

                Slider_Back.Name = text.." Slider_Back"
                Slider_Back.Parent = Tab
                Slider_Back.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                Slider_Back.Size = UDim2.new(0, 300, 0, 30)

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Slider_Back

                Slider_Text.Name = "Slider_Text"
                Slider_Text.Parent = Slider_Back
                Slider_Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Slider_Text.BackgroundTransparency = 1.000
                Slider_Text.Size = UDim2.new(0, 140, 0, 30)
                Slider_Text.Position = UDim2.new(0.033, 0,0, 0)
                Slider_Text.Font = Enum.Font.SourceSansSemibold
                Slider_Text.TextXAlignment = Enum.TextXAlignment.Left
                Slider_Text.Text = text
                Slider_Text.TextColor3 = Color3.fromRGB(255, 255, 255)
                Slider_Text.TextSize = 14.000
                Slider_Text.TextWrapped = true

                Slider_Button.Name = "Slider_Button"
                Slider_Button.Parent = Slider_Back
                Slider_Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                Slider_Button.Position = UDim2.new(0.502850533, 0, 0.333333343, 0)
                Slider_Button.Size = UDim2.new(0, 147, 0, 10)
                Slider_Button.ZIndex = 2
                Slider_Button.Font = Enum.Font.SourceSans
                Slider_Button.Text = ""
                Slider_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                Slider_Button.TextSize = 14.000
                Slider_Button.TextWrapped = true

                UICorner_2.CornerRadius = UDim.new(0, 5)
                UICorner_2.Parent = Slider_Button

                Slider_Bar.Name = "Slider_Bar"
                Slider_Bar.Parent = Slider_Button
                Slider_Bar.BackgroundColor3 = Color3.fromRGB(208, 124, 27)
                Slider_Bar.Size = UDim2.new(0, 0, 0, 10)
                Slider_Bar.ZIndex = 3

                UICorner_3.CornerRadius = UDim.new(0, 5)
                UICorner_3.Parent = Slider_Bar

                Slider_Value.Name = "Slider_Value"
                Slider_Value.Parent = Slider_Bar
                Slider_Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Slider_Value.BackgroundTransparency = 1.000
                Slider_Value.Size = UDim2.new(0, 147, 0, 10)
                Slider_Value.ZIndex = 4
                Slider_Value.Font = Enum.Font.SourceSansSemibold
                Slider_Value.Text = ""
                Slider_Value.TextColor3 = Color3.fromRGB(255, 255, 255)
                Slider_Value.TextSize = 14.000
                Slider_Value.TextWrapped = true
                
                Slider_Button.MouseButton1Down:Connect(function()
                    Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 147) * Slider_Bar.AbsoluteSize.X) + tonumber(minvalue)) or 0
                    pcall(function()
                        callback(Value)
                    end)
                    Slider_Bar.Size = UDim2.new(0, math.clamp(GetMouse.X - Slider_Bar.AbsolutePosition.X, 0, 147), 0, 10)
                    moveconnection = GetMouse.Move:Connect(function()
                        Slider_Value.Text = Value
                        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 147) * Slider_Bar.AbsoluteSize.X) + tonumber(minvalue))
                        pcall(function()
                            callback(Value)
                        end)
                            Slider_Bar.Size = UDim2.new(0, math.clamp(GetMouse.X - Slider_Bar.AbsolutePosition.X, 0, 147), 0, 10)
                    end)
                    releaseconnection = UserInput.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 147) * Slider_Bar.AbsoluteSize.X) + tonumber(minvalue))
                            pcall(function()
                                callback(Value)
                            end)
                            Slider_Bar.Size = UDim2.new(0, math.clamp(GetMouse.X - Slider_Bar.AbsolutePosition.X, 0, 147), 0, 10)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
            end
        end
        return SectionLib;
    end
    return TabsLib;
end
return HankLib;
