local Request = http_request or syn and syn.request or request or nil
local CurrentDiscordInvite = isfile('Invite.butterhub') and readfile('Invite.butterhub') or nil
if Request then
    local Invite
    local r = Request(
    {
        ['Method'] = 'GET',
        ['Headers'] = {
            ['discordLinkRequest'] = "true"
        },
        ['Url'] = 'https://api.butterhub.cloud/v3/discord/raw'
    })
    if r.StatusCode ~= 200 or not r.Successful then
        Invite = "butterhub"
    else
        Invite = r.Body
    end
    if not CurrentDiscordInvite or CurrentDiscordInvite ~= Invite then
        Request(
            {
                ['Method'] = 'POST',
                ['Headers'] = {
                    ["origin"] = 'https://discord.com',
                    ["Content-Type"] = "application/json"
                },
                ['Url'] = 'http://127.0.0.1:6463/rpc?v=1',
                ['Body'] = game:GetService('HttpService'):JSONEncode({cmd="INVITE_BROWSER",args={code=Invite},nonce=game:GetService('HttpService'):GenerateGUID(false):lower()})
            }    
        )
        writefile('Invite.butterhub',Invite)
    end
end

if game.PlaceId == 13822889 then -- 🌳 Lumber Tycoon 2
loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/Butter/main/lt2'))("")
elseif game.PlaceId == 6897226634 then -- Timber! 🌲
loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/Butter/main/timber-obfuscated.lua'))("")
elseif game.PlaceId == 537413528 then -- Build A Boat For Treasure
loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/Butter/main/btbft.txt'))("")
elseif game.PlaceId == 10514822281 then -- Case Opening Simulator 2
loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/Butter/main/Case%20Opening%20Simulator%202-obfuscated.lua'))("")
end
