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

--= [ Tween ] =--

if game.PlaceId == 2753915549 then
    LocationNear = {
        Vector3.new(-7894.6201171875, 5545.49169921875, -380.246346191406),
        Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
        Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
        Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
    }
elseif game.PlaceId == 4442272183 then
    LocationNear = {
        Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
        Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
        Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
        Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
    }
elseif game.PlaceId == 7449423635 then
    LocationNear = {
        Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
        Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
        Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
        Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
        Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
        Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)
    }
end

function GetPortal(check2)
    local check3 = check2.Position
    local aM, aN = Vector3.new(0, 0, 0), math.huge
    for _, aL in pairs(LocationNear) do
        if (aL-check3).Magnitude < aN and aM ~= aL then
            aM, aN = aL, (aL-check3).Magnitude
        end
    end
    return aM
end

function RequestEntrance(check1)
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack({"requestEntrance", check1}))
    if game.Players.LocalPlayer.Character:FindFirstChild("PartTele") then
        game.Players.LocalPlayer.Character.PartTele.CFrame = WaitHRP(lp).CFrame
    end
    wait(0.01)
end

function CalcDistance(I, II)
    if not II then
        II = game.Players.LocalPlayer.Character.PrimaryPart.CFrame
    end
    return (Vector3.new(I.X, 0, I.Z)-Vector3.new(II.X, 0, II.Z)).Magnitude
end

function Tween(Pos)
    if game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("Sit") and game.Players.LocalPlayer.Character.Humanoid.Sit == true then
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end
	local Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	local Speed = _G.TweenSpeed or 350
	local Tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear), {CFrame = Pos})
    if CalcDistance(GetPortal(Pos), Pos) < CalcDistance(Pos) and CalcDistance(GetPortal(Pos)) > 800 then
        return RequestEntrance(GetPortal(Pos))
    end
	if Distance <= 300 then
	    Tween:Cancel()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
	end
	Tween:Play()
end

function StopTween(Pos)
	if not Pos then
	    Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
	    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
			game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
		end
	end
end

