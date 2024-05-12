--Discord Auto Invite
--[[
pcall(function()
    local Request = syn and syn.request or request
    Request({
        Url = "http://127.0.0.1:6463/rpc?v=1",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json",
            ["Origin"] = "https://discord.com"
        },
        Body = game.HttpService:JSONEncode({
            cmd = "INVITE_BROWSER",
            args = {
                code = "ButterHub"
            },
            nonce = game.HttpService:GenerateGUID(false)
        }),
    })
end)
]]

if game.PlaceId == 13822889 then -- 🌳 Lumber Tycoon 2
loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/Butter/main/lt2'))("")
elseif game.PlaceId == 6897226634 then -- Timber! 🌲
loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/Butter/main/timber-obfuscated.lua'))("")
elseif game.PlaceId == 537413528 then -- Build A Boat For Treasure
loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/Butter/main/btbft.txt'))("")
elseif game.PlaceId == 10514822281 then -- Case Opening Simulator 2
loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/Butter/main/Case%20Opening%20Simulator%202-obfuscated.lua'))("")
end
