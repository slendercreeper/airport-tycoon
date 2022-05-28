-- Anti afk
local vu = game:GetService("VirtualUser") 
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-- Finding Tycoon
local myTycoon
for i,v in pairs(game:GetService("Workspace")["Zednov's Tycoon Kit"].Tycoons:GetChildren()) do
    if v.Owner.Value == game.Players.LocalPlayer then
        myTycoon = v
    end
end

-- Autocollect
coroutine.wrap(function()
    _G.autoCollect = true
    while _G.autoCollect do
    wait()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, myTycoon.Essentials.Giver, 0)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, myTycoon.Essentials.Giver, 1)
    end
end)()

-- Autoget Buttons
coroutine.wrap(function()
    _G.autoupgrade = true
    while _G.autoupgrade do
        wait()
        for i,v in pairs(myTycoon.Buttons:GetChildren()) do
            if v:FindFirstChild("CashBillboardGui") and v:FindFirstChild("Gamepass") == nil then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Head, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Head, 1)
            end
        end
    end
end)()
