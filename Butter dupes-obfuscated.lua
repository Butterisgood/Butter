--#region UI stuff
local BlekLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/bleklib/main/library.lua"))()

local win = BlekLib:Create({Name = "Butter",})

local FakeLoad = win:Tab('FakeLoad')
local Donate = win:Tab('Donate')
local clone = win:Tab('Clone')
local credits = win:Tab('Credits')
local charactertab = win:Tab('')

--#endregion

--#region code
local plr = game:GetService("Players").LocalPlayer
local noide = game:GetService("ReplicatedStorage").Notices.SendUserNotice
local SelectPurchase = game:GetService("Players").LocalPlayer.PlayerGui.PropertyPurchasingGUI.SelectPurchase
local Newdupe = {
    ["Parent"] = workspace,
    ["Name"] = plr.Name,
    ["userId"] = plr.userId
}






function fakeload(Slot)
    game:GetService("ReplicatedStorage").LoadSaveRequests.RequestLoad:InvokeServer(Slot, Newdupe)
end

function unsave()
    game:GetService("ReplicatedStorage").LoadSaveRequests.RequestLoad:InvokeServer(7, plr)
end

function freeland()
    game:GetService("ReplicatedStorage").PropertyPurchasing.SetPropertyPurchasingValue:InvokeServer(true)

    for i,v in next, game:GetService("Workspace").Properties:GetChildren() do
        if v:FindFirstChild("Owner") and v.Owner.Value == nil then
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientPurchasedProperty:FireServer(v,v.OriginSquare.Position)
        end
    end
    game:GetService("ReplicatedStorage").PropertyPurchasing.SetPropertyPurchasingValue:InvokeServer(false)
end

--#endregion

--#region output ui
FakeLoad:Slider('Slot', 1, 1, 6, function(val)
slotval = val 
end)

FakeLoad:Button('FakeLoad', function()
fakeload(slotval)
end)

FakeLoad:Button('UnSave', function()
    unsave()
end)

FakeLoad:Button('Fast Deload', function()
game:GetService("ReplicatedStorage").LoadSaveRequests.RequestSave:InvokeServer(game.Players.LocalPlayer.CurrentSaveSlot.Value, game:GetService("Players").LocalPlayer, nil, true)
end)



Donate:Slider('Slot', 1, 1, 6, function(val)
    Dslotval = val 
end)

Donate:Button('Donate Base', function()
    noide:Fire("Donate Started! Slot" .. Dslotval)
task.spawn(function()
    fakeload(Dslotval)
end)
    repeat wait() until SelectPurchase.Visible == true
    repeat wait() until SelectPurchase.Visible == false
    wait(1.5)
    freeland()
    repeat wait() until not game.Players.LocalPlayer.CurrentlySavingOrLoading.Value == true
    unsave()
    noide:Fire("Done!")
end)








clone:Button('SLOT 1 WILL CLONE TO SLOT 2', function()

end)

clone:Slider('Slot1', 1, 1, 6, function(val)
send = val 
end)
clone:Slider('Slot2', 1, 1, 6, function(val)
geter = val 
end)

clone:Button('Clone', function()
noide:Fire("Clone started slot "..send .." To slot " ..geter)
fakeload(send)
repeat wait() until not game.Players.LocalPlayer.CurrentlySavingOrLoading.Value == true
noide:Fire("Done! slot "..send .." cloned to " ..geter)
game:GetService("ReplicatedStorage").LoadSaveRequests.RequestSave:InvokeServer(geter, plr)

end)


credits:Button('Coders/Owners', function()

end)

credits:Button('Kissbox and gamer_89', function()

end)

credits:Button('Method found by', function()

end)

credits:Button('Ancestor and dalaisonthebone', function()

end)

--#endregion
