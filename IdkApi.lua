if game.PlaceId == 2753915549 then
	FirstSea = true
elseif game.PlaceId == 4442272183 then
	SecondSea = true
elseif game.PlaceId == 7449423635 then
	ThirdSea = true
end

task.spawn(function()
	while task.wait() do 
		pcall(function()
			for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
				if v:IsA("Model") then  
					if v:FindFirstChild("Humanoid") and v.Name ~= v:FindFirstChild("Humanoid").DisplayName then
						v.Name = v:FindFirstChild("Humanoid").DisplayName
					end
				end
			end
			for _, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
				if v:IsA("Model") then  
					if v:FindFirstChild("Humanoid") and v.Name ~= v:FindFirstChild("Humanoid").DisplayName then
						v.Name = v:FindFirstChild("Humanoid").DisplayName
					end
				end
			end
		end)
	end
end)

function CheckMaterial()
	if FirstSea then
		if (_G.SelectMaterial == "Scrap Metal & Leather" or _G.SelectMaterial == "Leather") then
			MaterialMob = {"Brute [Lv. 45]","Pirate [Lv. 35]"}
			CFrameMob = CFrame.new(-1145, 15, 4350)
		elseif (_G.SelectMaterial == "Magma Ore") then
			MaterialMob = {"Military Soldier [Lv. 300]","Military Spy [Lv. 325]"}
			CFrameMob = CFrame.new(-5815, 84, 8820)
		elseif (_G.SelectMaterial == "Angel Wings") then
			MaterialMob = {"God's Guard [Lv. 450]"}
			CFrameMob = CFrame.new(-4698, 845, -1912)
		elseif (_G.SelectMaterial == "Fish Tail") then
			MaterialMob = {"Fishman Warrior [Lv. 375]","Fishman Commando [Lv. 400]"}
			CFrameMob = CFrame.new(61123, 19, 1569)
		end 
	end 
	if SecondSea then
		if (_G.SelectMaterial == "Scrap Metal & Leather" or _G.SelectMaterial == "Leather") then
			MaterialMob = {"Marine Captain [Lv. 900]"}
			CFrameMob = CFrame.new(-1869, 73, -3320)
		elseif (_G.SelectMaterial == "Magma Ore") then
			MaterialMob = {"Magma Ninja [Lv. 1175]","Lava Pirate [Lv. 1200]"}
			CFrameMob = CFrame.new(-5428, 78, -5959)
		elseif (_G.SelectMaterial == "Radioactive Material") then
			MaterialMob = {"Factory Staff [Lv. 800]"}
			CFrameMob = CFrame.new(295, 73, -56)
		elseif (_G.SelectMaterial == "Vampire Fang") then
			MaterialMob = {"Vampire [Lv. 975]"}
			CFrameMob = CFrame.new(-6033, 7, -1317)
		elseif (_G.SelectMaterial == "Mystic Droplet") then
			MaterialMob = {"Water Fighter [Lv. 1450]","Sea Soldier [Lv. 1425]"}
			CFrameMob = CFrame.new(-3385, 239, -10542)
		end 
	end 
	if ThirdSea then
		if (_G.SelectMaterial == "Scrap Metal & Leather" or _G.SelectMaterial == "Leather") then
			MaterialMob = {"Pirate Millionaire [Lv. 1500]"}
			CFrameMob = CFrame.new(-373, 75, 5550)
		elseif (_G.SelectMaterial == "Mini Tusk") then
			MaterialMob = {"Mythological Pirate [Lv. 1850]"}
			CFrameMob = CFrame.new(-13545,470, -6917)
		elseif (_G.SelectMaterial == "Fish Tail") then
			MaterialMob = {"Fishman Raider [Lv. 1775]","Fishman Captain [Lv. 1800]"}
			CFrameMob = CFrame.new(-10993,332, -8940)
		elseif (_G.SelectMaterial == "Dragon Scale") then
			MaterialMob = {"Dragon Crew Archer [Lv. 1600]","Dragon Crew Warrior [Lv. 1575]"}
			CFrameMob = CFrame.new(6339, 52, -1213)
		elseif (_G.SelectMaterial == "Conjured Cocoa") then
			MaterialMob = {"Cocoa Warrior [Lv. 2300]","Chocolate Bar Battler [Lv. 2325]"}
			CFrameMob = CFrame.new(620.6344604492188,78.93644714355469, -12581.369140625)
		elseif (_G.SelectMaterial == "Demonic Wisp") then
			MaterialMob = {"Demonic Soul [Lv. 2025]"}
			CFrameMob = CFrame.new(-9507,172,6158)
		elseif (_G.SelectMaterial == "Gunpowder") then
			MaterialMob = {"Pistol Billionaire [Lv. 1525]"}
			CFrameMob = CFrame.new(-469,74,5904)
		end 
	end 
end

