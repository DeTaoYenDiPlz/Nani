--= [ Anti Ban & Anti Afk ] =--

local function TeleportToServer(JobId)
    local Succ, Err = pcall(function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, JobId, game.Players.LocalPlayer)
    end)
    if not Succ then print(Err) end
end

local CheckAdmin = {"rip_indra","wenlocktoad","toilamvidamme","Uzoth","Azarth","Hingoi","Axiore","Death_King","Polkster","Lunoven","TheGreateAced","rip_fud","drip_mama","oofficialnoobie","Daigrock","layandikit12","red_game43","arlthmetic",}
spawn(function()
    while wait() do
        for _, User in ipairs(game.Players:GetPlayers()) do
            if table.find(CheckAdmin, User.Name) then
                local Serv = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
                if Serv and Serv.data and #Serv.data > 0 then
                    TeleportToServer(Serv.data[1].id)
                end
            end
        end
    end
end)

for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do 
	v:Disable()
end

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

--= [ Check World & Not Support Game ] =--

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

--= [ Noclip & Move Fly & Pos ] =--

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            if _G.NoClip then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    local NoClip = Instance.new("BodyVelocity")
                    NoClip.Name = "BodyVelocity"
                    NoClip.P = 9000
                    NoClip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    NoClip.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    local MoveDirection = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").MoveDirection
                    MoveDirection = Vector3.new(MoveDirection.X, 0, MoveDirection.Z)
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity").Velocity = MoveDirection * 60
                end
                for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            else
                if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
                end
            end
        end)
    end)
end)

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

function topos(Pos)
    if typeof(Pos) == "Vector3" then
        Pos = CFrame.new(Pos)
    elseif typeof(Pos) ~= "CFrame" then
        return
    end
    if game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("Sit") and game.Players.LocalPlayer.Character.Humanoid.Sit == true then
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end
	local Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	local Speed = _G.TweenSpeed or 350
	local Tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear), {CFrame = Pos})
	if _G.PortalTeleport then
        if CalcDistance(GetPortal(Pos), Pos) < CalcDistance(Pos) and CalcDistance(GetPortal(Pos)) > 800 then
            return RequestEntrance(GetPortal(Pos))
        end
    end
    if _G.BypassTeleport and Distance >= 3000 then
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
	end
    _G.NoClip = true
	if Distance <= 300 then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
	else
    	Tween:Play()
	end
end

function StopTween(Pos)
	if not Pos then
		wait()
		topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
		_G.NoClip = false
		wait()
		topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
		_G.NoClip = false
	end
end

Type = 1
spawn(function()
    while task.wait() do
        Type = 1
        wait(0.8)
        Type = 2
        wait(0.8)
        Type = 3
        wait(0.8)
        Type = 4
        wait(0.8)
    end
end)

