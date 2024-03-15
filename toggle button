-- Instances:

local function makeUI()

    local ButterToggler = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TextButton = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")

    --Properties:

    ButterToggler.Name = "ButterToggler"
    ButterToggler.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ButterToggler.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = ButterToggler
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame.BackgroundTransparency = 1.000
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0, 0, 0.5, 0)
    Frame.Size = UDim2.new(0.07, 0, 0.07, 0)
    Frame.Name = "closeframe"

    TextButton.Parent = Frame
    TextButton.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
    TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.BorderSizePixel = 0
    TextButton.Position = UDim2.new(0.1, 0, 0, 0)
    TextButton.Size = UDim2.new(0.8, 0, 0.8, 0)
    TextButton.ZIndex = 0
    TextButton.Font = Enum.Font.Gotham
    TextButton.Text = "Close"
    TextButton.TextColor3 = Color3.fromRGB(193, 193, 193)
    TextButton.TextScaled = true
    TextButton.TextSize = 14.000
    TextButton.TextWrapped = true
    TextButton.Name = "btn"

    UICorner.Parent = TextButton

    return ButterToggler
end

local function updateColors(sg)
    sg.closeframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sg.closeframe.btn.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
    sg.closeframe.btn.TextColor3 = Color3.fromRGB(193, 193, 193)
    sg.closeframe.btn.TextScaled = true
    sg.closeframe.btn.TextSize = 14.000
    sg.closeframe.btn.TextWrapped = true
    sg.closeframe.btn.Font = Enum.Font.Gotham
end

local ui
local newSG = makeUI()

local function findUI()
    for _, player in pairs(game.Players:GetPlayers()) do
        local playerGui = player:FindFirstChild("PlayerGui")
        if playerGui then
            for _, v in pairs(playerGui:GetChildren()) do
                if v:IsA"ScreenGui" and v.Name == "frosty is cute" and v:FindFirstChild("Main") and v.Main:FindFirstChildOfClass"UICorner" then
                    ui = v.Main
                end
            end
        end
    end
end

findUI()

if not ui then
    game.Players.PlayerAdded:Connect(function(player)
        player:WaitForChild("PlayerGui").ChildAdded:Connect(function(v)
            if v:IsA"ScreenGui" and v.Name == "frosty is cute" and v:FindFirstChild("Main") and v.Main:FindFirstChildOfClass"UICorner" then
                ui = v.Main
                updateColors(newSG)
            end
        end)
    end)
end

local closed = false
newSG.closeframe.btn.MouseButton1Down:Connect(function()
    local btn = newSG.closeframe.btn
    if not ui then
        spawn(function()
            btn.Text = "Butter not executed!"
            wait(1)
            btn.Text = closed and "Open" or "Close"
        end)
    else
        closed = not closed
        local text = closed and "Open" or "Close"
        ui.Visible = not closed
        btn.Text = text
    end
end)
