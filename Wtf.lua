--= [ Anti Ban & Anti Afk ] =--

spawn(function()
    while task.wait() do
		local L_225_ = {
			["AbuseReportScreenshotPercentage"] = "0",
			["AbuseReportScreenshot"] = "False",
			["DFFlagAbuseReportScreenshot"] = "False",
			["CrashPadUploadToBacktraceToBacktraceBaseUrl"] = "",
			["CrashUploadToBacktracePercentage"] = "0",
			["CrashUploadToBacktraceBlackholeToken"] = "",
			["CrashUploadToBacktraceWindowsPlayerToken"] = ""
		}
		local function L_226_func(L_227_arg0)
			L_227_arg0 = L_227_arg0:gsub("^DFInt", "")
			L_227_arg0 = L_227_arg0:gsub("^DFFlag", "")
			L_227_arg0 = L_227_arg0:gsub("FString", "")
			L_227_arg0 = L_227_arg0:gsub("FLog", "")
			L_227_arg0 = L_227_arg0:gsub("^FFlag", "")
			L_227_arg0 = L_227_arg0:gsub("^DFint", "")
			L_227_arg0 = L_227_arg0:gsub("^FInt", "")
			return L_227_arg0
		end
		if setfflag then
			task.spawn(function()
				local L_228_ = os.clock()
				for L_229_forvar0, L_230_forvar1 in next, L_225_ do
					pcall(function()
						if getfflag(L_226_func(L_229_forvar0)) then
							setfflag(L_226_func(L_229_forvar0), L_230_forvar1)
						elseif getfflag(L_229_forvar0) then
							setfflag(L_229_forvar0, L_230_forvar1)
						end
					end)
				end
			end)
		end
	end
end)

for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do 
	v:Disable()
end

if game.PlaceId == 2753915549 then
    FirstSea = true
elseif game.PlaceId == 4442272183 then
    SecondSea = true
elseif game.PlaceId == 7449423635 then
    ThirdSea = true
else
    game.Players.LocalPlayer:Kick("Script Only Support Blox Fruits")
end

--= [ Fix Lag & Destroy Sea ] =--

require(game.ReplicatedStorage.Util.CameraShaker):Stop()
game:GetService("ReplicatedStorage").Assets:FindFirstChild("SlashHit"):Destroy()
game:GetService("ReplicatedStorage").Util.Sound.Storage.Swing:Destroy()

pcall(function()
    for i, v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        end
    end
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Texture") then
            v.Texture = ""
        elseif v:IsA("BasePart") and v.Material == Enum.Material.Water then
            v.Material = Enum.Material.SmoothPlastic
        end
    end
    for _, v in pairs(r33_33arg.LocalPlayer.PlayerScripts:GetDescendants()) do
        local v641_args = {"WaterBlur","WaterEffect","WaterColorCorrection","WaterCFrame"}
        if table.find(v641_args, v.Name) then
            v:Destroy()
        end
    end
end)

--= [ Ui & Tab ] =--

local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()
WindUI:SetNotificationLower(true)
local Window = WindUI:CreateWindow({
    Title = "Drazure Hub",
    Icon = "rbxassetid://98348435879049", -- 98348435879049
    Author = "Blox Fruits - Free Script",
    Folder = "Drazure Hub",
    Size = UDim2.fromOffset(580, 350),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 185,
    HasOutline = true
})

Window:EditOpenButton({
    Title = "Open",
    Icon = "rbxassetid://98348435879049", -- 98348435879049
    CornerRadius = UDim.new(0, 10),
    StrokeThickness = 1.5,
    Color = ColorSequence.new(
        Color3.fromHex("FFFFFF"), 
        Color3.fromHex("ADD8E6")
    ),
    -- Enabled = false,
    Draggable = false
})

local Info = Window:Tab({
    Title = "Information",
    Icon = "youtube"
})

Window:Divider()

local Full_Moon = Window:Tab({
    Title = "Moon",
    Icon = "moon-star"
})