function CheckBossQuest()
	if FirstSea then
		if (_G.SelectBoss == "Saber Expert [Lv. 200] [Boss]") then
			BossName = "Saber Expert [Lv. 200] [Boss]"
			CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564)
		elseif (_G.SelectBoss == "The Saw [Lv. 100] [Boss]") then
			BossName = "The Saw [Lv. 100] [Boss]"
			CFrameBoss = CFrame.new(-683.519897, 13.8534927, 1610.87854)
		elseif (_G.SelectBoss == "Greybeard [Lv. 750] [Raid Boss]") then
			BossName = "Greybeard [Lv. 750] [Raid Boss]"
			CFrameBoss = CFrame.new(-4955.72949, 80.8163834, 4305.82666)
		elseif (_G.SelectBoss == "Mob Leader [Lv. 120] [Boss]") then
			BossName = "Mob Leader [Lv. 120] [Boss]"
			CFrameBoss = CFrame.new(-2848.59399, 7.4272871, 5342.44043)
		elseif (_G.SelectBoss == "The Gorilla King [Lv. 25] [Boss]") then
			BossName = "The Gorilla King [Lv. 25] [Boss]"
			NameMobQuestBoss = "The Gorilla King"
			NameQuestBoss = "JungleQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-1604.12012, 36.8521118, 154.23732)
			CFrameBoss = CFrame.new(-1223.52808, 6.27936459, -502.292664)
		elseif (_G.SelectBoss == "Bobby [Lv. 55] [Boss]") then
			BossName = "Bobby [Lv. 55] [Boss]"
			NameMobQuestBoss = "Bobby"
			NameQuestBoss = "BuggyQuest1"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-1139.59717, 4.75205183, 3825.16211)
			CFrameBoss = CFrame.new(-1147.65173, 32.5966301, 4156.02588)
		elseif (_G.SelectBoss == "Yeti [Lv. 110] [Boss]") then
			BossName = "Yeti [Lv. 110] [Boss]"
			NameMobQuestBoss = "Yeti"
			NameQuestBoss = "SnowQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(1384.90247, 87.3078308, -1296.6825)
			CFrameBoss = CFrame.new(1221.7356, 138.046906, -1488.84082)
		elseif (_G.SelectBoss == "Vice Admiral [Lv. 130] [Boss]") then
			BossName = "Vice Admiral [Lv. 130] [Boss]"
			NameMobQuestBoss = "Vice Admiral"
			NameQuestBoss = "MarineQuest2"
			LevelQuestBoss = 2
			CFrameQuestBoss = CFrame.new(-5035.42285, 28.6520386, 4324.50293)
			CFrameBoss = CFrame.new(-5078.45898, 99.6520691, 4402.1665)
		elseif (_G.SelectBoss == "Warden [Lv. 175] [Boss]") then
			BossName = "Warden [Lv. 175] [Boss]"
			NameMobQuestBoss = "Warden"
			NameQuestBoss = "ImpelQuest"
			LevelQuestBoss = 1
			CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282)
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897)
		elseif (_G.SelectBoss == "Chief Warden [Lv. 200] [Boss]") then
			BossName = "Chief Warden [Lv. 200] [Boss]"
			NameMobQuestBoss = "Chief Warden"
			NameQuestBoss = "ImpelQuest"
			LevelQuestBoss = 2
			CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282)
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897)
		elseif (_G.SelectBoss == "Swan [Lv. 225] [Boss]") then
			BossName = "Swan [Lv. 225] [Boss]"
			NameMobQuestBoss = "Swan"
			NameQuestBoss = "ImpelQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282)
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897)
		elseif (_G.SelectBoss == "Magma Admiral [Lv. 350] [Boss]") then
			BossName = "Magma Admiral [Lv. 350] [Boss]"
			NameMobQuestBoss = "Magma Admiral"
			NameQuestBoss = "MagmaQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-5317.07666, 12.2721891, 8517.41699)
			CFrameBoss = CFrame.new(-5530.12646, 22.8769703, 8859.91309)
		elseif (_G.SelectBoss == "Fishman Lord [Lv. 425] [Boss]") then
			BossName = "Fishman Lord [Lv. 425] [Boss]"
			NameMobQuestBoss = "Fishman Lord"
			NameQuestBoss = "FishmanQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(61123.0859, 18.5066795, 1570.18018)
			CFrameBoss = CFrame.new(61351.7773, 31.0306778, 1113.31409)
		elseif (_G.SelectBoss == "Wysper [Lv. 500] [Boss]") then
			BossName = "Wysper [Lv. 500] [Boss]"
			NameMobQuestBoss = "Wysper"
			NameQuestBoss = "SkyExp1Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-7862.94629, 5545.52832, -379.833954)
			CFrameBoss = CFrame.new(-7925.48389, 5550.76074, -636.178345)
		elseif (_G.SelectBoss == "Thunder God [Lv. 575] [Boss]") then
			BossName = "Thunder God [Lv. 575] [Boss]"
			NameMobQuestBoss = "Thunder God"
			NameQuestBoss = "SkyExp2Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-7902.78613, 5635.99902, -1411.98706)
			CFrameBoss = CFrame.new(-7917.53613, 5616.61377, -2277.78564)
		elseif (_G.SelectBoss == "Cyborg [Lv. 675] [Boss]") then
			BossName = "Cyborg [Lv. 675] [Boss]"
			NameMobQuestBoss = "Cyborg"
			NameQuestBoss = "FountainQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(5253.54834, 38.5361786, 4050.45166)
			CFrameBoss = CFrame.new(6041.82813, 52.7112198, 3907.45142)
		end
	end
	if SecondSea then
		if (_G.SelectBoss == "Diamond [Lv. 750] [Boss]") then
			BossName = "Diamond [Lv. 750] [Boss]"
			NameMobQuestBoss = "Diamond"
			NameQuestBoss = "Area1Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-424.080078, 73.0055847, 1836.91589)
			CFrameBoss = CFrame.new(-1736.26587, 198.627731, -236.412857)
		elseif (_G.SelectBoss == "Jeremy [Lv. 850] [Boss]") then
			BossName = "Jeremy [Lv. 850] [Boss]"
			NameMobQuestBoss = "Jeremy"
			NameQuestBoss = "Area2Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(632.698608, 73.1055908, 918.66632)
			CFrameBoss = CFrame.new(2203.76953, 448.966034, 752.73107)
		elseif (_G.SelectBoss == "Fajita [Lv. 925] [Boss]") then
			BossName = "Fajita [Lv. 925] [Boss]"
			NameMobQuestBoss = "Fajita"
			NameQuestBoss = "MarineQuest3"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-2442.65015, 73.0511475, -3219.11523)
			CFrameBoss = CFrame.new(-2297.40332, 115.449463, -3946.5383)
		elseif (_G.SelectBoss == "Don Swan [Lv. 1000] [Boss]") then
			BossName = "Don Swan [Lv. 1000] [Boss]"
			CFrameBoss = CFrame.new(2288.802, 15.1870775, 863.034607)
		elseif (_G.SelectBoss == "Smoke Admiral [Lv. 1150] [Boss]") then
			BossName = "Smoke Admiral [Lv. 1150] [Boss]"
			NameMobQuestBoss = "Smoke Admiral"
			NameQuestBoss = "IceSideQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-6059.96191, 15.9868021, -4904.7373)
			CFrameBoss = CFrame.new(-5115.72754, 23.7664986, -5338.2207)
		elseif (_G.SelectBoss == "Cursed Captain [Lv. 1325] [Raid Boss]") then
			BossName = "Cursed Captain [Lv. 1325] [Raid Boss]"
			CFrameBoss = CFrame.new(916.928589, 181.092773, 33422)
		elseif (_G.SelectBoss == "Darkbeard [Lv. 1000] [Raid Boss]") then
			BossName = "Darkbeard [Lv. 1000] [Raid Boss]"
			CFrameBoss = CFrame.new(3876.00366, 24.6882591, -3820.21777)
		elseif (_G.SelectBoss == "Order [Lv. 1250] [Raid Boss]") then
			BossName = "Order [Lv. 1250] [Raid Boss]"
			CFrameBoss = CFrame.new(-6221.15039, 16.2351036, -5045.23584)
		elseif (_G.SelectBoss == "Awakened Ice Admiral [Lv. 1400] [Boss]") then
			BossName = "Awakened Ice Admiral [Lv. 1400] [Boss]"
			NameMobQuestBoss = "Awakened Ice Admiral"
			NameQuestBoss = "FrostQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(5669.33203, 28.2118053, -6481.55908)
			CFrameBoss = CFrame.new(6407.33936, 340.223785, -6892.521)
		elseif (_G.SelectBoss == "Tide Keeper [Lv. 1475] [Boss]") then
			BossName = "Tide Keeper [Lv. 1475] [Boss]"
			NameMobQuestBoss = "Tide Keeper"
			NameQuestBoss = "ForgottenQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-3053.89648, 236.881363, -10148.2324)
			CFrameBoss = CFrame.new(-3570.18652, 123.328949, -11555.9072)
		end
	end
	if ThirdSea then
		if (_G.SelectBoss == "Stone [Lv. 1550] [Boss]") then
			BossName = "Stone [Lv. 1550] [Boss]"
			NameMobQuestBoss = "Stone"
			NameQuestBoss = "PiratePortQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-290, 44, 5577)
			CFrameBoss = CFrame.new(-1085, 40, 6779)
		elseif (_G.SelectBoss == "Island Empress [Lv. 1675] [Boss]") then
			BossName = "Island Empress [Lv. 1675] [Boss]"
			NameMobQuestBoss = "Island Empress"
			NameQuestBoss = "AmazonQuest2"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(5443, 602, 752)
			CFrameBoss = CFrame.new(5659, 602, 244)
		elseif (_G.SelectBoss == "Kilo Admiral [Lv. 1750] [Boss]") then
			BossName = "Kilo Admiral [Lv. 1750] [Boss]"
			NameMobQuestBoss = "Kilo Admiral"
			NameQuestBoss = "MarineTreeIsland"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(2178, 29, -6737)
			CFrameBoss = CFrame.new(2846, 433, -7100)
		elseif (_G.SelectBoss == "Captain Elephant [Lv. 1875] [Boss]") then
			BossName = "Captain Elephant [Lv. 1875] [Boss]"
			NameMobQuestBoss = "Captain Elephant"
			NameQuestBoss = "DeepForestIsland"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-13232, 333, -7631)
			CFrameBoss = CFrame.new(-13221, 325, -8405)
		elseif (_G.SelectBoss == "Beautiful Pirate [Lv. 1950] [Boss]") then
			BossName = "Beautiful Pirate [Lv. 1950] [Boss]"
			NameMobQuestBoss = "Beautiful Pirate"
			NameQuestBoss = "DeepForestIsland2"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-12686, 391, -9902)
			CFrameBoss = CFrame.new(5182, 23, -20)
		elseif (_G.SelectBoss == "Cake Queen [Lv. 2175] [Boss]") then
			BossName = "Cake Queen [Lv. 2175] [Boss]"
			NameMobQuestBoss = "Cake Queen"
			NameQuestBoss = "IceCreamIslandQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-716, 382, -11010)
			CFrameBoss = CFrame.new(-821, 66, -10965)
		elseif (_G.SelectBoss == "rip_indra True Form [Lv. 5000] [Raid Boss]") then
			BossName = "rip_indra True Form [Lv. 5000] [Raid Boss]"
			CFrameBoss = CFrame.new(-5359, 424, -2735)
		elseif (_G.SelectBoss == "Longma [Lv. 2000] [Boss]") then
			BossName = "Longma [Lv. 2000] [Boss]"
			CFrameBoss = CFrame.new(-10248.3936, 353.79129, -9306.34473)
		elseif (_G.SelectBoss == "Soul Reaper [Lv. 2100] [Raid Boss]") then
			BossName = "Soul Reaper [Lv. 2100] [Raid Boss]"
			CFrameBoss = CFrame.new(-9515.62109, 315.925537, 6691.12012)
		elseif (_G.SelectBoss == "Dough King [Lv. 2300] [Raid Boss]") then
			BossName = "Dough King [Lv. 2300] [Raid Boss]"
			CFrameBoss = CFrame.new(-2151.82153, 149.315704, -12404.9053)
		end
	end