spawn(function()
    while task.wait() do
        if Type == 1 then
            PosFarm = CFrame.new(0,30,-20)
            PosSeaBeast = CFrame.new(0,400,-60)
            PosTerrorshark = CFrame.new(0,60,-30)
        elseif Type == 2 then
            PosFarm = CFrame.new(20,30,0)
            PosSeaBeast = CFrame.new(60,400,0)
            PosTerrorshark = CFrame.new(30,60,0)
        elseif Type == 3 then
            PosFarm = CFrame.new(0,30,20)
            PosSeaBeast = CFrame.new(0,400,60)
            PosTerrorshark = CFrame.new(0,60,30)
        elseif Type == 4 then
            PosFarm = CFrame.new(-20,30,0)
            PosSeaBeast = CFrame.new(-60,400,0)
            PosTerrorshark = CFrame.new(-30,60,0)
        end
    end
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/DeTaoYenDiPlz/Nani/refs/heads/main/IdkApi.lua"))()

--= [ Ui & Tab ] =--

local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()
WindUI:SetNotificationLower(true)
local Window = WindUI:CreateWindow({
    Title = "Manazure Hub - Blox Fruits",
    Icon = "tree-palm",
    Author = "Developer by ObieVN - discord.gg/manazurehub",
    Folder = "Manazure Hub",
    Size = UDim2.fromOffset(550, 350),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 140,
    HasOutline = true
})

Window:EditOpenButton({
    Title = "Open",
    Icon = "tree-palm",
    CornerRadius = UDim.new(0, 10),
    StrokeThickness = 1.5,
    Color = ColorSequence.new(
        Color3.fromHex("FFFFFF"), 
        Color3.fromHex("ADD8E6")
    )
})

local Setting = Window:Tab({
    Title = "Setting",
    Icon = "settings"
})

local Status = Window:Tab({
    Title = "Status & Server",
    Icon = "server"
})

local Farming = Window:Tab({
    Title = "Farming",
    Icon = "sword"
})

Window:SelectTab(1)

--= [ Tab Setting ] =--

Setting:Section({ 
    Title = "~ Setting Farming ~",
    TextXAlignment = "Center"
})

Setting:Dropdown({
    Title = "Select Weapon",
    -- Desc = "",
    Multi = false,
    Value = "Melee",
    AllowNone = false,
    Values = {"Melee","Sword","Blox Fruit"},
    Callback = function(V)
        _G.SelectWeapon = V
    end
})

function UnEquipWeapon(Weapon)
    if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
        _G.NotAutoEquip = true
        wait(0.5)
        game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
        wait(0.1)
        _G.NotAutoEquip = false
    end
end

function EquipWeapon(Weapon)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(Weapon) then
        local Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(Weapon)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
    end
end

Setting:Toggle({
    Title = "Fast Attack",
    -- Desc = "",
    Value = true,
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

Setting:Toggle({
    Title = "Auto Click",
    -- Desc = "",
    Value = false,
    Callback = function(V)
        _G.AutoClick = V
    end
})

spawn(function()
	while wait() do
		if _G.AutoClick then
			game:GetService("VirtualUser"):CaptureController()
			game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 1, 0, 1))
		end
	end
end)

Setting:Dropdown({
    Title = "Select Range Bring Mob",
    -- Desc = "",
    Multi = false,
    Value = "Slightly Far [ 300m ]",
    AllowNone = false,
    Values = {"Very Close [ 250m ]","Near The [ 275m ]","Slightly Far [ 300m ]","Distant [ 325m ]","Really Far [ 350m ]"},
    Callback = function(V)
        _G.RangeBring = V
        if _G.RangeBring == "Very Close [ 250m ]" then
            BringRange = 250
        elseif _G.RangeBring == "Near The [ 275m ]" then
            BringRange = 275
        elseif _G.RangeBring == "Slightly Far [ 300m ]" then
            BringRange = 300
        elseif _G.RangeBring == "Distant [ 325m ]" then
            BringRange = 325
        elseif _G.RangeBring == "Really Far [ 350m ]" then
            BringRange = 350
        end
    end
})

Setting:Toggle({
    Title = "Bring Mob",
    -- Desc = "",
    Value = true,
    Callback = function(V)
        _G.BringMob = V
    end
})

spawn(function()
	while task.wait() do
		if setscriptable then
			setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
		end
		if sethiddenproperty then
			sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
		end
	end
end)

function BringMob()
   for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if _G.FarmLevel or _G.FruitMastery or _G.GunMastery or _G.FarmAllMelee or _G.FarmAllSword and BringLevel then
            CheckLevelQuest()
            if (v.Name == Monster) and (v.HumanoidRootPart.Position - PosFarm.Position).Magnitude <= BringRange then
                v.HumanoidRootPart.CFrame = PosFarm
                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                v.Humanoid:ChangeState(11)
                v.Humanoid.JumpPower = 0
                v.Humanoid.WalkSpeed = 0
                v.HumanoidRootPart.CanCollide = false
                v.Head.CanCollide = false
                if v.Humanoid:FindFirstChild("Animator") then
                    v.Humanoid.Animator:Destroy()
                end
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            end
        end
        if BringNear then
            if not string.find(v.Name, "Boss") and (v.HumanoidRootPart.Position - PosNear.Position).Magnitude <= BringRange then
                v.HumanoidRootPart.CFrame = PosNear
                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                v.Humanoid:ChangeState(11)
                v.Humanoid.JumpPower = 0
                v.Humanoid.WalkSpeed = 0
                v.HumanoidRootPart.CanCollide = false
                v.Head.CanCollide = false
                if v.Humanoid:FindFirstChild("Animator") then
                    v.Humanoid.Animator:Destroy()
                end
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            end
        end
        if _G.FarmMaterial and BringMaterial then
            CheckMaterial()
            if (v.Name == MaterialMob) and (v.HumanoidRootPart.Position - MaterialPos.Position).Magnitude <= BringRange then
                v.HumanoidRootPart.CFrame = PosMaterial
                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                v.Humanoid:ChangeState(11)
                v.Humanoid.JumpPower = 0
                v.Humanoid.WalkSpeed = 0
                v.HumanoidRootPart.CanCollide = false
                v.Head.CanCollide = false
                if v.Humanoid:FindFirstChild("Animator") then
                    v.Humanoid.Animator:Destroy()
                end
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            end
        end
        if _G.FarmMob and BringMob then
            if (v.Name == _G.SelectMob) and (v.HumanoidRootPart.Position - PosMonFarm.Position).Magnitude <= BringRange then
                v.HumanoidRootPart.CFrame = PosMob
                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                v.Humanoid:ChangeState(11)
                v.Humanoid.JumpPower = 0
                v.Humanoid.WalkSpeed = 0
                v.HumanoidRootPart.CanCollide = false
                v.Head.CanCollide = false
                if v.Humanoid:FindFirstChild("Animator") then
                    v.Humanoid.Animator:Destroy()
                end
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            end
        end
    end
end

spawn(function()
    while wait() do
        if _G.BringMob then
            pcall(function()
                BringMob()
            end)
        end
    end
end)

Setting:Section({ 
    Title = "~ Setting Tween ~",
    TextXAlignment = "Center"
})

Setting:Slider({
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

Setting:Toggle({
    Title = "Portal Teleport",
    -- Desc = "",
    Value = true,
    Callback = function(V)
        _G.PortalTeleport = V
    end
})

Setting:Toggle({
    Title = "Bypass Teleport",
    -- Desc = "",
    Value = false,
    Callback = function(V)
        _G.BypassTeleport = V
    end
})

Setting:Button({
    Title = "Stop Tween",
    Callback = function()
        _G.NoClip = false
    end
})

Setting:Section({ 
    Title = "~ Setting Graphic & Reduce Lag ~",
    TextXAlignment = "Center"
})

Setting:Toggle({
    Title = "White Screen",
    -- Desc = "",
    Value = false,
    Callback = function(V)
        _G.WhiteScreen = V
		if _G.WhiteScreen == true then
   	     game:GetService("RunService"):Set3dRenderingEnabled(false)
	    elseif _G.WhiteScreen == false then
 	       game:GetService("RunService"):Set3dRenderingEnabled(true)
	    end
    end
})

Setting:Toggle({
    Title = "Hiden Notifications Text",
    -- Desc = "",
    Value = false,
    Callback = function(V)
        _G.DisabledNotifications = V
		if _G.DisabledNotifications == true then
   	    game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false
	    elseif _G.DisabledNotifications == false then
 	       game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true
	    end
    end
})

Setting:Toggle({
    Title = "Hiden Damage Counter",
    -- Desc = "",
    Value = true,
    Callback = function(V)
        _G.DisabledDamage = V
		if _G.DisabledDamage == true then
   	     game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
	    elseif _G.DisabledDamage == false then
 	       game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = true
	    end
    end
})

Setting:Button({
    Title = "Remove Fog",
    -- Desc = "",
    Callback = function()
        local v382 = game:GetService("Lighting")
        if v382:FindFirstChild("BaseAtmosphere") then
            v382.BaseAtmosphere:Destroy()
        end
        if v382:FindFirstChild("SeaTerrorCC") then
            v382.SeaTerrorCC:Destroy()
        end
        if v382:FindFirstChild("LightingLayers") then
            if v382.LightingLayers:FindFirstChild("Atmosphere") then
                v382.LightingLayers.Atmosphere:Destroy()
            end
            wait()
            if v382.LightingLayers:FindFirstChild("DarkFog") then
                v382.LightingLayers.DarkFog:Destroy()
            end
        end
        v382.FogEnd = 100000
    end
})

Setting:Button({
   Title = "Remove Lava",
    -- Desc = "",
   Callback = function()
        for i,v in pairs(game.Workspace:GetDescendants()) do
    		if v.Name == "Lava" then
	    		v:Destroy()
    		end
    	end
    	for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
    		if v.Name == "Lava" then
    			v:Destroy()
        	end
        end
   end
})

Setting:Button({
   Title = "Fps Booster",
    -- Desc = "",
   Callback = function()
        FpsBooster()
   end
})

function FpsBooster()
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    sethiddenproperty(l,"Technology",2)
    sethiddenproperty(t,"Decoration",false)
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end

Setting:Section({ 
    Title = "~ Other ~",
    TextXAlignment = "Center"
})

_G.DelayHopServer = 3
Setting:Slider({
    Title = "Time Hop Server",
    -- Desc = "",
    Step = 1,
    Value = {
        Min = 1,
        Max = 30,
        Default = 3
    },
    Callback = function(V)
        _G.DelayHopServer = V
    end
})

Setting:Toggle({
    Title = "Auto Rejoin When Disconnect",
    -- Desc = "",
    Value = true,
    Callback = function(V)
        _G.AutoRejoin = V
    end
})

function AutoRejoin()
    getgenv().Rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
		if child.Name == "ErrorPrompt" and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
			game:GetService("TeleportService"):Teleport(game.PlaceId)
		end
	end)
end

spawn(function()
	while wait() do
		if _G.AutoRejoin then
			AutoRejoin()
		end
	end
end)

--= [ Status & Server ] =--

Status:Section({ 
    Title = "~ Status ~",
    TextXAlignment = "Center"
})

local Time = Status:Paragraph({
    Title = "Time Online In Server",
    Desc = "None"
})

spawn(function()
	while task.wait() do
		pcall(function()
			local A = game.Workspace.DistributedGameTime
			local B = A % 60
			local C = math.floor(A / 60 % 60)
			local D = math.floor(A / 3600)
			local E = string.format("%.0f Hour | %.0f Minute | %.0f Second", D, C, B)
			Time:SetDesc(E)
		end)
	end
end)

local Moon = Status:Paragraph({
    Title = "Moon Status",
    Desc = "None"
})

function MoonTextureId()
    if FirstSea then
        return game:GetService("Lighting").Sky.MoonTextureId
    elseif SecondSea then
        return game:GetService("Lighting").Sky.MoonTextureId
    elseif ThirdSea then
        return game:GetService("Lighting").Sky.MoonTextureId
    end
end

function CheckMoon()
    moon8 = "http://www.roblox.com/asset/?id=9709150401"
    moon7 = "http://www.roblox.com/asset/?id=9709150086"
    moon6 = "http://www.roblox.com/asset/?id=9709149680"
    moon5 = "http://www.roblox.com/asset/?id=9709149431"
    moon4 = "http://www.roblox.com/asset/?id=9709149052"
    moon3 = "http://www.roblox.com/asset/?id=9709143733"
    moon2 = "http://www.roblox.com/asset/?id=9709139597"
    moon1 = "http://www.roblox.com/asset/?id=9709135895"
    moonreal = MoonTextureId()
    cofullmoonkothangbeo = "Bad Moon"
    if moonreal == moon5 or moonreal == moon4 then
        if moonreal == moon5 then
            cofullmoonkothangbeo = "Full Moon"
        elseif moonreal == moon4 then
            cofullmoonkothangbeo = "Next Night"
        end
    end
    return cofullmoonkothangbeo
end

function function6()
    return math.floor(game.Lighting.ClockTime)
end

function getServerTime()
    RealTime = tostring(math.floor(game.Lighting.ClockTime * 100) / 100)
    RealTime = tostring(game.Lighting.ClockTime)
    RealTimeTable = RealTime:split(".")
    Minute, Second = RealTimeTable[1], tonumber(0 + tonumber(RealTimeTable[2] / 100)) * 60
    return Minute, Second
end

function function8()
    local c = game.Lighting
    local ao = c.ClockTime
    if CheckMoon() == "Full Moon" and ao <= 5 then
        return tostring(function6()) .. " ( Will End Moon In " .. math.floor(5 - ao) .. " Minutes )"
    elseif CheckMoon() == "Full Moon" and (ao > 5 and ao < 12) then
        return tostring(function6()) .. " ( Fake Moon )"
    elseif CheckMoon() == "Full Moon" and (ao > 12 and ao < 18) then
        return tostring(function6()) .. " ( Will Full Moon In " .. math.floor(18 - ao) .. " Minutes )"
    elseif CheckMoon() == "Full Moon" and (ao > 18 and ao <= 24) then
        return tostring(function6()) .. " ( Will End Moon In " .. math.floor(24 + 6 - ao) .. " Minutes )"
    end
    if CheckMoon() == "Next Night" and ao < 12 then
        return tostring(function6()) .. " ( Will Full Moon In " .. math.floor(18 - ao) .. " Minutes )"
    elseif CheckMoon() == "Next Night" and ao > 12 then
        return tostring(function6()) .. " ( Will Full Moon In " .. math.floor(18 + 12 - ao) .. " Minutes )"
    end
    return tostring(function6())
end

spawn(function()
    while task.wait() do
        Moon:SetDesc(CheckMoon() .. " | " .. function8())
    end
end)

Status:Section({ 
    Title = "~ Server ~",
    TextXAlignment = "Center"
})

local JobID = Status:Input({
    Title = "Input Job-Id",
    -- Desc = "",
    Default = "",
    Placeholder = "Enter Job Id Here",
    Callback = function(V)
        _G.JobId = V
    end
})

Status:Toggle({
    Title = "Spam Join Job-Id Server",
    -- Desc = "",
    Value = false,
    Callback = function(V)
        _G.SpamJoin = V
    end
})

spawn(function()
	while wait(1) do
		if _G.SpamJoin then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.JobId, game.Players.LocalPlayer)
		end
	end
end)

Status:Button({
   Title = "Join Job-Id Server",
    -- Desc = "",
   Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.JobId, game.Players.LocalPlayer)
   end
})

