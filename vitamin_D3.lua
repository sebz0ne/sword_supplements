local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local UIS = game:GetService("UserInputService")

local ReachEnabled = false
local ReachRadius = 0

local UI = Material.Load({
	Title = "Vitamin D3",
	Style = 0,
	SizeX = 350,
	SizeY = 200,
	Theme = "Dark",
})

UIS.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.Insert then
        game.CoreGui["sword supplements"].Enabled = not game.CoreGui["sword supplements"].Enabled
    end
end)


local MainPage = UI.New({
	Title = "Reach"
})

local Label = MainPage.Label({
    Text = "forged in fire by sebz0ne"
})

local Enabled = MainPage.Toggle({
    Text = "Reach Enabled",
    Callback = function(Value)
        ReachEnabled = Value
    end,
})

local Radius = MainPage.TextField({
    Text = "Reach Radius",
    Callback = function(Value)
        ReachRadius = tonumber(Value)
    end,
})


game:GetService"RunService".Stepped:Connect(function()
    if not ReachEnabled then return end
    pcall(function()
      Sword = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle
        for i,v in pairs(game.Players:GetPlayers()) do 
            if v ~= game.Players.LocalPlayer and v.Character:FindFirstChild("Left Arm") then
             if (game.Players.LocalPlayer.Character.Torso.Position - v.Character.Torso.Position).Magnitude <= ReachRadius then
                   v.Character['Left Arm']:BreakJoints()
                   v.Character['Left Arm'].Transparency = 1
                   v.Character['Left Arm'].CanCollide = false
                   v.Character['Left Arm'].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(1,0,-3.5)
                   v.Character['Left Leg']:BreakJoints()
                   v.Character['Left Leg'].Transparency = 1
                   v.Character['Left Leg'].CanCollide = false
                   v.Character['Left Leg'].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(1,0,-3.5)
               end
           end
       end
    end)
end)