end

function CheckLevelQuest()
	local MyLevel = game.Players.LocalPlayer.Data.Level.Value
	if FirstSea then
		if (MyLevel == 1 or MyLevel <= 9) or (_G.SelectMob == "Bandit [Lv. 5]") then
			Monster = "Bandit [Lv. 5]"
			NameQuest = "BanditQuest1"
			LevelQuest = 1
			NameMobQuest = "Bandit"
			CFrameMon = CFrame.new(1145, 17, 1634)
			CFrameQuestLevel = CFrame.new(1060, 17, 1547)
		elseif (MyLevel == 10 or MyLevel <= 14) or (_G.SelectMob == "Monkey [Lv. 14]") then
			Monster = "Monkey [Lv. 14]"
			NameQuest = "JungleQuest"
			LevelQuest = 1
			NameMobQuest = "Monkey"
			CFrameMon = CFrame.new(-1496, 39, 35)
			CFrameQuestLevel = CFrame.new(-1602, 37, 152)
		elseif (MyLevel == 15 or MyLevel <= 29) or (_G.SelectMob == "Gorilla [Lv. 20]") then
			Monster = "Gorilla [Lv. 20]"
			NameQuest = "JungleQuest"
			LevelQuest = 2
			NameMobQuest = "Gorilla"
			CFrameMon = CFrame.new(-1237, 6, -486)
			CFrameQuestLevel = CFrame.new(-1602, 37, 152)
		elseif (MyLevel == 30 or MyLevel <= 39) or (_G.SelectMob == "Pirate [Lv. 35]") then
			Monster = "Pirate [Lv. 35]"
			NameQuest = "BuggyQuest1"
			LevelQuest = 1
			NameMobQuest = "Pirate"
			CFrameMon = CFrame.new(-1115, 14, 3938)
			CFrameQuestLevel = CFrame.new(-1140, 5, 3828)
		elseif (MyLevel == 40 or MyLevel <= 59) or (_G.SelectMob == "Brute [Lv. 45]") then
			Monster = "Brute [Lv. 45]"
			NameQuest = "BuggyQuest1"
			LevelQuest = 2
			NameMobQuest = "Brute"
			CFrameMon = CFrame.new(-1145, 15, 4350)
			CFrameQuestLevel = CFrame.new(-1140, 5, 3828)
		elseif (MyLevel == 60 or MyLevel <= 74) or (_G.SelectMob == "Desert Bandit [Lv. 60]") then
			Monster = "Desert Bandit [Lv. 60]"
			NameQuest = "DesertQuest"
			LevelQuest = 1
			NameMobQuest = "Desert Bandit"
			CFrameMon = CFrame.new(932, 7, 4484)
			CFrameQuestLevel = CFrame.new(897, 7, 4388)
		elseif (MyLevel == 75 or MyLevel <= 89) or (_G.SelectMob == "Desert Officer [Lv. 70]") then
			Monster = "Desert Officer [Lv. 70]"
			NameQuest = "DesertQuest"
			LevelQuest = 2
			NameMobQuest = "Desert Officer"
			CFrameMon = CFrame.new(1572, 10, 4373)
			CFrameQuestLevel = CFrame.new(897, 7, 4388)
		elseif (MyLevel == 90 or MyLevel <= 99) or (_G.SelectMob == "Snow Bandit [Lv. 90]") then
			Monster = "Snow Bandit [Lv. 90]"
			NameQuest = "SnowQuest"
			LevelQuest = 1
			NameMobQuest = "Snow Bandits"
			CFrameMon = CFrame.new(1289, 150, -1442)
			CFrameQuestLevel = CFrame.new(1386, 87, -1297)
		elseif (MyLevel == 100 or MyLevel <= 119) or (_G.SelectMob == "Snowman [Lv. 100]") then
			Monster = "Snowman [Lv. 100]"
			NameQuest = "SnowQuest"
			LevelQuest = 2
			NameMobQuest = "Snowman"
			CFrameMon = CFrame.new(1289, 150, -1442)
			CFrameQuestLevel = CFrame.new(1386, 87, -1297)
		elseif (MyLevel == 120 or MyLevel <= 149) or (_G.SelectMob == "Chief Petty Officer [Lv. 120]") then
			Monster = "Chief Petty Officer [Lv. 120]"
			NameQuest = "MarineQuest2"
			LevelQuest = 1
			NameMobQuest = "Chief Petty Officer"
			CFrameMon = CFrame.new(-4855, 23, 4308)
			CFrameQuestLevel = CFrame.new(-5036, 29, 4325)
		elseif (MyLevel == 150 or MyLevel <= 174) or (_G.SelectMob == "Sky Bandit [Lv. 150]") then
			Monster = "Sky Bandit [Lv. 150]"
			NameQuest = "SkyQuest"
			LevelQuest = 1
			NameMobQuest = "Sky Bandit"
			CFrameMon = CFrame.new(-4981, 278, -2830)
			CFrameQuestLevel = CFrame.new(-4842, 718, -2623)
		elseif (MyLevel == 175 or MyLevel <= 189) or (_G.SelectMob == "Dark Master [Lv. 175]") then
			Monster = "Dark Master [Lv. 175]"
			NameQuest = "SkyQuest"
			LevelQuest = 2
			NameMobQuest = "Dark Master"
			CFrameMon = CFrame.new(-5250, 389, -2272)
			CFrameQuestLevel = CFrame.new(-4842, 718, -2623)
		elseif (MyLevel == 190 or MyLevel <= 209) or (_G.SelectMob == "Prisoner [Lv. 190]") then
			Monster = "Prisoner [Lv. 190]"
			NameQuest = "PrisonerQuest"
			LevelQuest = 1
			NameMobQuest = "Prisoners"
			CFrameMon = CFrame.new(5411, 96, 690)
			CFrameQuestLevel = CFrame.new(5308, 2, 474)
		elseif (MyLevel == 210 or MyLevel <= 249) or (_G.SelectMob == "Dangerous Prisoner [Lv. 210]") then
			Monster = "Dangerous Prisoner [Lv. 210]"
			NameQuest = "PrisonerQuest"
			LevelQuest = 2
			NameMobQuest = "Dangerous Prisoner"
			CFrameMon = CFrame.new(5411, 96, 690)
			CFrameQuestLevel = CFrame.new(5308, 2, 474)
		elseif (MyLevel == 250 or MyLevel <= 274) or (_G.SelectMob == "Toga Warrior [Lv. 250]") then
			Monster = "Toga Warrior [Lv. 250]"
			NameQuest = "ColosseumQuest"
			LevelQuest = 1
			NameMobQuest = "Toga Warrior"
			CFrameMon = CFrame.new(-1641.4344482421875, 7.415142059326172, -2864.462646484375)
			CFrameQuestLevel = CFrame.new(-1576, 8, -2985)
		elseif (MyLevel == 275 or MyLevel <= 299) or (_G.SelectMob == "Gladiator [Lv. 275]") then
			Monster = "Gladiator [Lv. 275]"
			NameQuest = "ColosseumQuest"
			LevelQuest = 2
			NameMobQuest = "Gladiato"
			CFrameMon = CFrame.new(-1385.5233154296875, 7.468349456787109, -3163.066650390625)
			CFrameQuestLevel = CFrame.new(-1576, 8, -2985)
		elseif (MyLevel == 300 or MyLevel <= 329) or (_G.SelectMob == "Military Soldier [Lv. 300]") then
			Monster = "Military Soldier [Lv. 300]"
			NameQuest = "MagmaQuest"
			LevelQuest = 1
			NameMobQuest = "Military Soldier"
			CFrameMon = CFrame.new(-5408, 11, 8447)
			CFrameQuestLevel = CFrame.new(-5316, 12, 8517)
		elseif (MyLevel == 330 or MyLevel <= 374) or (_G.SelectMob == "Military Spy [Lv. 325]") then
			Monster = "Military Spy [Lv. 325]"
			NameQuest = "MagmaQuest"
			LevelQuest = 2
			NameMobQuest = "Military Spy"
			CFrameMon = CFrame.new(-5815, 84, 8820)
			CFrameQuestLevel = CFrame.new(-5316, 12, 8517)
		elseif (MyLevel == 375 or MyLevel <= 399) or (_G.SelectMob == "Fishman Warrior [Lv. 375]") then
			Monster = "Fishman Warrior [Lv. 375]"
			NameQuest = "FishmanQuest"
			LevelQuest = 1
			NameMobQuest = "Fishman Warrior"
			CFrameMon = CFrame.new(60859, 19, 1501)
			CFrameQuestLevel = CFrame.new(61123, 19, 1569)
		elseif (MyLevel == 400 or MyLevel <= 449) or (_G.SelectMob == "Fishman Commando [Lv. 400]") then
			Monster = "Fishman Commando [Lv. 400]"
			NameQuest = "FishmanQuest"
			LevelQuest = 2
			NameMobQuest = "Fishman Commando"
			CFrameMon = CFrame.new(61891, 19, 1470)
			CFrameQuestLevel = CFrame.new(61123, 19, 1569)
		elseif (MyLevel == 450 or MyLevel <= 474) or (_G.SelectMob == "God's Guard [Lv. 450]") then
			Monster = "God's Guard [Lv. 450]"
			NameQuest = "SkyExp1Quest"
			LevelQuest = 1
			NameMobQuest = "God's Guards"
			CFrameMon = CFrame.new(-4698, 845, -1912)
			CFrameQuestLevel = CFrame.new(-4722, 845, -1954)
		elseif (MyLevel == 475 or MyLevel <= 524) or (_G.SelectMob == "Shanda [Lv. 475]") then
			Monster = "Shanda [Lv. 475]"
			NameQuest = "SkyExp1Quest"
			LevelQuest = 2
			NameMobQuest = "Shandas"
			CFrameMon = CFrame.new(-7685, 5567, -502)
			CFrameQuestLevel = CFrame.new(-7862, 5546, -380)
		elseif (MyLevel == 525 or MyLevel <= 549) or (_G.SelectMob == "Royal Squad [Lv. 525]") then
			Monster = "Royal Squad [Lv. 525]"
			NameQuest = "SkyExp2Quest"
			LevelQuest = 1
			NameMobQuest = "Royal Squad"
			CFrameMon = CFrame.new(-7670, 5607, -1460)
			CFrameQuestLevel = CFrame.new(-7904, 5636, -1412)
		elseif (MyLevel == 550 or MyLevel <= 624) or (_G.SelectMob == "Royal Soldier [Lv. 550]") then
			Monster = "Royal Soldier [Lv. 550]"
			NameQuest = "SkyExp2Quest"
			LevelQuest = 2
			NameMobQuest = "Royal Soldier"
			CFrameMon = CFrame.new(-7828, 5607, -1744)
			CFrameQuestLevel = CFrame.new(-7904, 5636, -1412)
		elseif (MyLevel == 625 or MyLevel <= 649) or (_G.SelectMob == "Galley Pirate [Lv. 625]") then
			Monster = "Galley Pirate [Lv. 625]"
			NameQuest = "FountainQuest"
			LevelQuest = 1
			NameMobQuest = "Galley Pirate"
			CFrameMon = CFrame.new(5589, 45, 3996)
			CFrameQuestLevel = CFrame.new(5256, 39, 4050)
		elseif (MyLevel >= 650) or (_G.SelectMob == "Galley Captain [Lv. 650]") then
			Monster = "Galley Captain [Lv. 650]"
			NameQuest = "FountainQuest"
			LevelQuest = 2
			NameMobQuest = "Galley Captain"
			CFrameMon = CFrame.new(5649, 39, 4936)
			CFrameQuestLevel = CFrame.new(5256, 39, 4050)
		end
	end
	if SecondSea then
		if (MyLevel == 700 or MyLevel <= 724) or (_G.SelectMob == "Raider [Lv. 700]") then
			Monster = "Raider [Lv. 700]"
			NameQuest = "Area1Quest"
			LevelQuest = 1
			NameMobQuest = "Raider"
			CFrameQuestLevel = CFrame.new(-425, 73, 1837)
			CFrameMon = CFrame.new(-746, 39, 2390)
		elseif (MyLevel == 725 or MyLevel <= 774) or (_G.SelectMob == "Mercenary [Lv. 725]") then
			Monster = "Mercenary [Lv. 725]"
			NameQuest = "Area1Quest"
			LevelQuest = 2
			NameMobQuest = "Mercenary"
			CFrameQuestLevel = CFrame.new(-425, 73, 1837)
			CFrameMon = CFrame.new(-874, 141, 1312)
		elseif (MyLevel == 775 or MyLevel <= 799) or (_G.SelectMob == "Swan Pirate [Lv. 775]") then
			Monster = "Swan Pirate [Lv. 775]"
			NameQuest = "Area2Quest"
			LevelQuest = 1
			NameMobQuest = "Swan Pirate"
			CFrameQuestLevel = CFrame.new(634, 73, 918)
			CFrameMon = CFrame.new(878, 122, 1235)
		elseif (MyLevel == 800 or MyLevel <= 874) or (_G.SelectMob == "Factory Staff [Lv. 800]") then
			Monster = "Factory Staff [Lv. 800]"
			NameQuest = "Area2Quest"
			LevelQuest = 2
			NameMobQuest = "Factory Staff"
			CFrameQuestLevel = CFrame.new(634, 73, 918)
			CFrameMon = CFrame.new(295, 73, -56)
		elseif (MyLevel == 875 or MyLevel <= 899) or (_G.SelectMob == "Marine Lieutenant [Lv. 875]") then
			Monster = "Marine Lieutenant [Lv. 875]"
			NameQuest = "MarineQuest3"
			LevelQuest = 1
			NameMobQuest = "Marine Lieutenant"
			CFrameMon = CFrame.new(-2806, 73, -3038)
			CFrameQuestLevel = CFrame.new(-2443, 73, -3219)
		elseif (MyLevel == 900 or MyLevel <= 949) or (_G.SelectMob == "Marine Captain [Lv. 900]") then
			Monster = "Marine Captain [Lv. 900]"
			NameQuest = "MarineQuest3"
			LevelQuest = 2
			NameMobQuest = "Marine Captain"
			CFrameMon = CFrame.new(-1869, 73, -3320)
			CFrameQuestLevel = CFrame.new(-2443, 73, -3219)
		elseif (MyLevel == 950 or MyLevel <= 974) or (_G.SelectMob == "Zombie [Lv. 950]") then
			Monster = "Zombie [Lv. 950]"
			NameQuest = "ZombieQuest"
			LevelQuest = 1
			NameMobQuest = "Zombie"
			CFrameMon = CFrame.new(-5736, 126, -728)
			CFrameQuestLevel = CFrame.new(-5494, 49, -795)
		elseif (MyLevel == 975 or MyLevel <= 999) or (_G.SelectMob == "Vampire [Lv. 975]") then
			Monster = "Vampire [Lv. 975]"
			NameQuest = "ZombieQuest"
			LevelQuest = 2
			NameMobQuest = "Vampire"
			CFrameMon = CFrame.new(-6033, 7, -1317)
			CFrameQuestLevel = CFrame.new(-5494, 49, -795)
		elseif (MyLevel == 1000 or MyLevel <= 1049) or (_G.SelectMob == "Snow Trooper [Lv. 1000]") then
			Monster = "Snow Trooper [Lv. 1000]"
			NameQuest = "SnowMountainQuest"
			LevelQuest = 1
			NameMobQuest = "Snow Trooper"
			CFrameMon = CFrame.new(478, 402, -5362)
			CFrameQuestLevel = CFrame.new(605, 402, -5371)
		elseif (MyLevel == 1050 or MyLevel <= 1099) or (_G.SelectMob == "Winter Warrior [Lv. 1050]") then
			Monster = "Winter Warrior [Lv. 1050]"
			NameQuest = "SnowMountainQuest"
			LevelQuest = 2
			NameMobQuest = "Winter Warrior"
			CFrameMon = CFrame.new(1157, 430, -5188)
			CFrameQuestLevel = CFrame.new(605, 402, -5371)
		elseif (MyLevel == 1100 or MyLevel <= 1124) or (_G.SelectMob == "Lab Subordinate [Lv. 1100]") then
			Monster = "Lab Subordinate [Lv. 1100]"
			NameQuest = "IceSideQuest"
			LevelQuest = 1
			NameMobQuest = "Lab Subordinate"
			CFrameMon = CFrame.new(-5782, 42, -4484)
			CFrameQuestLevel = CFrame.new(-6060, 16, -4905)
		elseif (MyLevel == 1125 or MyLevel <= 1174) or (_G.SelectMob == "Horned Warrior [Lv. 1125]") then
			Monster = "Horned Warrior [Lv. 1125]"
			NameQuest = "IceSideQuest"
			LevelQuest = 2
			NameMobQuest = "Horned Warrior"
			CFrameMon = CFrame.new(-6406, 24, -5805)
			CFrameQuestLevel = CFrame.new(-6060, 16, -4905)
		elseif (MyLevel == 1175 or MyLevel <= 1199) or (_G.SelectMob == "Magma Ninja [Lv. 1175]") then
			Monster = "Magma Ninja [Lv. 1175]"
			NameQuest = "FireSideQuest"
			LevelQuest = 1
			NameMobQuest = "Magma Ninja"
			CFrameMon = CFrame.new(-5428, 78, -5959)
			CFrameQuestLevel = CFrame.new(-5430, 16, -5295)
		elseif (MyLevel == 1200 or MyLevel <= 1249) or (_G.SelectMob == "Lava Pirate [Lv. 1200]") then
			Monster = "Lava Pirate [Lv. 1200]"
			NameQuest = "FireSideQuest"
			LevelQuest = 2
			NameMobQuest = "Lava Pirate"
			CFrameMon = CFrame.new(-5270, 42, -4800)
			CFrameQuestLevel = CFrame.new(-5430, 16, -5295)
		elseif (MyLevel == 1250 or MyLevel <= 1274) or (_G.SelectMob == "Ship Deckhand [Lv. 1250]") then
			Monster = "Ship Deckhand [Lv. 1250]"
			NameQuest = "ShipQuest1"
			LevelQuest = 1
			NameMobQuest = "Ship Deckhand"
			CFrameMon = CFrame.new(1198, 126, 33031)
			CFrameQuestLevel = CFrame.new(1038, 125, 32913)
		elseif (MyLevel == 1275 or MyLevel <= 1299) or (_G.SelectMob == "Ship Engineer [Lv. 1275]") then
			Monster = "Ship Engineer [Lv. 1275]"
			NameQuest = "ShipQuest1"
			LevelQuest = 2
			NameMobQuest = "Ship Engineer"
			CFrameMon = CFrame.new(918, 44, 32787)
			CFrameQuestLevel = CFrame.new(1038, 125, 32913)
		elseif (MyLevel == 1300 or MyLevel <= 1324) or (_G.SelectMob == "Ship Steward [Lv. 1300]") then
			Monster = "Ship Steward [Lv. 1300]"
			NameQuest = "ShipQuest2"
			LevelQuest = 1
			NameMobQuest = "Ship Steward"
			CFrameMon = CFrame.new(915, 130, 33419)
			CFrameQuestLevel = CFrame.new(969, 125, 33245)
		elseif (MyLevel == 1325 or MyLevel <= 1349) or (_G.SelectMob == "Ship Officer [Lv. 1325]") then
			Monster = "Ship Officer [Lv. 1325]"
			NameQuest = "ShipQuest2"
			LevelQuest = 2
			NameMobQuest = "Ship Officer"
			CFrameMon = CFrame.new(916, 181, 33335)
			CFrameQuestLevel = CFrame.new(969, 125, 33245)
		elseif (MyLevel == 1350 or MyLevel <= 1374) or (_G.SelectMob == "Arctic Warrior [Lv. 1350]") then
			Monster = "Arctic Warrior [Lv. 1350]"
			NameQuest = "FrostQuest"
			LevelQuest = 1
			NameMobQuest = "Arctic Warrior"
			CFrameMon = CFrame.new(6038, 29, -6231)
			CFrameQuestLevel = CFrame.new(5669, 28, -6482)
		elseif (MyLevel == 1375 or MyLevel <= 1424) or (_G.SelectMob == "Snow Lurker [Lv. 1375]") then
			Monster = "Snow Lurker [Lv. 1375]"
			NameQuest = "FrostQuest"
			LevelQuest = 2
			NameMobQuest = "Snow Lurker"
			CFrameMon = CFrame.new(5560, 42, -6826)
			CFrameQuestLevel = CFrame.new(5669, 28, -6482)
		elseif (MyLevel == 1425 or MyLevel <= 1449) or (_G.SelectMob == "Sea Soldier [Lv. 1425]") then
			Monster = "Sea Soldier [Lv. 1425]"
			NameQuest = "ForgottenQuest"
			LevelQuest = 1
			NameMobQuest = "Sea Soldier"
			CFrameMon = CFrame.new(-3022, 16, -9722)
			CFrameQuestLevel = CFrame.new(-3054, 237, -10148)
		elseif (MyLevel >= 1450) or (_G.SelectMob == "Water Fighter [Lv. 1450]") then
			Monster = "Water Fighter [Lv. 1450]"
			NameQuest = "ForgottenQuest"
			LevelQuest = 2
			NameMobQuest = "Water Fighter"
			CFrameMon = CFrame.new(-3385, 239, -10542)
			CFrameQuestLevel = CFrame.new(-3054, 237, -10148)
		end
	end
	if ThirdSea then
		if (MyLevel == 1500 or MyLevel <= 1524) or (_G.SelectMob == "Pirate Millionaire [Lv. 1500]") then
			Monster = "Pirate Millionaire [Lv. 1500]"
			NameQuest = "PiratePortQuest"
			LevelQuest = 1
			NameMobQuest = "Pirate Millionaire"
			CFrameMon = CFrame.new(-373, 75, 5550)
			CFrameQuestLevel = CFrame.new(-288, 44, 5576)
		elseif (MyLevel == 1525 or MyLevel <= 1574) or (_G.SelectMob == "Pistol Billionaire [Lv. 1525]") then
			Monster = "Pistol Billionaire [Lv. 1525]"
			NameQuest = "PiratePortQuest"
			LevelQuest = 2
			NameMobQuest = "Pistol Billionaire"
			CFrameMon = CFrame.new(-469, 74, 5904)
			CFrameQuestLevel = CFrame.new(-288, 44, 5576)
		elseif (MyLevel == 1575 or MyLevel <= 1599) or (_G.SelectMob == "Dragon Crew Warrior [Lv. 1575]") then
			Monster = "Dragon Crew Warrior [Lv. 1575]"
			NameQuest = "AmazonQuest"
			LevelQuest = 1
			NameMobQuest = "Dragon Crew Warrior"
			CFrameMon = CFrame.new(6339, 52, -1213)
			CFrameQuestLevel = CFrame.new(5835, 52, -1105)
		elseif (MyLevel == 1600 or MyLevel <= 1624) or (_G.SelectMob == "Dragon Crew Archer [Lv. 1600]") then
			Monster = "Dragon Crew Archer [Lv. 1600]"
			NameQuest = "AmazonQuest"
			LevelQuest = 2
			NameMobQuest = "Dragon Crew Archer"
			CFrameMon = CFrame.new(6594, 383, 139)
			CFrameQuestLevel = CFrame.new(5835, 52, -1105)
		elseif (MyLevel == 1625 or MyLevel <= 1649) or (_G.SelectMob == "Female Islander [Lv. 1625]") then
			Monster = "Female Islander [Lv. 1625]"
			NameQuest = "AmazonQuest2"
			LevelQuest = 1
			NameMobQuest = "Female Islander"
			CFrameMon = CFrame.new(5308, 819, 1047)
			CFrameQuestLevel = CFrame.new(5443, 602, 751)
		elseif (MyLevel == 1650 or MyLevel <= 1699) or (_G.SelectMob == "Giant Islander [Lv. 1650]") then
			Monster = "Giant Islander [Lv. 1650]"
			NameQuest = "AmazonQuest2"
			LevelQuest = 2
			NameMobQuest = "Giant Islanders"
			CFrameMon = CFrame.new(4951, 602, -68)
			CFrameQuestLevel = CFrame.new(5443, 602, 751)
		elseif (MyLevel == 1700 or MyLevel <= 1724) or (_G.SelectMob == "Marine Commodore [Lv. 1700]") then
			Monster = "Marine Commodore [Lv. 1700]"
			NameQuest = "MarineTreeIsland"
			LevelQuest = 1
			NameMobQuest = "Marine Commodore"
			CFrameMon = CFrame.new(2447, 73, -7470)
			CFrameQuestLevel = CFrame.new(2180, 29, -6737)
		elseif (MyLevel == 1725 or MyLevel <= 1774) or (_G.SelectMob == "Marine Rear Admiral [Lv. 1725]") then
			Monster = "Marine Rear Admiral [Lv. 1725]"
			NameQuest = "MarineTreeIsland"
			LevelQuest = 2
			NameMobQuest = "Marine Rear Admiral"
			CFrameMon = CFrame.new(3671, 161, -6932)
			CFrameQuestLevel = CFrame.new(2180, 29, -6737)
		elseif (MyLevel == 1775 or MyLevel <= 1800) or (_G.SelectMob == "Fishman Raider [Lv. 1775]") then
			Monster = "Fishman Raider [Lv. 1775]"
			NameQuest = "DeepForestIsland3"
			LevelQuest = 1
			NameMobQuest = "Fishman Raider"
			CFrameMon = CFrame.new(-10560, 332, -8466)
			CFrameQuestLevel = CFrame.new(-10584, 332, -8758)
		elseif (MyLevel == 1800 or MyLevel <= 1824) or (_G.SelectMob == "Fishman Captain [Lv. 1800]") then
			Monster = "Fishman Captain [Lv. 1800]"
			NameQuest = "DeepForestIsland3"
			LevelQuest = 2
			NameMobQuest = "Fishman Captain"
			CFrameMon = CFrame.new(-10993, 332, -8940)
			CFrameQuestLevel = CFrame.new(-10584, 332, -8758)
		elseif (MyLevel == 1825 or MyLevel <= 1849) or (_G.SelectMob == "Forest Pirate [Lv. 1825]") then
			Monster = "Forest Pirate [Lv. 1825]"
			NameQuest = "DeepForestIsland"
			LevelQuest = 1
			NameMobQuest = "Forest Pirate"
			CFrameMon = CFrame.new(-13479, 333, -7905)
			CFrameQuestLevel = CFrame.new(-13232, 333, -7627)
		elseif (MyLevel == 1850 or MyLevel <= 1899) or (_G.SelectMob == "Mythological Pirate [Lv. 1850]") then
			Monster = "Mythological Pirate [Lv. 1850]"
			NameQuest = "DeepForestIsland"
			LevelQuest = 2
			NameMobQuest = "Mythological Pirate"
			CFrameMon = CFrame.new(-13545, 470, -6917)
			CFrameQuestLevel = CFrame.new(-13232, 333, -7627)
		elseif (MyLevel == 1900 or MyLevel <= 1924) or (_G.SelectMob == "Jungle Pirate [Lv. 1900]") then
			Monster = "Jungle Pirate [Lv. 1900]"
			NameQuest = "DeepForestIsland2"
			LevelQuest = 1
			NameMobQuest = "Jungle Pirate"
			CFrameMon = CFrame.new(-12107, 332, -10549)
			CFrameQuestLevel = CFrame.new(-12684, 391, -9902)
		elseif (MyLevel == 1925 or MyLevel <= 1974) or (_G.SelectMob == "Musketeer Pirate [Lv. 1925]") then
			Monster = "Musketeer Pirate [Lv. 1925]"
			NameQuest = "DeepForestIsland2"
			LevelQuest = 2
			NameMobQuest = "Musketeer Pirate"
			CFrameMon = CFrame.new(-13286, 392, -9769)
			CFrameQuestLevel = CFrame.new(-12684, 391, -9902)
		elseif (MyLevel == 1975 or MyLevel <= 1999) or (_G.SelectMob == "Reborn Skeleton [Lv. 1975]") then
			Monster = "Reborn Skeleton [Lv. 1975]"
			NameQuest = "HauntedQuest1"
			LevelQuest = 1
			NameMobQuest = "Reborn Skeleton"
			CFrameMon = CFrame.new(-8760, 142, 6039)
			CFrameQuestLevel = CFrame.new(-9482, 142, 5567)
		elseif (MyLevel == 2000 or MyLevel <= 2024) or (_G.SelectMob == "Living Zombie [Lv. 2000]") then
			Monster = "Living Zombie [Lv. 2000]"
			NameQuest = "HauntedQuest1"
			LevelQuest = 2
			NameMobQuest = "Living Zombie"
			CFrameMon = CFrame.new(-10144, 140, 5932)
			CFrameQuestLevel = CFrame.new(-9482, 142, 5567)
		elseif (MyLevel == 2025 or MyLevel <= 2049) or (_G.SelectMob == "Demonic Soul [Lv. 2025]") then
			Monster = "Demonic Soul [Lv. 2025]"
			NameQuest = "HauntedQuest2"
			LevelQuest = 1
			NameMobQuest = "Demonic Soul"
			CFrameMon = CFrame.new(-9507, 172, 6158)
			CFrameQuestLevel = CFrame.new(-9513, 172, 6079)
		elseif (MyLevel == 2050 or MyLevel <= 2074) or (_G.SelectMob == "Posessed Mummy [Lv. 2050]") then
			Monster = "Posessed Mummy [Lv. 2050]"
			NameQuest = "HauntedQuest2"
			LevelQuest = 2
			NameMobQuest = "Posessed Mummy"
			CFrameMon = CFrame.new(-9577, 6, 6223)
			CFrameQuestLevel = CFrame.new(-9513, 172, 6079)
		elseif (MyLevel == 2075 or MyLevel <= 2099) or (_G.SelectMob == "Peanut Scout [Lv. 2075]") then
			Monster = "Peanut Scout [Lv. 2075]"
			NameQuest = "NutsIslandQuest"
			LevelQuest = 1
			NameMobQuest = "Peanut Scout"
			CFrameMon = CFrame.new(-2124, 123, -10435)
			CFrameQuestLevel = CFrame.new(-2104, 38, -10192)
		elseif (MyLevel == 2100 or MyLevel <= 2124) or (_G.SelectMob == "Peanut President [Lv. 2100]") then
			Monster = "Peanut President [Lv. 2100]"
			NameQuest = "NutsIslandQuest"
			LevelQuest = 2
			NameMobQuest = "Peanut President"
			CFrameMon = CFrame.new(-2124, 123, -10435)
			CFrameQuestLevel = CFrame.new(-2104, 38, -10192)
		elseif (MyLevel == 2125 or MyLevel <= 2149) or (_G.SelectMob == "Ice Cream Chef [Lv. 2125]") then
			Monster = "Ice Cream Chef [Lv. 2125]"
			NameQuest = "IceCreamIslandQuest"
			LevelQuest = 1
			NameMobQuest = "Ice Cream Chef"
			CFrameMon = CFrame.new(-641, 127, -11062)
			CFrameQuestLevel = CFrame.new(-822, 66, -10965)
		elseif (MyLevel == 2150 or MyLevel <= 2199) or (_G.SelectMob == "Ice Cream Commander [Lv. 2150]") then
			Monster = "Ice Cream Commander [Lv. 2150]"
			NameQuest = "IceCreamIslandQuest"
			LevelQuest = 2
			NameMobQuest = "Ice Cream Commander"
			CFrameMon = CFrame.new(-641, 127, -11062)
			CFrameQuestLevel = CFrame.new(-822, 66, -10965)
		elseif (MyLevel == 2200 or MyLevel <= 2224) or (_G.SelectMob == "Cookie Crafter [Lv. 2200]") then
			Monster = "Cookie Crafter [Lv. 2200]"
			NameQuest = "CakeQuest1"
			LevelQuest = 1
			NameMobQuest = "Cookie Crafter"
			CFrameMon = CFrame.new(-2365, 38, -12099)
			CFrameQuestLevel = CFrame.new(-2020, 38, -12025)
		elseif (MyLevel == 2225 or MyLevel <= 2249) or (_G.SelectMob == "Cake Guard [Lv. 2225]") then
			Monster = "Cake Guard [Lv. 2225]"
			NameQuest = "CakeQuest1"
			LevelQuest = 2
			NameMobQuest = "Cake Guard"
			CFrameMon = CFrame.new(-1651, 38, -12308)
			CFrameQuestLevel = CFrame.new(-2020, 38, -12025)
		elseif (MyLevel == 2250 or MyLevel <= 2274) or (_G.SelectMob == "Baking Staff [Lv. 2250]") then
			Monster = "Baking Staff [Lv. 2250]"
			NameQuest = "CakeQuest2"
			LevelQuest = 1
			NameMobQuest = "Baking Staff"
			CFrameMon = CFrame.new(-1870, 38, -12938)
			CFrameQuestLevel = CFrame.new(-1926, 38, -12850)
		elseif (MyLevel == 2275 or MyLevel <= 2300) or (_G.SelectMob == "Head Baker [Lv. 2275]") then
			Monster = "Head Baker [Lv. 2275]"
			NameQuest = "CakeQuest2"
			LevelQuest = 2
			NameMobQuest = "Head Baker"
			CFrameMon = CFrame.new(-1926, 88, -12850)
			CFrameQuestLevel = CFrame.new(-1926, 38, -12850)
		elseif (MyLevel == 2300 or MyLevel <= 2324) or (_G.SelectMob == "Cocoa Warrior [Lv. 2300]") then
			Monster = "Cocoa Warrior [Lv. 2300]"
			NameQuest = "ChocQuest1"
			LevelQuest = 1
			NameMobQuest = "Cocoa Warrior"
			CFrameMon = CFrame.new(79.4172134399414, 73.42101287841797, -12310.0205078125)
			CFrameQuestLevel = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
		elseif (MyLevel == 2325 or MyLevel <= 2349) or (_G.SelectMob == "Chocolate Bar Battler [Lv. 2325]") then
			Monster = "Chocolate Bar Battler [Lv. 2325]"
			NameQuest = "ChocQuest1"
			LevelQuest = 2
			NameMobQuest = "Chocolate Bar Battler"
			CFrameMon = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
			CFrameQuestLevel = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
		elseif (MyLevel == 2350 or MyLevel <= 2374) or (_G.SelectMob == "Sweet Thief [Lv. 2350]") then
			Monster = "Sweet Thief [Lv. 2350]"
			NameQuest = "ChocQuest2"
			LevelQuest = 1
			NameMobQuest = "Sweet Thief"
			CFrameMon = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
			CFrameQuestLevel = CFrame.new(71.89511108398438, 77.21478271484375, -12632.435546875)
		elseif (MyLevel == 2375 or MyLevel <= 2399) or (_G.SelectMob == "Candy Rebel [Lv. 2375]") then
			Monster = "Candy Rebel [Lv. 2375]"
			NameQuest = "ChocQuest2"
			LevelQuest = 2
			NameMobQuest = "Candy Rebel"
			CFrameMon = CFrame.new(134.3748016357422, 77.21473693847656, -12882.1650390625)
			CFrameQuestLevel = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
		elseif (MyLevel == 2400 or MyLevel <= 2424) or (_G.SelectMob == "Candy Pirate [Lv. 2400]") then
			Monster = "Candy Pirate [Lv. 2400]"
			NameQuest = "CandyQuest1"
			LevelQuest = 1
			NameMobQuest = "Candy Pirate"
			CFrameMon = CFrame.new(-1271.6993408203125, 139.93331909179688, -14354.8515625)
			CFrameQuestLevel = CFrame.new(-1147.6552734375, 17.82676887512207, -14447.7099609375)
		elseif (MyLevel == 2425 or MyLevel <= 2449) or (_G.SelectMob == "Snow Demon [Lv. 2425]") then
			Monster = "Snow Demon [Lv. 2425]"
			NameQuest = "CandyQuest1"
			LevelQuest = 2
			NameMobQuest = "Snow Demon"
			CFrameMon = CFrame.new(-844.35546875, 138.32464599609375, -14496.455078125)
			CFrameQuestLevel = CFrame.new(-1147.6552734375, 17.82676887512207, -14447.7099609375)
		elseif (MyLevel == 2450 or MyLevel <= 2474) or (_G.SelectMob == "Isle Outlaw [Lv. 2450]") then
			Monster = "Isle Outlaw [Lv. 2450]"
			NameQuest = "TikiQuest1"
			LevelQuest = 1
			NameMobQuest = "Isle Outlaw"
			CFrameMon = CFrame.new(-16277.9599609375, 94.06755828857422, -168.73194885253906)
			CFrameQuestLevel = CFrame.new(-16545.927734375, 55.68635559082031, -173.01036071777344)
		elseif (MyLevel == 2475 or MyLevel <= 2499) or (_G.SelectMob == "Island Boy [Lv. 2475]") then
			Monster = "Island Boy [Lv. 2475]"
			NameQuest = "TikiQuest1"
			LevelQuest = 2
			NameMobQuest = "Island Boy"
			CFrameMon = CFrame.new(-16749.416015625, 125.9124755859375, -272.1277770996094)
			CFrameQuestLevel = CFrame.new(-16545.927734375, 55.68635559082031, -173.01036071777344)
		elseif (MyLevel == 2500 or MyLevel <= 2524) or (_G.SelectMob == "Sun-kissed Warrior [Lv. 2500]") then
			Monster = "Sun-kissed Warrior [Lv. 2500]"
			NameQuest = "TikiQuest2"
			LevelQuest = 1
			NameMobQuest = "kissed Warrior"
			CFrameMon = CFrame.new(-16277.009765625, 68.78734588623047, 1041.3009033203125)
			CFrameQuestLevel = CFrame.new(-16538.888671875, 55.68632888793945, 1051.730712890625)
		elseif (MyLevel == 2525 or MyLevel <= 2549) or (_G.SelectMob == "Isle Champion [Lv. 2525]") then
			Monster = "Isle Champion [Lv. 2525]"
			NameQuest = "TikiQuest2"
			LevelQuest = 2
			NameMobQuest = "Isle Champion"
			CFrameMon = CFrame.new(-16743.2421875, 137.21322631835938, 1148.2789306640625)
			CFrameQuestLevel = CFrame.new(-16538.888671875, 55.68632888793945, 1051.730712890625)
		elseif (MyLevel == 2550 or MyLevel <= 2574) or (_G.SelectMob == "Serpent Hunter [Lv. 2550]") then
			Monster = "Serpent Hunter [Lv. 2550]"
			NameQuest = "TikiQuest3"
			LevelQuest = 1
			NameMobQuest = "Serpent Hunter"
			CFrameMon = CFrame.new(-16585.32421875, 102.54767608642578, 1674.416259765625)
			CFrameQuestLevel = CFrame.new(-16665.1973, 104.56427, 1579.677, 0.70395112, 0, 0.710248411, 0, 1, 0, -0.710248411, 0, 0.70395112)
		elseif (MyLevel >= 2575) or (_G.SelectMob == "Skull Slayer [Lv. 2575]") then
			Monster = "Skull Slayer [Lv. 2575]"
			NameQuest = "TikiQuest3"
			LevelQuest = 1
			NameMobQuest = "Skull Slayer"
			CFrameMon = CFrame.new(-16585.32421875, 102.54767608642578, 1674.416259765625)
			CFrameQuestLevel = CFrame.new(-16665.1973, 104.56427, 1579.677, 0.70395112, 0, 0.710248411, 0, 1, 0, -0.710248411, 0, 0.70395112)
		end
	end
end