Status:Button({
   Title = "Copy Job-Id Server",
    -- Desc = "",
   Callback = function()
        setclipboard(tostring(game.JobId))
   end
})

Status:Button({
   Title = "Rejoin Server",
    -- Desc = "",
   Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
   end
})

Status:Button({
   Title = "Hop Server",
    -- Desc = "",
   Callback = function()
        Hop()
   end
})

function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end        
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end        
        local num = 0
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)            
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait(0.1)
                    pcall(function()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(1)
                    break
                end
            end
        end
    end
    function Teleport() 
        while true do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    local v14 = require(game:GetService("ReplicatedStorage").Notification)
    v14.new("<Color=Red>Manazure Hub: Wait " .. tostring(_G.DelayHopServer) .. "s Hop Server<Color=/>"):Display()
    wait(_G.DelayHopServer)
    v14.new("<Color=Red>Manazure Hub: Hop Server<Color=/>"):Display()
    Teleport()
end

--= [ Farming ] =--

Farming:Section({ 
    Title = "~ Farm Level ~",
    TextXAlignment = "Center"
})

_G.LevelMode = "Get Quest"
Farming:Dropdown({
    Title = "Select Farm Level Mode",
    -- Desc = "",
    Multi = false,
    Value = "Get Quest",
    AllowNone = false,
    Values = {"No Quest","Get Quest"},
    Callback = function(V)
        _G.LevelMode = V
    end
})

Farming:Toggle({
    Title = "Auto Farm Level",
    -- Desc = "",
    Value = false,
    Callback = function(V)
        _G.FarmLevel = V
        StopTween(_G.FarmLevel)
    end
})

spawn(function()
    while wait() do
        if _G.FarmLevel then
            --pcall(function()
                CheckLevelQuest()
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMonster) and _G.LevelMode == "Get Quest" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false and _G.LevelMode == "Get Quest" then
                    StartMagnet = false
	    			topos(CFrameQuestLevel)
		    		if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuestLevel.Position).Magnitude <= 5 then
	    				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true or _G.LevelMode == "No Quest" then
                    CheckLevelQuest()
                    if game:GetService("Workspace").Enemies:FindFirstChild(NameMonster) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v.Name == NameMonster) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                repeat wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * PosFarm)
                                    PosFarm = v.HumanoidRootPart.CFrame
                                    StartMagnet = true
                                until not _G.FarmLevel or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    else
                        StartMagnet = false
                        topos(CFrameMon)
                        UnEquipWeapon(_G.SelectWeapon)
                    end
                end
            --end)
        end
    end