local Mirage_Island = Window:Tab({
    Title = "Mirage Island",
    Icon = "tree-palm"
})

local Rip_Indra = Window:Tab({
    Title = "Rip Indra",
    Icon = "graduation-cap"
})

local Dough_King = Window:Tab({
    Title = "Dough King",
    Icon = "donut"
})

local Darkbread = Window:Tab({
    Title = "Darkbeard",
    Icon = "gem"
})

local Sword = Window:Tab({
    Title = "Legendary Swords",
    Icon = "swords"
})

Window:SelectTab(1)

--= [ Info ] =--

Info:Section({ 
    Title = "~ Discord Info ~",
    TextXAlignment = "Center"
})

Info:Paragraph({
    Title = "Drazure Hub Discord",
    Desc = "• Join the discord server to get the latest informed.",
    Image = "rbxassetid://98348435879049",
    ImageSize = 50,
    Buttons = {
        {
            Title = "Copy discord link",
            Callback = function()
                setclipboard("https://discord.gg/5GtPTWR42n")
                WindUI:Notify({
                    Title = "Drazure Hub",
                    Content = "Copy discord server link successfully!",
                    Icon = "rbxassetid://98348435879049",
                    Duration = 3
                })
            end
        }
    }
})

Info:Section({ 
    Title = "~ Changelogs ~",
    TextXAlignment = "Center"
})

Info:Paragraph({
    Title = "13/03/2025",
    Desc = "  Add Hop Server Full Moon\n  Add Hop Server Mirage Island\n  Add Hop Server Rip Indra\n  Add Hop Server Dough King\n  Add Hop Server Darkbeard\n  Add Hop Server Legendary Swords"
})

--= [ Full Moon ] =--

Full_Moon:Section({ 
    Title = "~ Full Moon Server ~",
    TextXAlignment = "Center"
})

local Moon = Full_Moon:Paragraph({
    Title = "Moon Status - Third Sea",
    Desc = "N/A"
})

function MoonTextureId()
	if FirstSea then
		return game:GetService("Lighting").FantasySky.MoonTextureId
	elseif SecondSea then
		return game:GetService("Lighting").FantasySky.MoonTextureId
	elseif ThirdSea then
		return game:GetService("Lighting").Sky.MoonTextureId
	end
end

function CheckMoonTexture()
	moon8 = "http://www.roblox.com/asset/?id=9709150401"
	moon7 = "http://www.roblox.com/asset/?id=9709150086"
	moon6 = "http://www.roblox.com/asset/?id=9709149680"
	moon5 = "http://www.roblox.com/asset/?id=9709149431"
	moon4 = "http://www.roblox.com/asset/?id=9709149052"
	moon3 = "http://www.roblox.com/asset/?id=9709143733"
	moon2 = "http://www.roblox.com/asset/?id=9709139597"
	moon1 = "http://www.roblox.com/asset/?id=9709135895"
	bluemoon = "http://www.roblox.com/asset/?id=4303207962"
	moonreal = MoonTextureId()
	default = "No Full Moon"
	if moonreal == moon5 or moonreal == moon4 then
		if moonreal == moon5 or moonreal == bluemoon then
			default = "Full Moon"
		elseif moonreal == moon4 then
			default = "Next Night"
		end
	end
	return default
end

function ClockTime()
	return math.floor(game.Lighting.ClockTime)
end

