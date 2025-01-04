--= [ Anti Admin & Anti Afk ] =--

local function TeleportToServer(JobId)
    local Succ, Err = pcall(function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, JobId, game.Players.LocalPlayer)
    end)
    if not Succ then print(Err) end
end

local CheckAdmin = {"rip_indra","wenlocktoad","toilamvidamme","Uzoth","Azarth","Hingoi","Axiore","Death_King","Polkster","Lunoven","TheGreateAced","rip_fud","drip_mama","oofficialnoobie","Daigrock","layandikit12","red_game43","arlthmetic",}
task.spawn(function()
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
pcall(function()
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
    for i, v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        end
    end
    game:GetService("ReplicatedStorage").Assets:FindFirstChild("SlashHit"):Destroy()
    game:GetService("ReplicatedStorage").Util.Sound.Storage.Swing:Destroy()
end)

--= [ Noclip & Move Fly & Pos ] =--

local plrs = game.Players
local lp = plrs.LocalPlayer
local Workspace = game:GetService("Workspace")
NpcList = {}
for i, v in pairs(Workspace.NPCs:GetChildren()) do
    if string.find(string.lower(v.Name), "home point") and v:IsA("Model") then
        table.insert(NpcList, v:GetModelCFrame())
    end
end

for i, v in pairs(workspace:GetDescendants()) do
    if string.find(string.lower(v.Name), "home point") and v:IsA("Model") then
        table.insert(NpcList, v:GetModelCFrame())
    end
end

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

function BypassTeleport(is)
    if lp.Character:FindFirstChild("PartTele") then
        lp.Character.PartTele.CFrame = CFrame.new(lp.Character.PartTele.CFrame.X, lp.Character.PartTele.CFrame.Y, lp.Character.PartTele.CFrame.Z)
        wait(0.6)
        lp.Character.PartTele.CFrame = is
        wait(0.2)
        lp.Character.PrimaryPart.CFrame = is
        lp.Character:WaitForChild("Humanoid"):ChangeState(15)
        wait(0.6)
        repeat task.wait() until lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid.Health <= 0
        repeat task.wait()
            if lp.Character:FindFirstChild("PartTele") then
                lp.Character.PartTele.CFrame = is
            end
            if lp.Character:FindFirstChild("PrimaryPart") then
                lp.Character.PrimaryPart.CFrame = is
            end
        until lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid.Health > 0
    end
end

function GetBypassPos(pos)
    pos = Vector3.new(pos.X, pos.Y, pos.Z)
    local lll, mmm = nil, math.huge
    for i, v in pairs(NpcList) do
        if (v.p - pos).Magnitude < mmm then
            lll = v
            mmm = (v.p - pos).Magnitude
        end
    end
    return lll
end

function RequestEntrance(check1)
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack({"requestEntrance", check1}))
    if lp.Character:FindFirstChild("PartTele") then
        lp.Character.PartTele.CFrame = WaitHRP(lp).CFrame
    end
    wait(0.01)
end

function WaitHRP(nani)
    if not nani then return end
    return nani.Character:WaitForChild("HumanoidRootPart", 9)
end

function CalcDistance(I, II)
    if not II then
        II = lp.Character.PrimaryPart.CFrame
    end
    return (Vector3.new(I.X, 0, I.Z)-Vector3.new(II.X, 0, II.Z)).Magnitude
end

function topos(Pos)
    if not Pos then return end
    if not lp.Character:FindFirstChild("PartTele") then
        local PartTele = Instance.new("Part", lp.Character)
        PartTele.Size = Vector3.new(0, 0, 0)
        PartTele.Name = "PartTele"
        PartTele.Anchored = true
        PartTele.Transparency = 1
        PartTele.CanCollide = false
        PartTele.CFrame = WaitHRP(lp).CFrame
        PartTele:GetPropertyChangedSignal("CFrame"):Connect(function()
            task.wait(0.01)
            WaitHRP(lp).CFrame = PartTele.CFrame
        end)
    end
    Portal = GetPortal(Pos)
    Spawn = GetBypassPos(Pos)
    MyCFrame = WaitHRP(lp).CFrame
    Distance = CalcDistance(MyCFrame, Pos)
    if CalcDistance(Portal, Pos) < CalcDistance(Pos) and CalcDistance(Portal) > 1000 then
        return RequestEntrance(Portal)
    end
    if _G.BypassTeleport then
        if CalcDistance(Pos) - CalcDistance(Spawn, Pos) > 1500 and CalcDistance(Spawn) > 1500 then
            return BypassTeleport(Spawn)
        end
    end
    if lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid:FindFirstChild("Sit") and lp.Character.Humanoid.Sit == true then
        lp.Character.Humanoid.Sit = false
    end
    _G.NoClip = true
    Tween = game:GetService("TweenService"):Create(lp.Character.PartTele, TweenInfo.new(Distance / _G.TweenSpeed, Enum.EasingStyle.Linear), {CFrame = Pos})
    if Distance <= 250 then
        Tween:Cancel()
        lp.Character.PartTele.CFrame = Pos
    end
    Tween:Play()
end

spawn(function()
    while task.wait() do
        if lp.Character:FindFirstChild("Humanoid").Health <= 0 or not lp.Character:FindFirstChild("HumanoidRootPart") then
            if lp.Character:FindFirstChild("PartTele") then
                lp.Character:FindFirstChild("PartTele"):Destroy()
            end
        end
        if lp.Character:FindFirstChild("PartTele") then
            if (lp.Character.HumanoidRootPart.Position - lp.Character:FindFirstChild("PartTele").Position).Magnitude >= 100 then
                lp.Character:FindFirstChild("PartTele"):Destroy()
            end
        end
    end
end)