end)

Farming:Toggle({
    Title = "Auto Farm Nearest",
    -- Desc = "",
    Value = false,
    Callback = function(V)
        _G.FarmNearest = V
        StopTween(_G.FarmNearest)
    end
})

spawn(function()
	while wait() do
	    if _G.FarmNearest then
	    	pcall(function()
				for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
         	       if v.Name and v:FindFirstChild("Humanoid") then
				        if v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1500 then
			 	           repeat wait()
			     	           EquipWeapon(_G.SelectWeapon)
			  	              topos(v.HumanoidRootPart.CFrame * PosFarm)
			 	               PosNear = v.HumanoidRootPart.CFrame
					        	MagnetNear = true
				            until not _G.FarmNearest or not v.Parent or v.Humanoid.Health <= 0
				            MagnetNear = false
				        end
				    end
				end
			end)
		end
	end
end)

Farming:Section({ 
    Title = "~ Farm Mob ~",
    TextXAlignment = "Center"
})

if FirstSea then
	MobList = {"Bandit","Monkey","Gorilla","Pirate","Brute","Desert Bandit","Desert Officer","Snow Bandit","Snowman","Chief Petty Officer","Sky Bandit","Dark Master","Toga Warrior","Gladiator","Military Soldier","Military Spy","Fishman Warrior","Fishman Commando","God's Guard","Shanda","Royal Squad","Royal Soldier","Galley Pirate","Galley Captain"}