function CheckMoon()
	local Time = game.Lighting.ClockTime
	if Time >= 18 or Time < 5 then
		GameTime = "Night"
	else
		GameTime = "Day"
	end
	if CheckMoonTexture() == "Full Moon" and Time <= 5 then
		return tostring(ClockTime() .. "h : ") .. "( Will End Moon In " .. math.floor(5 - Time) .. " Minutes )"
	elseif CheckMoonTexture() == "Full Moon" and (Time > 5 and Time < 12) then
		return tostring(ClockTime() .. "h : ") .. "( Fake Moon )"
	elseif CheckMoonTexture() == "Full Moon" and (Time > 12 and Time < 18) then
		return tostring(ClockTime() .. "h : ") .. "( Will Full Moon In " .. math.floor(18 - Time) .. " Minutes )"
	elseif CheckMoonTexture() == "Full Moon" and (Time > 18 and Time <= 24) then
		return tostring(ClockTime() .. "h : ") .. "( Will End Moon In " .. math.floor(24 + 6 - Time) .. " Minutes )"
	end
	if CheckMoonTexture() == "Next Night" and Time < 12 then
		return tostring(ClockTime() .. "h : ") .. "( Will Full Moon In " .. math.floor(18 - Time) .. " Minutes )"
	elseif CheckMoonTexture() == "Next Night" and Time > 12 then
		return tostring(ClockTime() .. "h : ") .. "( Will Full Moon In " .. math.floor(18 + 12 - Time) .. " Minutes )"
	end
	if CheckMoonTexture() == "No Full Moon" then
		return tostring(ClockTime() .. "h")
	end
end

spawn(function()
    while task.wait() do
        Moon:SetDesc(CheckMoonTexture() .. " | " .. CheckMoon())
    end
end)

getgenv().FullMoon = function()
    local url = "http://thor.pylex.software:9425/JobId/fullmoon"
    local response = game:GetService("HttpService"):JSONDecode(game:HttpGet(url))
    if response and response.JobId and #response.JobId > 0 then
        for jobId, _ in pairs(response.JobId[1]) do
            game:GetService("TeleportService"):TeleportToPlaceInstance(7449423635, jobId, game.Players.LocalPlayer)
            return
        end
    else
        WindUI:Notify({
            Title = "Drazure Hub",
            Content = "Server not found or api is down!",
            Icon = "rbxassetid://98348435879049",
            Duration = 3
        })
    end
end

Full_Moon:Button({
   Title = "Join Server Full Moon",
    -- Desc = "",
   Callback = function()
        FullMoon()
   end
})

Full_Moon:Toggle({
    Title = "Auto Join Server Full Moon",
    -- Desc = "",
    Value = false,
    Callback = function(V)
        _G.JoinFullMoon = V
    end
})

spawn(function()
    while wait(1) do
        if _G.JoinFullMoon then
            FullMoon()
        end
    end
end)

Full_Moon:Section({ 
    Title = "~ Trials ~",
    TextXAlignment = "Center"
})

Full_Moon:Toggle({
    Title = "Auto Kill Player When Completing Trials",
    -- Desc = "",
    Value = false,
    Callback = function(V)
        _G.JoinFullMoon = V
    end
})

--= [ Mirage Island ] =--

Mirage_Island:Section({ 
    Title = "~ Full Moon Server ~",
    TextXAlignment = "Center"
})

local Mirage = Mirage_Island:Paragraph({
    Title = "Mirage Island Status - Third Sea",
    Desc = "N/A"
})

function CheckMirage()
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
        return "Mirage Island: 🟢"
    else
        return "Mirage Island: 🔴"
    end
end

spawn(function()
    while task.wait() do
        Mirage:SetDesc(CheckMirage())
    end
end)

getgenv().MirageIsland = function()
    local url = "http://thor.pylex.software:9425/JobId/mirage"
    local response = game:GetService("HttpService"):JSONDecode(game:HttpGet(url))
    if response and response.JobId and #response.JobId > 0 then
        for jobId, _ in pairs(response.JobId[1]) do
            game:GetService("TeleportService"):TeleportToPlaceInstance(7449423635, jobId, game.Players.LocalPlayer)
            return
        end
    else
        WindUI:Notify({
            Title = "Drazure Hub",
            Content = "Server not found or api is down!",
            Icon = "rbxassetid://98348435879049",
            Duration = 3
        })
    end
end

Mirage_Island:Button({
   Title = "Join Server Mirage Island",
    -- Desc = "",
   Callback = function()
        MirageIsland()
   end
})