function StopTween()
    if not target then
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

loadstring(game:HttpGet("https://raw.githubusercontent.com/DeTaoYenDiPlz/Nani/refs/heads/main/IdkApi.lua"))()

--= [ Ui & Tab ] =--

local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()
local Window = WindUI:CreateWindow({
    Title = "Z - Manazure Hub",
    Icon = "tree-palm",
    Author = "ObieVN",
    Folder = "Z - Manazure Hub",
    Size = UDim2.fromOffset(550, 350),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 140,
    HasOutline = true
})

Window:EditOpenButton({
    Title = "Open Menu",
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
    Icon = "sword"
})

local Farming = Window:Tab({
    Title = "Farming",
    Icon = "sword"
})

--= [ Tab Setting ] =--

Setting:Section({ 
    Title = "~ Farming ~",
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

function EquipWeapon(Weapon)
    local a 
    for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == Weapon then
            a = v.Name
        end
    end
    for i,v in next, game.Players.LocalPlayer.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == Weapon then
            a = v.Name
        end
    end
    return a 
end

function UnEquipWeapon(Weapon)
    if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
        _G.NotAutoEquip = true
        wait(0.5)
        game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
        wait(0.1)
        _G.NotAutoEquip = false
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

local targets = {}
local targetName = nil

function Attack(target)
    if target[1]:FindFirstChild("HumanoidRootPart") and target[2]:FindFirstChild("HumanoidRootPart") and target[3]:FindFirstChild("HumanoidRootPart") and target[4]:FindFirstChild("HumanoidRootPart") then
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack"):FireServer(0)        
        local args = {
            [1] = target[1]:WaitForChild("Head"),
            [2] = {
                [1] = {
                    [1] = target[2],
                    [2] = target[2]:WaitForChild("HumanoidRootPart")
                    },
                [2] = {
                    [1] = target[3],
                    [2] = target[3]:WaitForChild("HumanoidRootPart")
                    },
                }
            }
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit"):FireServer(unpack(args))
    end
end

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.FastAttack then
                for i, v in pairs(workspace:FindFirstChild("Enemies"):GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 60 then
                            if targetName == nil or targetName == v.Name and FastAttackMon == v.Name then
                                table.insert(targets, v)
                                targetName = v.Name
                            else
                                targetName = FastAttackMon
                            end
                        end
                    end
                end
                Attack(targets)
                targets = {}
                targetName = nil
            end
        end)
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

function AutoClick()
	game:GetService("VirtualUser"):CaptureController()
	game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
end

spawn(function()
    while task.wait() do
        if _G.AutoClick then
            AutoClick()
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
    Title = "~ Tween ~",
    TextXAlignment = "Center"
})

Setting:Slider({
    Title = "Tween Speed",
    -- Desc = "",
    Step = 1,
    Value = {
        Min = 150,
        Max = 400,
        Default = 350,
    },
    Callback = function(V)
        _G.TweenSpeed = V
    end
})

Setting:Toggle({
    Title = "Dont Bypass Teleport If There Is Item",
    -- Desc = "",
    Value = false,
    Callback = function(V)
        _G.DontBT = V
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
    Title = "~ Graphic & Reduce Lag ~",
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
    Title = "Disabled Notifications Text",
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
    Title = "Disabled Damage Counter",
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
        game:GetService("Lighting").LightingLayers:Destroy()
    	game:GetService("Lighting").Sky:Destroy()
    end
})

Setting:Button({
   Title = "Remove Lava",
    -- Desc = "",
   Callback = function()
       RemoveLava()
   end
})

function RemoveLava()
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

--= [ Tab Status & Server ] =--

Status:Paragraph({
    Title = "Soon",
    Desc = "Soon"
})

--= [ Tab Farming ] =--

Farming:Section({ 
    Title = "~ Level ~",
    TextXAlignment = "Center"
})

Farming:Dropdown({
    Title = "Select Mode Farm Level",
    -- Desc = "",
    Multi = false,
    Value = "Get Quest",
    AllowNone = false,
    Values = {"Get Quest","No Quest"},
    Callback = function(V)
        _G.LevelMode = V
    end
})

Farming:Toggle({
    Title = "Auto Farm Level",
    -- Desc = "",
    Value = true,
    Callback = function(V)
        _G.FarmLevel = V
        StopTween(_G.FarmLevel)
    end
})

spawn(function()
    while wait() do
        if _G.FarmLevel then
            pcall(function()
                CheckLevelQuest()
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameCheckQuest) and _G.LevelMode == "Get Quest" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false and _G.LevelMode == "Get Quest" then
                    BringLevel = false
	    			topos(CFrameQuestLevel)
		    		if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuestLevel.Position).Magnitude <= 10 then
	    				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true or _G.LevelMode == "No Quest" then
                    CheckQuest()
                    if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v.Name == Monster) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                repeat wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * PosFarm)
                                    PosFarm = v.HumanoidRootPart.CFrame
                                    BringLevel = true
                                until not _G.FarmLevel or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    else
                        BringLevel = false
                        topos(CFrameMon)
                        UnEquipWeapon(_G.SelectWeapon)
                    end
                end
            end)
        end
    end
end)

Farming:Toggle({
    Title = "Auto Farm Nearest",
    -- Desc = "",
    Value = true,
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
					        	BringNear = true
				            until not _G.FarmNearest or not v.Parent or v.Humanoid.Health <= 0
				            BringNear = false
				        end
				    end
				end
			end)
		end
	end
end)