spawn(function()
	while task.wait() do
		pcall(function()
			if _G.KillPlayerTrials then
				if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
					local Bv = Instance.new("BodyVelocity")
					Bv.Name = "BodyClip"
					Bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart;
					Bv.MaxForce = Vector3.new(10000, 10000, 10000)
					Bv.Velocity = Vector3.new(0, 0, 0)
				end
				for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
				end
			end
		end)
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
    Title = "Full Moon",
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

Window:Divider()

local Other = Window:Tab({
    Title = "Other",
    Icon = "settings"
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
    Title = "Full Moon Status - Third Sea",
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
	default = "No Full Moon 🌑"
	if moonreal == moon5 or moonreal == moon4 then
		if moonreal == moon5 or moonreal == bluemoon then
			default = "Full Moon 🌕"
		elseif moonreal == moon4 then
			default = "Next Night Full Moon 🌖"
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
	if CheckMoonTexture() == "Full Moon 🌕" and Time <= 5 then
		return tostring(ClockTime() .. "h : ") .. "( Will End Moon In " .. math.floor(5 - Time) .. " Minutes )"
	elseif CheckMoonTexture() == "Full Moon 🌕" and (Time > 5 and Time < 12) then
		return tostring(ClockTime() .. "h : ") .. "( Fake Moon )"
	elseif CheckMoonTexture() == "Full Moon 🌕" and (Time > 12 and Time < 18) then
		return tostring(ClockTime() .. "h : ") .. "( Will Full Moon In " .. math.floor(18 - Time) .. " Minutes )"
	elseif CheckMoonTexture() == "Full Moon 🌕" and (Time > 18 and Time <= 24) then
		return tostring(ClockTime() .. "h : ") .. "( Will End Moon In " .. math.floor(24 + 6 - Time) .. " Minutes )"
	end
	if CheckMoonTexture() == "Next Night Full Moon 🌖" and Time < 12 then
		return tostring(ClockTime() .. "h : ") .. "( Will Full Moon In " .. math.floor(18 - Time) .. " Minutes )"
	elseif CheckMoonTexture() == "Next Night" and Time > 12 then
		return tostring(ClockTime() .. "h : ") .. "( Will Full Moon In " .. math.floor(18 + 12 - Time) .. " Minutes )"
	end
	if CheckMoonTexture() == "No Full Moon 🌑" then
		return tostring(ClockTime() .. "h")
	end
end

spawn(function()
    while task.wait() do
        Moon:SetDesc("Moon: " .. CheckMoonTexture() .. " | " .. CheckMoon())
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
   Title = "Join Server With Full Moon",
    -- Desc = "",
   Callback = function()
        FullMoon()
   end
})

Full_Moon:Toggle({
    Title = "Auto Join Server With Full Moon",
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

Other:Dropdown({
    Title = "Select Area",
    -- Desc = "",
    Multi = false,
    Value = "",
    AllowNone = true,
    Values = {"Melee","Sword","Blox Fruit"},
    Callback = function(V)
        _G.SelectArea = V
    end
})

Full_Moon:Toggle({
    Title = "Teleport To Area",
    -- Desc = "",
    Value = false,
    Callback = function(V)
        _G.TeleportArea= V
    end
})

spawn(function()
    while wait() do
        pcall(function()
            if _G.TeleportArea then
                if _G.SelectArea == "Temple of Time" then
                    TweenTemple()
                elseif _G.SelectArea == "Pull Lever" then
                    repeat wait()
	                	if (Map.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
		                	TweenTemple()
	                	end
                	until (Map.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000;
                	Tween(game:GetService("Workspace").Map["Temple of Time"].Lever.Part.CFrame)
                	for i, v in pairs(game:GetService("Workspace").Map["Temple of Time"].Lever:GetDescendants()) do
                		if v.Name == "ProximityPrompt" then
                			fireproximityprompt(v)
                		end
                	end
                elseif _G.SelectArea == "Race Door" then
                    TweentoCurrentRaceDoor()
                elseif _G.SelectArea == "Ancient Clock" then
                    for i, v in next, workspace:GetDescendants() do
		                if v.Name == "Prompt" then
			                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
		                end
	                end
                end
            end
        end)
    end
end)

local Map = CFrame.new(28734.3945, 14888.2324, - 109.071777, - 0.650207579, 4.1780531e-08, - 0.759756625, 1.97876595e-08, 1, 3.80575109e-08, 0.759756625, 9.71147784e-09, - 0.650207579)

function TweenTemple()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
end

local A = {}
for i, v in pairs(game.Workspace:GetDescendants()) do
	if string.find(v.Name, 'Corridor') then
		A[v.Name] = v.Door.Door.RightDoor.Union.CFrame
	end
end

function TweentoCurrentRaceDoor()
	a = A[game.Players.LocalPlayer.Data.Race.Value .. 'Corridor']
	if (Map.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
		repeat
			wait()
			if (Map.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
				TweenTemple()
			end
		until (Map.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000
		Tween(a)
	elseif (Map.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
		Tween(a)
	end
end

Full_Moon:Toggle({
    Title = "Auto Kill Player When Completing Trials",
    -- Desc = "",
    Value = false,
    Callback = function(V)
        _G.KillPlayerTrials = V
        StopTween(_G.KillPlayerTrials)
    end
})

spawn(function()
	while wait() do
		if _G.AutoObs then
			if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
				game:GetService("VirtualUser"):SetKeyDown("0x65")
				wait(2)
				game:GetService("VirtualUser"):SetKeyUp("0x65")
			end
		end
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if _G.KillPlayerTrials then
				for i, v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
					if v.Name ~= game.Players.LocalPlayer.Name and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible then
						if v.Humanoid.Health > 0 then
							repeat task.wait()
							    _G.AutoObs = true
								EquipWeapon(_G.SelectWeapon)
								NameTarget = v.Name
								Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 3, 3))
								v.HumanoidRootPart.CanCollide = false
								v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
							until not _G.KillPlayerTrials or not v.Parent or v.Humanoid.Health <= 0
						end
					end
				end
			end
		end)
	end
end)

--= [ Mirage Island ] =--

Mirage_Island:Section({ 
    Title = "~ Mirage Island Server ~",
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
   Title = "Join Server With Mirage Island",
    -- Desc = "",
   Callback = function()
        MirageIsland()
   end
})

MirageIsland:Toggle({
    Title = "Auto Join Server With Mirgae Island",
    -- Desc = "",
    Value = false,
    Callback = function(V)
        _G.JoinMirageIsland = V
    end
})

spawn(function()
    while wait(1) do
        if _G.JoinMirageIsland then
            MirageIsland()
        end
    end
end)

--= [ Other ] =--

Other:Section({ 
    Title = "~ Attack~",
    TextXAlignment = "Center"
})

Other:Dropdown({
    Title = "Select Weapon",
    -- Desc = "",
    Multi = false,
    Value = "",
    AllowNone = false,
    Values = {"Melee","Sword","Blox Fruit"},
    Callback = function(V)
        _G.SelectWeapon = V
    end
})

function EquipWeapon(L_121_arg0)
	if game.Players.LocalPlayer.Backpack:FindFirstChild(L_121_arg0) then
		Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(L_121_arg0)
		wait()
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
	end
end

Other:Toggle({
    Title = "Fast Attack",
    -- Desc = "",
    Value = false,
    Callback = function(V)
        _G.FastAttack = V
    end
})

function AttackNoCoolDown()
    local character = game.Players.LocalPlayer.Character
    if not character then return end
    local equippedWeapon = nil
    for _, item in ipairs(character:GetChildren()) do
        if item:IsA("Tool") then
            equippedWeapon = item
            break
        end
    end
    if not equippedWeapon then return end
    local function IsEntityAlive(entity)
        return entity and entity:FindFirstChild("Humanoid") and entity.Humanoid.Health > 0
    end
    local function GetEnemiesInRange(range)
        local enemies = game:GetService("Workspace").Enemies:GetChildren()
        local targets = {}
        local playerPos = character:GetPivot().Position
        for _, enemy in ipairs(enemies) do
            local primaryPart = enemy:FindFirstChild("HumanoidRootPart")
            if primaryPart and IsEntityAlive(enemy) and (primaryPart.Position - playerPos).Magnitude <= range then
                table.insert(targets, enemy)
            end
        end
        return targets
    end
    if equippedWeapon:FindFirstChild("LeftClickRemote") then
        local attackCount = 1  
        local enemiesInRange = GetEnemiesInRange(60)
        for _, enemy in ipairs(enemiesInRange) do
            local direction = (enemy.HumanoidRootPart.Position - character:GetPivot().Position).Unit
            pcall(function()
                equippedWeapon.LeftClickRemote:FireServer(direction, attackCount)
            end)
            attackCount = attackCount + 1
            if attackCount > 1000000000 then attackCount = 1 end
        end
    else
        local targets = {}
        local enemies = game:GetService("Workspace").Enemies:GetChildren()
        local playerPos = character:GetPivot().Position
        local mainTarget = nil
        for _, enemy in ipairs(enemies) do
            if not enemy:GetAttribute("IsBoat") and IsEntityAlive(enemy) then
                local head = enemy:FindFirstChild("Head")
                if head and (playerPos - head.Position).Magnitude <= 60 then
                    table.insert(targets, { enemy, head })
                    mainTarget = head
                end
            end
        end
        if not mainTarget then return end
        pcall(function()
            local storage = game:GetService("ReplicatedStorage")
            local attackEvent = storage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
            local hitEvent = storage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")
            if #targets > 0 then
                attackEvent:FireServer(0.000000001)
                hitEvent:FireServer(mainTarget, targets)
            else
                task.wait(0.000000001)
            end
        end)
    end
end

spawn(function()
    while task.wait() do
        if _G.FastAttack then
            AttackNoCoolDown()
        end
    end
end)

Other:Section({ 
    Title = "~ Teleport Sea~",
    TextXAlignment = "Center"
})

Other:Dropdown({
    Title = "Select Sea",
    -- Desc = "",
    Multi = false,
    Value = "",
    AllowNone = true,
    Values = {"First Sea","Second Sea","Third Sea"},
    Callback = function(V)
        _G.SelectSea = V
    end
})

Other:Button({
   Title = "Teleport To Sea",
    -- Desc = "",
   Callback = function()
       if _G.SelectSea == "First Sea" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
        elseif _G.SelectSea == "Second Sea" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
        elseif _G.SelectSea == "Third Sea" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
        end
   end
})

Other:Section({ 
    Title = "~ Tween~",
    TextXAlignment = "Center"
})

Other:Slider({
    Title = "Tween Speed",
    -- Desc = "",
    Step = 1,
    Value = {
        Min = 150,
        Max = 400,
        Default = 350
    },
    Callback = function(V)
        _G.TweenSpeed = V
    end
})