elseif SecondSea then
	MobList = {"Raider","Mercenary","Swan Pirate","Factory Staff","Marine Lieutenant","Marine Captain","Zombie","Vampire","Snow Trooper","Winter Warrior","Lab Subordinate","Horned Warrior","Magma Ninja","Lava Pirate","Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior","Snow Lurker","Sea Soldier","Water Fighter"}
elseif ThirdSea then
	MobList = {"Pirate Millionaire","Dragon Crew Warrior","Dragon Crew Archer","Female Islander","Giant Islander","Marine Commodore","Marine Rear Admiral","Fishman Raider","Fishman Captain","Forest Pirate","Mythological Pirate","Jungle Pirate","Musketeer Pirate","Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy","Peanut Scout","Peanut President","Ice Cream Chef","Ice Cream Commander","Cookie Crafter","Cake Guard","Baking Staff","Head Baker","Cocoa Warrior","Chocolate Bar Battler","Sweet Thief","Candy Rebel","Candy Pirate","Snow Demon","Isle Outlaw","Island Boy","Sun-kissed Warrior","Isle Champion","Serpent Hunter","Skull Slayer"}
end

Farming:Dropdown({
    Title = "Select Mob",
    -- Desc = "",
    Multi = false,
    Value = "",
    AllowNone = true,
    Values = MobList,
    Callback = function(V)
        _G.SelectMob = V
    end
})

Farming:Toggle({
    Title = "Auto Farm Mob",
    -- Desc = "",
    Value = false,
    Callback = function(V)
        _G.FarmMob = V
        StopTween(_G.FarmMob)
    end
})

spawn(function()
    while wait() do
        if _G.FarmMob then
            pcall(function()
                CheckLevelQuest()
                if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectMob) then
                    for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
                        if (v.Name == _G.SelectMob) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * PosFarm)
                                PosMonFarm = v.HumanoidRootPart.CFrame
                                SelectMag = true
                            until not _G.FarmMob or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                else
                    SelectMag = false
                    topos(CFrameMon)
                    UnEquipWeapon(_G.SelectWeapon)
                end
            end)
        end
    end
end)
