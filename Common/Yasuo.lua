if myHero.charName ~= "Yasuo" then return end 

eUnits = {}
local contributors = {"Sida", "Nebelwolfi", "S1mple", "Shading", "KalZo", "cacturne", "ant 9999"}
local spinE, numKnockedEnemies, rangeQ = false, 0, false
local version = "0.6"
local AUTOUPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/Fret13103/Scripts1/master/Omega%20Yasuo.lua".."?rand="..math.random(1, 10000)
local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

function AutoupdaterMsg(msg) print("<font color=\"#6699ff\"><b>Omega Yasuo:</b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end

for i, contributor in pairs(contributors) do
	AutoupdaterMsg("Credits to ".. contributor)
end

if AUTOUPDATE then
	local ServerData = GetWebResult(UPDATE_HOST,"/Fret13103/Scripts1/master/Omega%20Yasuo.ver")
	--print(ServerData)
	if ServerData then
		--print("Has server Data")
		ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
		print(ServerVersion)
		if ServerVersion then
			if tonumber(version) < ServerVersion then
				AutoupdaterMsg("New version available "..ServerVersion)
				AutoupdaterMsg("Updating, please don't press F9")
				print("Updating")
				DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () AutoupdaterMsg("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version.") end) end, 2)
				--print("Updated")
			else
				AutoupdaterMsg("You have got the latest version ("..ServerVersion..")")
				AutoupdaterMsg("If your local version > server version then please report this")
			end
		end
	else
		AutoupdaterMsg("Error downloading version info")
	end
end

local Champions = {
    ["Lux"] = {charName = "Lux", skillshots = {
        ["Light Binding"] =  {name = "LightBinding", spellName = "LuxLightBinding", spellDelay = 250, projectileName = "LuxLightBinding_mis.troy", projectileSpeed = 1200, range = 1300, radius = 80, type = "line", cc = "true", collision = "false", shieldnow = "true"},
        ["Lux LightStrike Kugel"] = {name = "LuxLightStrikeKugel", spellName = "LuxLightStrikeKugel", spellDelay = 250, projectileName = "LuxLightstrike_mis.troy", projectileSpeed = 1400, range = 1100, radius = 275, type = "circular", cc = "false", collision = "false", shieldnow = "false"},
        ["Lux Malice Cannon"] =  {name = "LuxMaliceCannon", spellName = "LuxMaliceCannon", spellDelay = 1375, projectileName = "LuxMaliceCannon_cas.troy", projectileSpeed = 50000, range = 3500, radius = 190, type = "line", cc = "true", collision = "false", shieldnow = "true"},
        }},
    ["Nidalee"] = {charName = "Nidalee", skillshots = {
        ["Javelin Toss"] = {name = "JavelinToss", spellName = "JavelinToss", spellDelay = 125, projectileName = "nidalee_javelinToss_mis.troy", projectileSpeed = 1300, range = 1500, radius = 60, type = "line", cc = "true", collision = "true", shieldnow = "true"}
        }},
    ["Kennen"] = {charName = "Kennen", skillshots = {
        ["Thundering Shuriken"] = {name = "ThunderingShuriken", spellName = "KennenShurikenHurlMissile1", spellDelay = 180, projectileName = "kennen_ts_mis.troy", projectileSpeed = 1700, range = 1050, radius = 50, type = "line", cc = "false", collision = "true", shieldnow = "true"}
        }},
    ["Amumu"] = {charName = "Amumu", skillshots = {
        ["Bandage Toss"] = {name = "BandageToss", spellName = "BandageToss", spellDelay = 250, projectileName = "Bandage_beam.troy", projectileSpeed = 2000, range = 1100, radius = 80, type = "line", cc = "true", collision = "true", shieldnow = "true"}
        }},
    ["Lee Sin"] = {charName = "LeeSin", skillshots = {
        ["Sonic Wave"] = {name = "SonicWave", spellName = "BlindMonkQOne", spellDelay = 250, projectileName = "blindMonk_Q_mis_01.troy", projectileSpeed = 1800, range = 1100, radius = 70, type = "line", cc = "true", collision = "true", shieldnow = "true"}
        }},
    ["Morgana"] = {charName = "Morgana", skillshots = {
        ["Dark Binding Missile"] = {name = "DarkBinding", spellName = "DarkBindingMissile", spellDelay = 250, projectileName = "DarkBinding_mis.troy", projectileSpeed = 1200, range = 1300, radius = 80, type = "line", cc = "true", collision = "true", shieldnow = "true"},
        }},
    ["Sejuani"] = {charName = "Sejuani", skillshots = {
        ["SejuaniR"] = {name = "SejuaniR", spellName = "SejuaniGlacialPrisonCast", spellDelay = 250, projectileName = "Sejuani_R_mis.troy", projectileSpeed = 1600, range = 1200, radius = 110, type="line", cc = "true", collision = "false", shieldnow = "true"},    
        }},
    ["Sona"] = {charName = "Sona", skillshots = {
        ["Crescendo"] = {name = "Crescendo", spellName = "SonaCrescendo", spellDelay = 240, projectileName = "SonaCrescendo_mis.troy", projectileSpeed = 2400, range = 1000, radius = 160, type = "line", cc = "true", collision = "false", shieldnow = "true"},        
        }},
    ["Gragas"] = {charName = "Gragas", skillshots = {
        ["Barrel Roll"] = {name = "BarrelRoll", spellName = "GragasBarrelRoll", spellDelay = 250, projectileName = "gragas_barrelroll_mis.troy", projectileSpeed = 1000, range = 1115, radius = 180, type = "circular", cc = "false", collision = "false", shieldnow = "false"},
        ["Barrel Roll Missile"] = {name = "BarrelRollMissile", spellName = "GragasBarrelRollMissile", spellDelay = 0, projectileName = "gragas_barrelroll_mis.troy", projectileSpeed = 1000, range = 1115, radius = 180, type = "circular", cc = "false", collision = "false", shieldnow = "false"},
        }},
    ["Syndra"] = {charName = "Syndra", skillshots = {
        ["Q"] = {name = "Q", spellName = "SyndraQ", spellDelay = 250, projectileName = "Syndra_Q_fall.troy", projectileSpeed = 500, range = 825, radius = 175, type = "circular", cc = "false", collision = "false", shieldnow = "true"},
        ["W"] = {name = "W", spellName = "syndrawcast", spellDelay = 250, projectileName = "Syndra_W_fall.troy", projectileSpeed = 500, range = 950, radius = 200, type = "circular", cc = "false", collision = "false", shieldnow = "true"},
        }},
    ["Malphite"] = {charName = "Malphite", skillshots = {
        ["UFSlash"] = {name = "UFSlash", spellName = "UFSlash", spellDelay = 0, projectileName = "UnstoppableForce_cas.troy", projectileSpeed = 550, range = 1000, radius = 300, type="circular", cc = "true", collision = "false", shieldnow = "true"},    
        }},
    ["Ezreal"] = {charName = "Ezreal", skillshots = {
        ["Mystic Shot"]             = {name = "MysticShot",      spellName = "EzrealMysticShot",      spellDelay = 250, projectileName = "Ezreal_mysticshot_mis.troy",  projectileSpeed = 2000, range = 1200,  radius = 80,  type = "line", cc = "false", collision = "true", shieldnow = "true"},
        ["Essence Flux"]            = {name = "EssenceFlux",     spellName = "EzrealEssenceFlux",     spellDelay = 250, projectileName = "Ezreal_essenceflux_mis.troy", projectileSpeed = 1500, range = 1050,  radius = 80,  type = "line", cc = "false", collision = "false", shieldnow = "true"},
        ["Mystic Shot (Pulsefire)"] = {name = "MysticShot",      spellName = "EzrealMysticShotPulse", spellDelay = 250, projectileName = "Ezreal_mysticshot_mis.troy",  projectileSpeed = 2000, range = 1200,  radius = 80,  type = "line", cc = "false", collision = "true", shieldnow = "true"},
        ["Trueshot Barrage"]        = {name = "TrueshotBarrage", spellName = "EzrealTrueshotBarrage", spellDelay = 1000, projectileName = "Ezreal_TrueShot_mis.troy",    projectileSpeed = 2000, range = 20000, radius = 160, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        }},
    ["Ahri"] = {charName = "Ahri", skillshots = {
        ["Orb of Deception"] = {name = "OrbofDeception", spellName = "AhriOrbofDeception", spellDelay = 250, projectileName = "Ahri_Orb_mis.troy", projectileSpeed = 2500, range = 900, radius = 100, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        ["Orb of Deception Back"] = {name = "OrbofDeceptionBack", spellName = "AhriOrbofDeceptionherpityderp", spellDelay = 250+360, projectileName = "Ahri_Orb_mis_02.troy", projectileSpeed = 915, range = 900, radius = 100, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        ["Charm"] = {name = "Charm", spellName = "AhriSeduce", spellDelay = 250, projectileName = "Ahri_Charm_mis.troy", projectileSpeed = 1000, range = 1000, radius = 60, type = "line", cc = "true", collision = "true", shieldnow = "true"}
        }},
    ["Olaf"] = {charName = "Olaf", skillshots = {
        ["Undertow"] = {name = "Undertow", spellName = "OlafAxeThrow", spellDelay = 250, projectileName = "olaf_axe_mis.troy", projectileSpeed = 1600, range = 1000, radius = 90, type = "line", cc = "true", collision = "false", shieldnow = "true"}
        }},
    ["Leona"] = {charName = "Leona", skillshots = {
        ["Zenith Blade"] = {name = "LeonaZenithBlade", spellName = "LeonaZenithBlade", spellDelay = 250, projectileName = "Leona_ZenithBlade_mis.troy", projectileSpeed = 2000, range = 950, radius = 110, type = "line", cc = "true", collision = "false", shieldnow = "true"},
        ["Leona Solar Flare"] = {name = "LeonaSolarFlare", spellName = "LeonaSolarFlare", spellDelay = 250, projectileName = "Leona_SolarFlare_cas.troy", projectileSpeed = 1500, range = 1200, radius = 300, type = "circular", cc = "true", collision = "false", shieldnow = "true"}
        }},
    ["Karthus"] = {charName = "Karthus", skillshots = {
        ["Lay Waste"] = {name = "LayWaste", spellName = "LayWaste", spellDelay = 250, projectileName = "LayWaste_point.troy", projectileSpeed = 1750, range = 875, radius = 140, type = "circular", cc = "false", collision = "false", shieldnow = "true"}
        }},
    ["Chogath"] = {charName = "Chogath", skillshots = {
        ["Rupture"] = {name = "Rupture", spellName = "Rupture", spellDelay = 0, projectileName = "rupture_cas_01_red_team.troy", projectileSpeed = 950, range = 950, radius = 250, type = "circular", cc = "true", collision = "false", shieldnow = "true"}
        }},
    ["Blitzcrank"] = {charName = "Blitzcrank", skillshots = {
        ["Rocket Grab"] = {name = "RocketGrab", spellName = "RocketGrabMissile", spellDelay = 250, projectileName = "FistGrab_mis.troy", projectileSpeed = 1800, range = 1250, radius = 70, type = "line", cc = "true", collision = "true", shieldnow = "true"},
        }},
    ["Anivia"] = {charName = "Anivia", skillshots = {
        ["Flash Frost"] = {name = "FlashFrost", spellName = "FlashFrostSpell", spellDelay = 250, projectileName = "cryo_FlashFrost_mis.troy", projectileSpeed = 850, range = 1100, radius = 110, type = "line", cc = "true", collision = "false", shieldnow = "true"}
        }},
    ["Zyra"] = {charName = "Zyra", skillshots = {
        ["Grasping Roots"] = {name = "GraspingRoots", spellName = "ZyraGraspingRoots", spellDelay = 250, projectileName = "Zyra_E_sequence_impact.troy", projectileSpeed = 1150, range = 1150, radius = 70,  type = "line", cc = "true", collision = "false", shieldnow = "true"},
        ["Zyra Passive Death"] = {name = "ZyraPassive", spellName = "zyrapassivedeathmanager", spellDelay = 500, projectileName = "zyra_passive_plant_mis.troy", projectileSpeed = 2000, range = 1474, radius = 60,  type = "line", cc = "false", collision = "false", shieldnow = "true"},
        }},
    ["Nautilus"] = {charName = "Nautilus", skillshots = {
        ["Dredge Line"] = {name = "DredgeLine", spellName = "NautilusAnchorDrag", spellDelay = 250, projectileName = "Nautilus_Q_mis.troy", projectileSpeed = 2000, range = 1080, radius = 80, type = "line", cc = "true", collision = "true", shieldnow = "true"},
        }},
    ["Caitlyn"] = {charName = "Caitlyn", skillshots = {
        ["Piltover Peacemaker"] = {name = "PiltoverPeacemaker", spellName = "CaitlynPiltoverPeacemaker", spellDelay = 625, projectileName = "caitlyn_Q_mis.troy", projectileSpeed = 2200, range = 1300, radius = 90, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        ["Caitlyn Entrapment"] = {name = "CaitlynEntrapment", spellName = "CaitlynEntrapment", spellDelay = 150, projectileName = "caitlyn_entrapment_mis.troy", projectileSpeed = 2000, range = 950, radius = 80, type = "line", cc = "true", collision = "true", shieldnow = "true"},
        }},
    ["Mundo"] = {charName = "DrMundo", skillshots = {
        ["Infected Cleaver"] = {name = "InfectedCleaver", spellName = "InfectedCleaverMissile", spellDelay = 250, projectileName = "dr_mundo_infected_cleaver_mis.troy", projectileSpeed = 2000, range = 1050, radius = 75, type = "line", cc = "true", collision = "true", shieldnow = "true"},
        }},
    ["Brand"] = {charName = "Brand", skillshots = {
        ["BrandBlaze"] = {name = "BrandBlaze", spellName = "BrandBlaze", spellDelay = 250, projectileName = "BrandBlaze_mis.troy", projectileSpeed = 1600, range = 1100, radius = 80, type = "line", cc = "true", collision = "true", shieldnow = "true"},
        ["Pillar of Flame"] = {name = "PillarofFlame", spellName = "BrandFissure", spellDelay = 250, projectileName = "BrandPOF_tar_green.troy", projectileSpeed = 900, range = 1100, radius = 240, type = "circular", cc = "false", collision = "false", shieldnow = "true"}
        }},
    ["Corki"] = {charName = "Corki", skillshots = {
        ["Missile Barrage"] = {name = "MissileBarrage", spellName = "MissileBarrage", spellDelay = 250, projectileName = "corki_MissleBarrage_mis.troy", projectileSpeed = 2000, range = 1300, radius = 40, type = "line", cc = "false", collision = "true", shieldnow = "true"},
        ["Missile Barrage big"] = {name = "MissileBarragebig", spellName = "MissileBarrage!", spellDelay = 250, projectileName = "Corki_MissleBarrage_DD_mis.troy", projectileSpeed = 2000, range = 1300, radius = 40, type = "line", cc = "false", collision = "true", shieldnow = "true"}
        }},
    ["TwistedFate"] = {charName = "TwistedFate", skillshots = {
        ["Loaded Dice"] = {name = "LoadedDice", spellName = "WildCards", spellDelay = 250, projectileName = "Roulette_mis.troy", projectileSpeed = 1000, range = 1450, radius = 40, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        }},
    ["Swain"] = {charName = "Swain", skillshots = {
        ["Nevermove"] = {name = "Nevermove", spellName = "SwainShadowGrasp", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", projectileSpeed = 1000, range = 900, radius = 180, type = "circular", cc = "true", collision = "false", shieldnow = "true"}
        }},
    ["Cassiopeia"] = {charName = "Cassiopeia", skillshots = {
        ["Noxious Blast"] = {name = "NoxiousBlast", spellName = "CassiopeiaNoxiousBlast", spellDelay = 250, projectileName = "CassNoxiousSnakePlane_green.troy", projectileSpeed = 500, range = 850, radius = 130, type = "circular", cc = "false", collision = "false", shieldnow = "true"},
        }},
    ["Sivir"] = {charName = "Sivir", skillshots = {
        ["Boomerang Blade"] = {name = "BoomerangBlade", spellName = "SivirQ", spellDelay = 250, projectileName = "Sivir_Base_Q_mis.troy", projectileSpeed = 1350, range = 1175, radius = 101, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        }},
    ["Ashe"] = {charName = "Ashe", skillshots = {
        ["Enchanted Arrow"] = {name = "EnchantedArrow", spellName = "EnchantedCrystalArrow", spellDelay = 250, projectileName = "Ashe_Base_R_mis.troy", projectileSpeed = 1600, range = 25000, radius = 120, type = "line", cc = "true", collision = "false", shieldnow = "true"},
        }},
    ["KogMaw"] = {charName = "KogMaw", skillshots = {
        ["Living Artillery"] = {name = "LivingArtillery", spellName = "KogMawLivingArtillery", spellDelay = 250, projectileName = "KogMawLivingArtillery_mis.troy", projectileSpeed = 1050, range = 2200, radius = 225, type = "circular", cc = "false", collision = "false", shieldnow = "true"}
        }},
    ["Khazix"] = {charName = "Khazix", skillshots = {
        ["KhazixW"] = {name = "KhazixW", spellName = "KhazixW", spellDelay = 250, projectileName = "Khazix_W_mis_enhanced.troy", projectileSpeed = 1700, range = 1025, radius = 70, type = "line", cc = "true", collision = "true", shieldnow = "true"},
        ["khazixwlong"] = {name = "khazixwlong", spellName = "khazixwlong", spellDelay = 250, projectileName = "Khazix_W_mis_enhanced.troy", projectileSpeed = 1700, range = 1025, radius = 70, type = "line", cc = "true", collision = "true", shieldnow = "true"},
        }},
    ["Zed"] = {charName = "Zed", skillshots = {
        ["ZedQ"] = {name = "ZedQ", spellName = "ZedQ", spellDelay = 250, projectileName = "Zed_Q_Mis.troy", projectileSpeed = 1700, range = 925, radius = 50, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        }},
    ["Leblanc"] = {charName = "Leblanc", skillshots = {
        ["Ethereal Chains"] = {name = "EtherealChains", spellName = "LeblancSoulShackle", spellDelay = 250, projectileName = "leBlanc_shackle_mis.troy", projectileSpeed = 1600, range = 960, radius = 70, type = "line", cc = "true", collision = "true", shieldnow = "true"},
        ["Ethereal Chains R"] = {name = "EtherealChainsR", spellName = "LeblancSoulShackleM", spellDelay = 250, projectileName = "leBlanc_shackle_mis_ult.troy", projectileSpeed = 1600, range = 960, radius = 70, type = "line", cc = "true", collision = "true", shieldnow = "true"},
        }},
    ["Draven"] = {charName = "Draven", skillshots = {
        ["Stand Aside"] = {name = "StandAside", spellName = "DravenDoubleShot", spellDelay = 250, projectileName = "Draven_E_mis.troy", projectileSpeed = 1400, range = 1100, radius = 130, type = "line", cc = "true", collision = "false", shieldnow = "true"},
        ["DravenR"] = {name = "DravenRCast", spellName = "DravenRCast", spellDelay = 500, projectileName = "Draven_R_mis!.troy", projectileSpeed = 2000, range = 25000, radius = 160, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        }},
    ["Elise"] = {charName = "Elise", skillshots = {
        ["Cocoon"] = {name = "Cocoon", spellName = "EliseHumanE", spellDelay = 250, projectileName = "Elise_human_E_mis.troy", projectileSpeed = 1450, range = 1100, radius = 70, type = "line", cc = "true", collision = "true", shieldnow = "true"}
        }},
    ["Lulu"] = {charName = "Lulu", skillshots = {
        ["LuluQ"] = {name = "LuluQ", spellName = "LuluQ", spellDelay = 250, projectileName = "Lulu_Q_Mis.troy", projectileSpeed = 1450, range = 1000, radius = 50, type = "line", cc = "true", collision = "false", shieldnow = "true"}
        }},
    ["Thresh"] = {charName = "Thresh", skillshots = {
        ["ThreshQ"] = {name = "ThreshQ", spellName = "ThreshQ", spellDelay = 500, projectileName = "Thresh_Q_whip_beam.troy", projectileSpeed = 1900, range = 1100, radius = 65, type = "line", cc = "true", collision = "true", shieldnow = "true"}
        }},
    ["Shen"] = {charName = "Shen", skillshots = {
        ["ShadowDash"] = {name = "ShadowDash", spellName = "ShenShadowDash", spellDelay = 0, projectileName = "shen_shadowDash_mis.troy", projectileSpeed = 3000, range = 575, radius = 50, type = "line", cc = "true", collision = "false", shieldnow = "true"}
        }},
    ["Quinn"] = {charName = "Quinn", skillshots = {
        ["QuinnQ"] = {name = "QuinnQ", spellName = "QuinnQ", spellDelay = 250, projectileName = "Quinn_Q_missile.troy", projectileSpeed = 1550, range = 1050, radius = 80, type = "line", cc = "false", collision = "true", shieldnow = "true"}
        }},
    ["Veigar"] = {charName = "Veigar", skillshots = {
        ["Dark Matter"] = {name = "VeigarDarkMatter", spellName = "VeigarDarkMatter", spellDelay = 250, projectileName = "!", projectileSpeed = 900, range = 900, radius = 225, type = "circular", cc = "false", collision = "false", shieldnow = "true"}
        }},
    ["Jayce"] = {charName = "Jayce", skillshots = {
        ["JayceShockBlast"] = {name = "JayceShockBlast", spellName = "jayceshockblast", spellDelay = 250, projectileName = "JayceOrbLightning.troy", projectileSpeed = 1450, range = 1050, radius = 70, type = "line", cc = "false", collision = "true", shieldnow = "true"},
        ["JayceShockBlastCharged"] = {name = "JayceShockBlastCharged", spellName = "jayceshockblast", spellDelay = 250, projectileName = "JayceOrbLightningCharged.troy", projectileSpeed = 2350, range = 1600, radius = 70, type = "line", cc = "false", collision = "true", shieldnow = "true"},
        }},
    ["Nami"] = {charName = "Nami", skillshots = {
        ["NamiQ"] = {name = "NamiQ", spellName = "NamiQ", spellDelay = 250, projectileName = "Nami_Q_mis.troy", projectileSpeed = 1500, range = 1625, radius = 225, type = "circular", cc = "true", collision = "false", shieldnow = "true", block = true}
        }},
    ["Fizz"] = {charName = "Fizz", skillshots = {
        ["Fizz Ultimate"] = {name = "FizzMarinerDoom", spellName = "FizzMarinerDoom", spellDelay = 250, projectileName = "Fizz_UltimateMissile.troy", projectileSpeed = 1350, range = 1275, radius = 80, type = "line", cc = "true", collision = "false", shieldnow = "true"},
        }},
    ["Varus"] = {charName = "Varus", skillshots = {
        ["Varus Q Missile"] = {name = "VarusQ", spellName = "VarusQ", spellDelay = 0, projectileName = "VarusQ_mis.troy", projectileSpeed = 1900, range = 1600, radius = 70, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        ["VarusR"] = {name = "VarusR", spellName = "VarusR", spellDelay = 250, projectileName = "VarusRMissile.troy", projectileSpeed = 1950, range = 1950, radius = 100, type = "line", cc = "true", collision = "false", shieldnow = "true"},
        }},
    ["Karma"] = {charName = "Karma", skillshots = {
        ["KarmaQ"] = {name = "KarmaQ", spellName = "KarmaQ", spellDelay = 250, projectileName = "TEMP_KarmaQMis.troy", projectileSpeed = 1700, range = 1050, radius = 90, type = "line", cc = "true", collision = "true", shieldnow = "true"},
        }},
    ["Aatrox"] = {charName = "Aatrox", skillshots = {
        ["Blade of Torment"] = {name = "BladeofTorment", spellName = "AatroxE", spellDelay = 250, projectileName = "AatroxBladeofTorment_mis.troy", projectileSpeed = 1200, range = 1075, radius = 75, type = "line", cc = "true", collision = "false", shieldnow = "true"},
        ["AatroxQ"] = {name = "AatroxQ", spellName = "AatroxQ", spellDelay = 250, projectileName = "AatroxQ.troy", projectileSpeed = 450, range = 650, radius = 145, type = "circular", cc = "true", collision = "false", shieldnow = "true"},
        }},
    ["Xerath"] = {charName = "Xerath", skillshots = {
        ["Xerath Arcanopulse"] =  {name = "XerathArcanopulse", spellName = "XerathArcanopulse", spellDelay = 1375, projectileName = "Xerath_Beam_cas.troy", projectileSpeed = 25000, range = 1025, radius = 100, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        ["Xerath Arcanopulse Extended"] =  {name = "XerathArcanopulseExtended", spellName = "xeratharcanopulseextended", spellDelay = 1375, projectileName = "Xerath_Beam_cas.troy", projectileSpeed = 25000, range = 1625, radius = 100, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        ["xeratharcanebarragewrapper"] = {name = "xeratharcanebarragewrapper", spellName = "xeratharcanebarragewrapper", spellDelay = 250, projectileName = "Xerath_E_cas.troy", projectileSpeed = 300, range = 1100, radius = 265, type = "circular", cc = "false", collision = "false", shieldnow = "true"},
        ["xeratharcanebarragewrapperext"] = {name = "xeratharcanebarragewrapperext", spellName = "xeratharcanebarragewrapperext", spellDelay = 250, projectileName = "Xerath_E_cas.troy", projectileSpeed = 300, range = 1700, radius = 265, type = "circular", cc = "false", collision = "false", shieldnow = "true"},
        }},
    ["Lucian"] = {charName = "Lucian", skillshots = {
        ["LucianQ"] =  {name = "LucianQ", spellName = "LucianQ", spellDelay = 350, projectileName = "Lucian_Q_laser.troy", projectileSpeed = 25000, range = 570*2, radius = 65, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        ["LucianW"] =  {name = "LucianW", spellName = "LucianW", spellDelay = 300, projectileName = "Lucian_W_mis.troy", projectileSpeed = 1600, range = 1000, radius = 80, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        }},
    ["Viktor"] = {charName = "Viktor", skillshots = {
        ["ViktorDeathRay1"] =  {name = "ViktorDeathRay1", spellName = "ViktorDeathRay!", spellDelay = 500, projectileName = "Viktor_DeathRay_Fix_Mis.troy", projectileSpeed = 780, range = 700, radius = 80, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        ["ViktorDeathRay2"] =  {name = "ViktorDeathRay2", spellName = "ViktorDeathRay!", spellDelay = 500, projectileName = "Viktor_DeathRay_Fix_Mis_Augmented.troy", projectileSpeed = 780, range = 700, radius = 80, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        }},
    ["Rumble"] = {charName = "Rumble", skillshots = {
        ["RumbleGrenade"] =  {name = "RumbleGrenade", spellName = "RumbleGrenade", spellDelay = 250, projectileName = "rumble_taze_mis.troy", projectileSpeed = 2000, range = 950, radius = 90, type = "line", cc = "true", collision = "true", shieldnow = "true"},
        }},
    ["Nocturne"] = {charName = "Nocturne", skillshots = {
        ["NocturneDuskbringer"] =  {name = "NocturneDuskbringer", spellName = "NocturneDuskbringer", spellDelay = 250, projectileName = "NocturneDuskbringer_mis.troy", projectileSpeed = 1400, range = 1125, radius = 60, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        }},
    ["Yasuo"] = {charName = "Yasuo", skillshots = {
        ["yasuoq3"] =  {name = "yasuoq3", spellName = "yasuoq3w", spellDelay = 250, projectileName = "Yasuo_Q_wind_mis.troy", projectileSpeed = 1200, range = 1000, radius = 80, type = "line", cc = "true", collision = "false", shieldnow = "true"},
        ["yasuoq1"] =  {name = "yasuoq1", spellName = "yasuoQW", spellDelay = 250, projectileName = "Yasuo_Q_WindStrike.troy", projectileSpeed = 25000, range = 475, radius = 40, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        ["yasuoq2"] =  {name = "yasuoq2", spellName = "yasuoq2w", spellDelay = 250, projectileName = "Yasuo_Q_windstrike_02.troy", projectileSpeed = 25000, range = 475, radius = 40, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        }},
    ["Orianna"] = {charName = "Orianna", skillshots = {
        ["OrianaIzunaCommand"] =  {name = "OrianaIzunaCommand", spellName = "OrianaIzunaCommand", spellDelay = 0, projectileName = "Oriana_Ghost_mis.troy", projectileSpeed = 1300, range = 800, radius = 80, type = "line", cc = "true", collision = "false", shieldnow = "true"},
        ["OrianaDetonateCommand"] =  {name = "OrianaDetonateCommand", spellName = "OrianaDetonateCommand", spellDelay = 100, projectileName = "Oriana_Shockwave_nova.troy", projectileSpeed = 400, range = 2000, radius = 400, type = "circular", cc = "true", collision = "false", shieldnow = "true"},   
        }},
    ["Ziggs"] = {charName = "Ziggs", skillshots = {
        ["ZiggsQ"] =  {name = "ZiggsQ", spellName = "ZiggsQ", spellDelay = 250, projectileName = "ZiggsQ.troy", projectileSpeed = 1700, range = 1400, radius = 155, type = "line", cc = "false", collision = "true", shieldnow = "true"},
        }},
    ["Annie"] = {charName = "Annie", skillshots = {
        ["AnnieR"] =  {name = "AnnieR", spellName = "InfernalGuardian", spellDelay = 100, projectileName = "nothing", projectileSpeed = 0, range = 600, radius = 300, type = "circular", cc = "true", collision = "false", shieldnow = "true"},
        }},
    ["Galio"] = {charName = "Galio", skillshots = {
        ["GalioResoluteSmite"] =  {name = "GalioResoluteSmite", spellName = "GalioResoluteSmite", spellDelay = 250, projectileName = "galio_concussiveBlast_mis.troy", projectileSpeed = 850, range = 2000, radius = 200, type = "circular", cc = "true", collision = "false", shieldnow = "true"},
        }},
    ["Jinx"] = {charName = "Jinx", skillshots = {
        ["W"] =  {name = "Zap", spellName = "JinxW", spellDelay = 600, projectileName = "Jinx_W_Beam.troy", projectileSpeed = 3300, range = 1450, radius = 70, type = "line", cc = "true", collision = "true", shieldnow = "true"},
        ["R"] =  {name = "SuperMegaDeathRocket", spellName = "JinxRWrapper", spellDelay = 600, projectileName = "Jinx_R_Mis.troy", projectileSpeed = 1700, range = 20000, radius = 120, type = "line", cc = "false", collision = "false", shieldnow = "true"},
        }}, 
		["VelKoz"] = {charName = "Velkoz", skillshots = {
					["VelkozQ"] = {name = "VelkozQ", spellName = "VelkozQ", spellDelay = 00, projectileName = "VelkozQMissile.mis", projectileSpeed = 1200, range = 1100, radius = 80, type = "line", cc = "true", collision = "true", shieldnow = "false"},
					["VelkozW"] = {name = "VelkozW", spellName = "VelkozW", spellDelay = 00, projectileName = "VelkozWMissile.mis", projectileSpeed = 1200, range = 1100, radius = 110, type = "line", cc = "false", collision = "false", shieldnow = "false"}
					}},
		["Braum"] = {charName = "Braum", skillshots = {
					["BraumQ"] = {name = "BraumQ", spellName = "BraumQ", spellDelay = 00, projectileName = "BraumQMissile.mis", projectileSpeed = 1000, range = 1100, radius = 100, type = "line", cc = "true", collision = "true", shieldnow = "false"},
					["BraumRWrapper"] = {name = "BraumRWrapper", spellName = "BraumRWrapper", spellDelay = 00, projectileName = "BraumRWrapper.mis", projectileSpeed = 1000, range = 1300, radius = 190, type = "line", cc = "false", collision = "false", shieldnow = "true"}
					}},
		["Gnar"] = {charName = "Gnar", skillshots = {
					["GnarQ"] = {name = "GnarQ", spellName = "GnarQ", spellDelay = 00, projectileName = "gnarqmissile.mis", projectileSpeed = 1400, range = 1125, radius = 80, type = "line", cc = "true", collision = "true", shieldnow = "false"},
					["gnarbigq"] = {name = "gnarbigq", spellName = "gnarbigq", spellDelay = 00, projectileName = "gnarbigqmissile.mis", projectileSpeed = 800, range = 1125, radius = 140, type = "line", cc = "true", collision = "true", shieldnow = "false"}
					}},
		["Kalista"] = {charName = "Kalista", skillshots = {
					["KalistaMysticShot"] = {name = "Kalista Spear Throw", spellName = "KalistaMysticShot", spellDelay = 100, projectileName = "kalistamysticshotmis", projectileSpeed = 1200, range = 1200, radius = 70, type = "line", cc = "false", collision = "true", shieldnow = "false"}
					}},
		["RekSai"] = {charName = "RekSai", skillshots = {
					["reksaiqburrowed"] = {name = "Reksai Q", spellName = "reksaiqburrowed", spellDelay = 00, projectileName = "ReksaiQBurrowedMis", projectileSpeed = 1400, range = 1500, radius = 100, type = "line", cc = "true", collision = "true", shieldnow = "false"}
					}},
		["Ekko"] = {charName = "Ekko", skillshots = {
					["EkkoQ"] = {name = "EkkoQ", spellName = "EkkoQ", spellDelay = 00, projectileName = "ekkoqmis", projectileSpeed = 1000, range = 1050, radius = 210, type = "line", cc = "true", collision = "false", shieldnow = "true"}
					}},
		
		["Bard"] = {charName = "Bard", skillshots = {
					["BardQ"] = {name = "CosmicQ", spellName = "BardQ", spellDelay = 100, projectileName = "bardqmissile", projectileSpeed = 1200, range = 950, radius = 120, type = "line", cc = "tru", collision = "true", shieldnow = "true"}
					}},
		["TahmKench"] = {charName = "TahmKench", skillshots = {
					["TahmKenchQ"] = {name = "TahmKenchQ", spellName = "TahmKenchQ", spellDelay = 100, projectileName = "tahmkenchqmissile", projectileSpeed = 800, range = 850, radius = 120, type = "line", cc = "true", collision = "true", shieldnow = "true"},
					["tahmkenchw"] = {name = "tahmkenchwspitready", spellName = "tahmkenchwspitready", spellDelay = 80, projectileName = "tahmkenchwcasttimeandanimation", projectileSpeed = 1200, range = 1050, radius = 200, type = "line", cc = "true", collision = "true", shieldnow = "true"}
					}},
		["Riven"] = {charName = "Riven", skillshots = {
					["rivenizunablade"] = {name = "rivenizunablade", spellName = "rivenizunablade", spellDelay = 0, projectileName = "RivenWindslashMissileCenter", projectileSpeed = 1000, range = 1100, radius = 700, type = "cone", cc = "false", collision = "false", shieldnow = "true"}
					}},
		["Talon"] = {charName = "Talon", skillshots = {
					["TalonRake"] = {name = "TalonRake", spellName = "TalonRake", spellDelay = 0, projectileName = "talonrakemissileone", projectileSpeed = 1200, range = 800, radius = 450, type = "cone", cc = "false", collision = "false", shieldnow = "false"},
					["TalonShadowAssault"] = {name = "TalonShadowAssault", spellName = "TalonShadowAssault", spellDelay = 0, projectileName = "TalonShadowAssaultMisTwo", projectileSpeed = 1200, range = 1200, radius = 1200, type = "circular", cc = "false", collision = "false", shieldnow = "false", block = true}
					}},
		["Diana"] = {charName = "Diana", skillshots = {
					["DianaArc"] = {name = "DianaArc", spellName = "DianaArk", spellDelay = 0, projectileName = "dianaarcthrow", projectileSpeed = 1200, range = 900, radius = 200, type = "line", collision = "false", shieldnow = "false"}
					}}
        }

local targetedSpells = {
			
		}

local isSx
local isSac
local VP
require "VPrediction"
require "UPL"
UPL = UPL()

local turrets = {}
local turretRange = 1000
local closestturret = nil

function SkillShotLoad()
	config.spec:addSubMenu(""..myHero.charName.." - WindWall Settings", "blocks")
	config.spec:addParam("humanizer", "Humanize delay (ms)", SCRIPT_PARAM_SLICE, 200, 0, 1000, 0)
  config.spec:addParam("humanizer2", "Humanize dash delay (ms)", SCRIPT_PARAM_SLICE, 200, 0, 1000, 0)
	config.spec.blocks:addParam("autoW", "Windwall skillshots ", SCRIPT_PARAM_ONOFF, true)
	config.spec.blocks:addParam("autoE", "Dash skillshots with E ", SCRIPT_PARAM_ONOFF, true)

for i, hero in pairs(GetEnemyHeroes()) do
    if Champions[hero.charName] ~= nil then
      for index, skillshot in pairs(Champions[hero.charName].skillshots) do
          config.spec.blocks:addParam(skillshot.spellName, hero.charName .. " - " .. skillshot.name, SCRIPT_PARAM_ONOFF, true)
					name = skillshot.spellName .. "padding"
					config.spec.blocks:addParam(name, skillshot.spellName .. " - " .. "Extra width", SCRIPT_PARAM_SLICE, 50, 0, 200, 0)
        end
			end
		end
end

function OnLoad()

	turrets = GetTurrets()
	range = 950
	closestturret = nil

	config = scriptConfig("Omega Yasuo", "")
	config:addSubMenu("Skillshots", "spec")
	config.spec:addParam("info", "block / dont block skillshots", SCRIPT_PARAM_INFO, "")
	config:addParam("devMode", "devMode", SCRIPT_PARAM_ONOFF, true)
	SkillShotLoad()
	Menu()
end

local currentPolygons = {}
local currentDrawPolygons = {}
local currentCircles = {}
-- layout = {object name, polygon, startPos} so I can delete poly in OnRemoveObject and W the start point of the spell easily. 
-- layout = {object name, endPos, radius} easy circular dodge lazymode.

local eStacks = 0

function OnProcessSpell(unit, spell)
	if player.dead then return end
	if spell.name == "YasuoDashWrapper" then
table.insert(eUnits, spell.target)
local num = #eUnits
spinE = true
eStacks = eStacks + 1
	DelayAction(function() spinE = false DelayAction(function() eStacks = eStacks - 1  DelayAction(function() table.remove(eUnits, num) end, 3.5 - myHero:GetSpellData(_E).level) end, 5) end, 1.5)
return
end
	local CN = unit.charName
	local SN = spell.name
	local skillshot = nil
	--if Champions[unit.charName],   skill in pairs(champions[unitname].skillshots if spellname == spell.name 
	if config.spec.blocks.autoW or config.spec.blocks.autoE and config.spec.blocks[spell.spellName] or config.spec.blocks[spell.name] then
		if unit.type == myHero.type and unit.team ~= myHero.team and Champions[unit.charName] then
			for i, skill in pairs(Champions[unit.charName].skillshots) do
				if spell.name == skill.name or spell.spellName == skill.spellName or spell.name == skill.spellName then
					skillshot = skill
				end
			end
			if skillshot ~= nil then
				type = skillshot.type
				range = skillshot.range
				width = skillshot.radius + config.spec.blocks[skillshot.spellName .. "padding"]
				speed = skillshot.projectileSpeed
				
				local Start = Vector(spell.startPos)
				local End = Vector(spell.endPos)
				local SEV = Vector(End - Start)
				local End = Start + Vector(SEV):normalized() * range
				local block = skillshot and skillshot.block or false
				
				if type == "line" then
					
					local P1 = Vector(Start) + Vector(SEV):perpendicular():normalized() * width / 2
					local P2 = Vector(End) + Vector(SEV):perpendicular():normalized() * width / 2
					local P3 = Vector(End) + Vector(SEV):perpendicular2():normalized() * width / 2
					local P4 = Vector(Start) + Vector(SEV):perpendicular2():normalized() * width / 2
					
					local poly = Polygon(Point(P1.x, P1.z), Point(P2.x, P2.z), Point(P3.x, P3.z), Point(P4.x, P4.z))
					
					local expiry_date = GetInGameTimer() + range / speed
					local Vectors = {P1, P2, P3, P4}
					
					local drawPoly = {spell.name, Vectors, expiry_date}
					local Table = {spell.name, poly, Vector(Start), expiry_date}
					
					table.insert(currentPolygons, Table)
					table.insert(currentDrawPolygons, drawPoly)
					
				elseif type == "circular" then
					 
					local data = {spell.name, spell.endPos, width, (GetInGameTimer() + 15), block, Start}
					table.insert(currentCircles, data)
						
				elseif type == "cone" then
					
					local P1 = Vector(Start)
					local P2 = Vector(Start) + SEV + SEV:perpendicular():normalized() * width / 2
					local P3 = Vector(Start) + SEV + SEV:perpendicular2():normalized() * width / 2
					
					local expiry_date = GetInGameTimer() + range / speed
					local Vectors = {P1, P2, P3}
					
					local poly = Polygon(Point(P1.x, P1.z), Point(P2.x, P2.z), Point(P3.x, P3.z))
					
					local drawPoly = {spell.name, Vectors, expiry_date}
					local Table = {spell.name, poly, P1, expiry_date}
					
					table.insert(currentPolygons, Table)
					table.insert(currentDrawPolygons, drawPoly)
				end
			end
		end
	end
end

function OnDeleteObj(obj)
	if obj and (obj.name=="Yasuo_base_R_indicator_beam.troy" or obj.name=="Yasuo_Skin02_R_indicator_beam.troy") then
		numKnockedEnemies = numKnockedEnemies - 1
	end -- Knocked up. Insert pregnancy pun here.
	if obj.name == "missile" and obj ~= nil and obj.spellOwner ~= nil and obj.spellOwner.type == myHero.type and obj.spellName then
		for i = 1, #currentPolygons, 1 do
			v = currentPolygons[i]
			if v == nil then return end--{spell.name, poly, Start, spelldata.range, spelldata.projectileSpeed, GetInGameTimer()}
			if v[1] == obj.spellName or string.find(obj.spellName, v[1]) or GetInGameTimer() > (v[4]) then
				table.remove(currentPolygons, i)
				v = {}
				v = nil
				--Make it nice and clean for the garbage collector??? idk
			end
		end
		
		for i = 1, #currentDrawPolygons do
			k = currentDrawPolygons[i]
			if obj.spellOwner.type == myHero.type then
			end
			if string.find(k[1], obj.spellName) or k[1] == obj.spellName or string.find(obj.spellName, k[1]) then
				table.remove(currentDrawPolygons, i)
				k = {}
				k = nil
			end
		end
	end
end

function OnCreateObj(obj)
	if obj and (obj.name=="Yasuo_base_R_indicator_beam.troy" or obj.name=="Yasuo_Skin02_R_indicator_beam.troy") then
		numKnockedEnemies = numKnockedEnemies + 1
	end
end

function BlockSkill()
	for i, sShot in pairs(currentPolygons) do
		local poly = sShot[2]
		if poly and poly:contains(Point(myHero.x, myHero.z)) and CanCast(_W) then
			DelayAction(function() CastSpell(_W, sShot[3].x, sShot[3].z) end, config.spec.humanizer / 1000)
		end
	end
	for i, sShot in pairs(currentCircles) do
		local centre = sShot[2]
		local radius = sShot[3]
		local block = sShot[5]
		
		if GetDistance(myHero, centre) < radius and block then
			CastSpell(_W, sShot[6].x, sShot[6].z)
		end
	end
end

function closestTurret()
for i, v in pairs(GetTurrets()) do
if v ~= nil and v.team ~= myHero.team and not v.dead then
if closestturret == nil then closestturret = v
elseif GetDistance(myHero, v) < GetDistance(myHero, closestturret) then
closestturret = v
end
end
end
end
 
function isDangerous(pos)
return GetDistance(pos, closestturret) < 950
end

function drawPoly(tableCurrentDrawPoly) -- ooOoOoOOh sp00ky its 3am ;_;
	t = tableCurrentDrawPoly
	list = t[2]
	for i = 1, #list, 1 do
		x = list[i]
		y = list[i+1]
		m = list[1]
		if i < #list then
			DrawLine3D(x.x, x.y, x.z, y.x, y.y, y.z, 2, 0xffffffff)
		else
			DrawLine3D(x.x, x.y, x.z, m.x, m.y, m.z, 2, 0xffffffff)
		end
	end
end

function OnDraw()
AutoUlt()
for i = 1, #currentPolygons, 1 do
			v = currentPolygons[i]
			if v == nil then return end--{spell.name, poly, Start, spelldata.range, spelldata.projectileSpeed, GetInGameTimer()}
			if--[[ v[1] == obj.spellName or string.find(obj.spellName, v[1]) or ]]GetInGameTimer() > (v[4]) then
				table.remove(currentPolygons, i)
				v = {}
				v = nil
				--Make it nice and clean for the garbage collector??? idk
			end
		end

for i = 1, #currentDrawPolygons do
			k = currentDrawPolygons[i]
			if GetInGameTimer() > k[3] then
				table.remove(currentDrawPolygons, i)
				k = {}
				k = nil
			else
				drawPoly(k)
			end
		end
		
for i = 1, #currentCircles do
			k = currentCircles[i]
			if k == nil then return end
			if GetInGameTimer() > k[4] then
				table.remove(currentCircles, i)
				k = {}
				k = nil
			else
				--DrawLine3D(myHero.x, myHero.y, myHero.z, k.EndPos, k.EndPos, k.EndPos, 5, 0xffffffff) 
			end
end


closestTurret()
	if config.drawing.drawing and CanCast(_R) and config.combo.autoult and config.drawing.drawKnocked then
	drawPos = WorldToScreen(D3DXVECTOR3(myHero.x, myHero.y, myHero.z))
	color = 0xFFFF0000
	if numKnockedEnemies >= config.combo.numUlt and config.combo.autoult then
	color = 0xFF00FF00
	end
	DrawText("Number of enemies knocked up: "..numKnockedEnemies, 18, drawPos.x, drawPos.y, color)
	end
	
	if not CanDodge() then
	BlockSkill()
	end
	
	local qDmg = myHero:GetSpellData(_Q).level * 20 + myHero.totalDamage
	local eDmg = myHero:GetSpellData(_E).level * 20 + 50
	
	if config.drawing.drawing then
		if CanCast(_Q) and config.drawing.drawQ then
			if spinE then qRange = 300 elseif rangeQ then qRange = 1100 else qRange = 500 end
			DrawCircle3D(myHero.x, myHero.y, myHero.z, qRange, 5, RGB(255, 255, 255), config.drawing.quality)
		end
		if CanCast(_E) and config.drawing.drawE then
			DrawCircle3D(myHero.x, myHero.y, myHero.z, 475, 5, RGB(0, 255, 255), config.drawing.quality)
		end
		if ValidTarget(target) then
			local totDmg = 0
			if CanCast(_Q) then
				totDmg = totDmg + qDmg
			end
			if CanCast(_E) then
				local canETarget = true
				for i, unit in pairs(eUnits) do
					if target == unit then 
						canETarget = false
					end
				end
				if canETarget == true then
					totDmg = totDmg + eDmg
				end
			end
			if target.health < totDmg and ValidTarget(target) then
				drawPos = WorldToScreen(D3DXVECTOR3(target.x, target.y, target.z))
				DrawText("You can kill the target", 18, drawPos.x, drawPos.y, 0xFFFF0000)
			end
			DrawDamageIndicator(target)
		end
		for i, v in ipairs(minionManager(MINION_ENEMY, 750, player, MINION_SORY_HEALTH_ASC).objects) do
			DrawDamageIndicator(v)
		end
	end
end

function CanCast(spell)
return myHero:CanUseSpell(spell) == READY
end

function dashEnd(unit)
endVector = Vector(myHero) + ((Vector(unit) - Vector(myHero)):normalized() * 450)
return endVector
end

function CanDodge()
	for i, polygon in pairs(currentPolygons) do
		polygon = polygon[2]
		if polygon and polygon:contains(Point(myHero.x, myHero.z)) then
			for i, minion in ipairs(minionManager(MINION_ENEMY, 600, player, MINION_SORT_HEALTH_ASC).objects) do
				if not polygon:contains(Point(dashEnd(minion).x, dashEnd(minion).z)) and not isDangerous(dashEnd(minion)) then
				local canE = true
					for data in pairs(eUnits) do
						if minion == data then
							local canE = false
						end
					end
					if canE and CanCast(_W) and ValidTarget(minion) and not hasE(minion) then DelayAction(function() CastSpell(_E, minion) return true end, config.spec.humanizer2) end
				end
			end
			for i, v in ipairs(minionManager(MINION_JUNGLE,300, player, MINION_SORT_HEALTH_ASC).objects) do
				if ValidTarget(v) and not polygon:contains(Point(dashEnd(minion).x, dashEnd(minion).z)) and not isDangerous(dashEnd(v)) and not hasE(v) and CanCast(_E) then
					CastSpell(_E, v)
					return true
				end
			end
		end
	end
	for i, circle in pairs(currentCircles) do
		local centre = circle[2]
		local radius = circle[3]
		if GetDistance(myHero, centre) < radius then
			for i, minion in ipairs(minionManager(MINION_ENEMY, 600, player, MINION_SORT_HEALTH_ASC).objects) do
				if not isDangerous(dashEnd(minion)) and GetDistance(dashEnd(minion), centre) > radius then
				local canE = true
					for data in pairs(eUnits) do
						if minion == data then
							local canE = false
						end
					end
					if canE and CanCast(_E) and ValidTarget(minion) then DelayAction(function() CastSpell(_E, minion) return true end, config.spec.humanizer2) end
				end
			end
			for i, v in ipairs(minionManager(MINION_JUNGLE,300, player, MINION_SORT_HEALTH_ASC).objects) do
				if ValidTarget(v) and not isDangerous(dashEnd(v)) and not hasE(v) and CanCast(_E) and GetDistance(dashEnd(v), centre) > radius then
					CastSpell(_E, v)
					return true
				end
			end
		end
	end
	return false
end

--============== OK THIS ^^ WAS THE WINDWALL BIT.

function Menu()
	rangeQ = false
	ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1000, true)
	VP = VPrediction()
	config:addSubMenu("Yasuo: Keys", "keys")
	
	config.keys:addParam("laneclear", "Laneclear key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
	config.keys:addParam("combo", "Combo key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte(" "))
	config.keys:addParam("LastHit", "lasthit/laneclear hybrid", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
	config.keys:addParam("escape", "escape key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
	
	config:addSubMenu("Yasuo: Farming", "farm")
	config.farm:addSubMenu("Farm: Laneclear", "laneclear")
	
	config.farm.laneclear:addParam("UseQ", "Use Q in laneclear", SCRIPT_PARAM_ONOFF, true)
	config.farm.laneclear:addParam("UseE", "Use E in laneclear", SCRIPT_PARAM_ONOFF, true)
	
	config.farm:addSubMenu("Farm: Lasthit", "lasthit")
	
	config.farm.lasthit:addParam("UseQ", "Use Q in lasthit", SCRIPT_PARAM_ONOFF, true)
	config.farm.lasthit:addParam("UseE", "Use E in lasthit", SCRIPT_PARAM_ONOFF, true)
	
	config:addSubMenu("Yasuo: Combo", "combo")
	
	config.combo:addParam("autoult", "Automatically use ultimate", SCRIPT_PARAM_ONOFF, true)
	config.combo:addParam("numUlt", "Number of enemies to use ult", SCRIPT_PARAM_SLICE, 3,0,5,0)
	config.combo:addParam("ksult", "Use ult to ks", SCRIPT_PARAM_ONOFF, true)
	config.combo:addParam("numKS", "Number of enemies killed by ult", SCRIPT_PARAM_SLICE, 1,0,5,0)
	config.combo:addParam("comboUlt", "Use ult if can kill with combo", SCRIPT_PARAM_ONOFF, true)
	config.combo:addParam("ultDelay", "Delay autoult by milliseconds", SCRIPT_PARAM_SLICE, 0, 0, 900, 0)
	config.combo:addParam("banzai", "Use ult if gonna die(below % health) - ", SCRIPT_PARAM_SLICE, 8, 0, 100, 0)
	config.combo:addParam("UseQ", "Use Q in combo", SCRIPT_PARAM_ONOFF, true)
	config.combo:addParam("UseE", "Use E in combo", SCRIPT_PARAM_ONOFF, true)
	config.combo:addParam("Ignite", "Auto Ignite", SCRIPT_PARAM_ONOFF, true)
	config.combo:addParam("AutoQ", "Auto Q harass", SCRIPT_PARAM_ONOFF, true)
	
	config:addSubMenu("Yasuo: Drawing", "drawing")
	
	config.drawing:addParam("drawing", "Toggle drawing", SCRIPT_PARAM_ONOFF, true)
	config.drawing:addParam("drawQ", "Draw Q range", SCRIPT_PARAM_ONOFF, true)
	config.drawing:addParam("drawE", "Draw E range", SCRIPT_PARAM_ONOFF, true)
	config.drawing:addParam("drawLine", "Draw Damage on HPBar", SCRIPT_PARAM_ONOFF, true)
	config.drawing:addParam("drawKnocked", "Draw num enemies knock up", SCRIPT_PARAM_ONOFF, true)
	config.drawing:addParam("quality", "Circle draw quality", SCRIPT_PARAM_SLICE, 7, 0, 30, 0)
	
	config:addSubMenu("Yasuo: Prediction", "pred")
	
	UPL:AddToMenu(config.pred)
	config.pred:addParam("hc", "Accuracy for UPL, default 2", SCRIPT_PARAM_SLICE, 2, 0, 3, 1)
	config.pred:addParam("speed", "Set custom speed", SCRIPT_PARAM_SLICE, 900, 0, 2000, 0)
	config.pred:addParam("range", "Set custom range ",SCRIPT_PARAM_SLICE, 1200, 0, 2000, 0)
	config.pred:addParam("delay", "Set custom delay(M/S)",SCRIPT_PARAM_SLICE, 100, 0, 1000, 0)
	
	config:addSubMenu("Yasuo: Miscellaneous", "misc")
	config.misc:addParam("flashCombo", "Shading Flash Combo", SCRIPT_PARAM_ONOFF, true)
	spinE = false
	LoadOrbwalker()
	
	flash, ign = nil, nil
	
	if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then 
		ign = SUMMONER_1
	elseif myHero:GetSpellData(SUMMONER_1).name:find("summonerflash") then
		flash = SUMMONER_1
	end
	
	if myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then 
		ign = SUMMONER_2
  elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerflash") then
		flash = SUMMONER_2
	end
	
	UPL:AddSpell(-1, { speed = math.huge, delay = 0, range = 475, width = 80, collision = false, aoe = true, type = "linear"})
end

function Ignite()
        if config.combo.Ignite and ign ~= nil and CanCast(ign) then
                local igniteDamage = 50 + 20 * myHero.level
    for i = 1, heroManager.iCount, 1 do
      local target = heroManager:getHero(i)
      if ValidTarget(target, 600) and target.team ~= myHero.team then
        if igniteDamage > (target.health + 20) and CanCast(ign) then
          CastSpell(ign, target)
        end
      end
    end
  end
end

local Hydra, Ghostblade, BORK

function Items()
		if config.keys.combo and ValidTarget(target, 1300) then
			if Hydra and CanCast(Hydra) and ValidTarget(target, 200) then fHydra() end 
			if BORK and CanCast(BORK) then CastSpell(BORK, target) end
			if Ghostblade and CanCast(Ghostblade) then CastSpell(Ghostblade) end
		end
end

function fHydra()
	if ValidTarget(target, 200) and Hydra and CanCast(Hydra) then
		if SxOrb and SxOrb:CanMove() then
			CastSpell(Hydra)
		elseif isSac and not _G.AutoCarry.Orbwalker:IsShooting() then
			CastSpell(Hydra)
		end
	end
end

function GetItemSlot()
	for slot = ITEM_1, ITEM_7 do
		local current = myHero:GetSpellData(slot).name
		if current == "ItemTiamatCleave" then
		Hydra = slot
		elseif current == "YoumusBlade" then
		Ghostblade = slot
		elseif current == "ItemSwordOfFeastAndFamine" then
		BORK = slot
		elseif current == "BilgewaterCutlass" then
		BORK = slot
		end
	end
end

function Farm()
	LastHit()
	LaneClear()
end

function LastHit()
	if config.keys.LastHit then
		local lowestMinion = nil
		local qDmg = myHero:GetSpellData(_Q).level * 20 * myHero.totalDamage
		local eDmg = myHero:GetSpellData(_E).level * 20 + 50
		for i, minion in ipairs(minionManager(MINION_ENEMY, 500, player, MINION_SORT_HEALTH_ASC).objects) do
		if ValidTarget(minion) then
			if lowestMinion == nil then lowestMinion = minion elseif lowestMinion.health > minion.health then lowestMinion = minion end
		end
		
		if lowestMinion.health < eDmg and CanCast(_E) and config.farm.lasthit.UseE and not hasE(lowestMinion) then
			CastSpell(_E, lowestMinion)
		elseif lowestMinion.health < qDmg and CanCast(_Q) and config.farm.lasthit.UseQ then
			CastSpell(_Q, lowestMinion.x, lowestMinion.z)
		elseif lowestMinion.health > qDmg and lowestMinion.health < eDmg + qDmg and CanCast(_Q) and CanCast(_E) and config.farm.lasthit.UseQ and config.farm.lasthit.UseE and not hasE(lowestMinion) then
			CastSpell(_Q, lowestMinion.x, lowestMinion.z)
			CastSpell(_E, lowestMinion)
		end
		end
	end
end

function LaneClear()
	local lowestMinion = nil
	for i, v in ipairs(minionManager(MINION_ENEMY,800,player, MINION_SORT_HEALTH_ASC).objects) do
					if ValidTarget(v) then
					if lowestMinion == nil then
									lowestMinion = v
					elseif v.health < lowestMinion.health then
									lowestMinion = v
					end  
			end		
	end
	 
	for i, v in ipairs(minionManager(MINION_JUNGLE,1000,player,MINION_SORT_HEALTH_ASC).objects) do
	if ValidTarget(v) then
					if lowestMinion == nil then
									lowestMinion = v
					elseif v.health < lowestMinion.health then
									lowestMinion = v
					end    
	end
	end
	
	if config.keys.laneclear and ValidTarget(lowestMinion, 500) then
		local hasE = false
		for i, unit in pairs(eUnits) do
			if unit == lowestMinion then
				hasE = true
			end
		end
		if config.farm.laneclear.UseE and CanCast(_E) and hasE == false and not isDangerous(dashEnd(lowestMinion)) and ValidTarget(lowestMinion, 500) then
			CastSpell(_E, lowestMinion)
			DelayAction(function() if ValidTarget(ClosestEnemy()) and config.farm.laneclear.UseQ then CastSpell(_Q, lowestMinion.x, lowestMinion.z) end end, .1)
		elseif config.farm.laneclear.UseQ and CanCast(_Q) then
			CastSpell(_Q, lowestMinion.x, lowestMinion.z)
		end
	end
end

function Combo()
	if ValidTarget(target) and config.keys.combo then
		if rangeQ then
			if spinQ or spinE then
				if ValidTarget(target, 300) and CanCast(_Q) and config.combo.UseQ then
					CastSpell(_Q, target.x, target.z)
				end
			else
				if ValidTarget(target, 475) and config.combo.UseE and CanCast(_E) and not hasE(target) and config.combo.UseE then
					CastSpell(_E, target)
				elseif ValidTarget(target, 1000) and CanCast(_Q) and config.combo.UseQ then
					local CP, HC, Pos = UPL:Predict(_Q, myHero, target)
					if HC and HC > config.pred.hc then
						CastSpell(_Q, CP.x, CP.z)
					end
				end
			end
		else
			if spinQ or spinE then
				if ValidTarget(target, 300) and CanCast(_Q) and config.combo.UseQ then
					CastSpell(_Q, target.x, target.z)
				end
			else
				if ValidTarget(target, 475) and CanCast(_E) and not hasE(target) and config.combo.UseE then
					CastSpell(_E, target)
				end
				if ValidTarget(target, 475) and CanCast(_Q) and config.combo.UseQ then
					local CP, HC, Pos = UPL:Predict(_Q, myHero, target)
					if HC and HC > config.pred.hc then
						CastSpell(_Q, CP.x, CP.z)
					end
				end
			end
		end
		if CanCast(_E) and ValidTarget(target, 475) and not hasE(target) and config.combo.UseE then
			CastSpell(_E, target)
		end
	end
end

function AutoQ()
if not config.keys.combo and CanCast(_Q) and ValidTarget(target) then
	if spinE then
		if ValidTarget(target, 300) then
			CastSpell(_Q, target.x, target.z)
		end
	elseif ValidTarget(target, 500) and not rangedQ then
		local CP, HC, Pos = UPL:Predict(_Q, myHero, target)
		if HC and HC > config.pred.hc and GetDistance(CP, myHero) < 475 then
			CastSpell(_Q, CP.x, CP.z)
		end
	end
end
end

function AutoE()
if config.keys.combo and config.combo.UseE and CanCast(_E) and ValidTarget(target) and GetDistance(myHero, target) > 600 then
local closestToEnemy = nil
	for i, v in ipairs(minionManager(MINION_ENEMY, 500, player, MINION_SORT_HEALTH_ASC).objects) do	
		if ValidTarget(v, 450) and closestToEnemy == nil then closestToEnemy = v elseif GetDistance(dashEnd(v), target) < GetDistance(dashEnd(closestToEnemy), target) then closestToEnemy = v end
end
if ValidTarget(closestToEnemy, 450) and CanCast(_E) and GetDistance(dashEnd(closestToEnemy), target) < (GetDistance(myHero, target) - 200) then
CastSpell(_E, closestToEnemy)
end
end
end

function ClosestEnemy()
local closestEnemy = nil
for i, v in ipairs(minionManager(MINION_ENEMY, 300, player, MINION_SORT_HEALTH_ASC).objects) do
        if ValidTarget(v) then
				if closestEnemy == nil then
                closestEnemy = v
        elseif GetDistance(closestEnemy) > GetDistance(v) then
                closestEnemy = v
        end
	end			
end
for i, x in ipairs(minionManager(MINION_JUNGLE,300, player, MINION_SORT_HEALTH_ASC).objects) do
        if ValidTarget(x) then
				if closestEnemy == nil then
                closestEnemy = x
        elseif GetDistance(closestEnemy) > GetDistance(x) then
                closestEnemy = x
        end
				end
end
for i, y in ipairs(GetEnemyHeroes()) do
        if ValidTarget(y, 300) then
                if closestEnemy == nil then
                        closestEnemy = y
                elseif GetDistance(closestEnemy) > GetDistance(y) then
                        closestEnemy = y
                end
        end
end 
if ValidTarget(closestEnemy) then
return closestEnemy
else
return nil
end
end

function OnTick()
if rangeQ then
	UPL:AddSpell(_Q, { speed = config.pred.speed, delay = (config.pred.delay / 1000), range = config.pred.range, width = 120, collision = false, aoe = true, type = "linear"})
else
	UPL:AddSpell(_Q, { speed = math.huge , delay = 0, range = 475, width = 120, collision = false, aoe = true, type = "linear"})
end
	ts:update()
	target = ts.target

	AutoQ()
	Farm()
	Combo()
	GetItemSlot()
	Ignite()
	AutoE()
	Escape()
	KS()
end

local count = 0

function LoadOrbwalker()
if _G.Reborn_Initialised then
      AutoupdaterMsg("Omega Yasuo: Reborn loaded and authed")
                        isSac = true
                        loaded = true
                        config:addSubMenu("Omega Yasuo: Orbwalker", "Orbwalker")
                        config.Orbwalker:addParam("info", "SAC:R detected", SCRIPT_PARAM_INFO, "")
   elseif _G.Reborn_Loaded and not _G.Reborn_Initialised and count < 30 then
                        if printedWaiting == false then
      AutoupdaterMsg("Omega Yasuo: Waiting for Reborn auth")
                        printedWaiting = true
                        end
      DelayAction(LoadOrbwalker, 1)
                        count = count + 1
   else
                        if count >= 30 then
                        AutoupdaterMsg("Omega Yasuo: SAC failed to auth")
                        end
                        require 'SxOrbWalk'
      print("SxOrbWalk: Loading...")
                                config:addSubMenu("Omega Yasuo: Orbwalker", "Orbwalker")
                                SxOrb:LoadToMenu(config.Orbwalker)
                                isSx = true
                        AutoupdaterMsg("SxOrbWalk: Loaded")
                        loaded = true
   end
end

function DrawDamageIndicator(targeta)
if config.drawing.drawLine and ValidTarget(targeta) then
local position, width, height = GetHpBarInfo(targeta)
local qDmg = myHero:GetSpellData(_Q).level * 20 + myHero.totalDamage
local qWidth = (qDmg / targeta.maxHealth) * width
local targetaHealthWidth = (targeta.health / targeta.maxHealth) * width
if targetaHealthWidth > 1 then
local bars = math.ceil(targetaHealthWidth / qWidth)
local c = 1
while c <= bars do
        local barX = position.x + (c * qWidth)
        if barX < position.x + targetaHealthWidth then
                DrawLine(barX, position.y - 5, barX, position.y + height - 5, 3, 0xFFFF0000)
        end
        c = c + 1
end
end
end
end

function GetHpBarInfo(mob)
    local barPos = GetUnitHPBarPos(mob)
    local width = 62
    local height = 4    
    barPos.x = barPos.x - 31
    barPos.y = barPos.y - 2
    return barPos, width, height
end

local knockedPlayers = {}

function OnApplyBuff(source, unit, buff)
if buff.name == "yasuoq3w" and unit == myHero then rangeQ = true end
if buff.name == "yasuoq3mis" and unit.team ~= myHero.team and unit.type == myHero.type then DelayAction(function() table.insert(knockedPlayers, unit) local n = #knockedPlayers DelayAction(function() table.remove(knockedPlayers, n) end, 1 - (config.combo.ultDelay / 1000)) end, config.combo.ultDelay / 1000)
end
end
 
function OnRemoveBuff(unit, buff)
if buff.name == "yasuoq3w" and unit == myHero then rangeQ = false end
end
-- FOR REFERENCE
--[[config.combo:addParam("ksult", "Use ult to ks", SCRIPT_PARAM_ONOFF, true)
	config.combo:addParam("numKS", "Number of enemies killed by ult", SCRIPT_PARAM_SLICE, 1,0,5,0)
	config.combo:addParam("comboUlt", "Use ult if can kill with combo", SCRIPT_PARAM_ONOFF, true)]]
	
function AutoUlt()
	if numKnockedEnemies >= config.combo.numUlt and config.combo.autoult and CanCast(_R) then
		CastSpell(_R)
	end
	local r_dmg = 100 + 100 * myHero:GetSpellData(_R).level + myHero.totalDamage * 1.5
	local qDmg = myHero:GetSpellData(_Q).level * 20 + myHero.totalDamage
	local eDmg = myHero:GetSpellData(_E).level * 20 + 50
	
	local r_killcount = 0
	local combo_killcount = 0
	 --#performance.
	for i, enemy in ipairs(knockedPlayers) do
		if ValidTarget(enemy) and enemy.type == myHero.type then
			if enemy.health < r_dmg then
				r_killcount = r_killcount + 1
			end
			if enemy.health + enemy.armor * 3 < r_dmg + qDmg + eDmg then
				combo_killcount = combo_killcount + 1
			end
		end
	end
	
	
	local text = ""
	
	if ValidTarget(target) then
		text = "1xE, 1xUlt and " .. math.ceil((target.health - (eDmg + r_dmg)) / qDmg) .. "xQ to kill target"
	end
	
	if config.combo.comboUlt and combo_killcount > 0 and numKnockedEnemies > 0 then
		text = "Ult to kill unit with combo + crit Q"
		if CanCast(_R) then
		CastSpell(_R)
		end
	end
	
	if r_killcount > config.combo.numKS and config.combo.ksult and numKnockedEnemies > 0 then
		text = "Ult to KS with ultimate damage"
		if CanCast(_R) then
		CastSpell(_R)
		end
	end
	
	if CanCast(_R) and myHero.health / myHero.maxHealth * 100 < config.combo.banzai and #knockedPlayers >= 1 and numKnockedEnemies > 0 then
		text = "BANZAI!"
		CastSpell(_R)
	end
	
	textPos = WorldToScreen(D3DXVECTOR3(myHero.x, myHero.y, myHero.z))
	DrawText("" .. text, 18, textPos.x, textPos.y - 20, 0xFF00FF00)
end

function Escape()
	if CanCast(_E) and config.keys.escape then
		for i, v in ipairs(minionManager(MINION_ENEMY, 475, player, MINION_SORT_HEALTH_ASC).objects) do
      if ValidTarget(v) and GetDistance(dashEnd(v), mousePos) < GetDistance(myHero, mousePos) and not isDangerous(dashEnd(v)) then
				CastSpell(_E, v)
			end
		end
		for i, v in ipairs(minionManager(MINION_JUNGLE,475, player, MINION_SORT_HEALTH_ASC).objects) do
			if ValidTarget(v) and GetDistance(dashEnd(v), mousePos) < GetDistance(myHero, mousePos) and not isDangerous(dashEnd(v)) then
				CastSpell(_E, v)
			end
		end
	end
	if config.keys.escape then
	myHero:MoveTo(mousePos.x, mousePos.z)
	end
end

function hasE(unit)
	for i, enemy in pairs(eUnits) do
		if unit == enemy then return true end
	end
	return false
end

function flashyPlays()
local r_dmg = 100 + 100 * myHero:GetSpellData(_R).level + myHero.totalDamage * 1.5
if ValidTarget(target, 600) and target.health < r_dmg and flash ~= nil and CanCast(flash) and rangeQ and spinE and GetDistance(target) >= 475 and config.keys.combo and config.misc.flashCombo then
	CastSpell(flash, target.x, target.z)
	CastSpell(_Q, target.x, target.z)
end
end

function KS()
	local q_dmg = myHero.totalDamage + myHero:GetSpellData(_Q).level * 20
	local e_dmg = 50 + myHero:GetSpellData(_E).level * 20
	if eStacks ~= 0 then e_dmg = e_dmg * eStacks end
	for i, unit in pairs(GetEnemyHeroes()) do
		if ValidTarget(unit, 475) then
			if unit.health < q_dmg then
				if spinE then
					CastSpell(_Q, target.x, target.z)
				elseif rangeQ then
					local CP, HC, Pos = UPL:Predict(_Q, myHero, target)
					if HC and HC > config.pred.hc then
						CastSpell(_Q, CP.x, CP.z)
					end
				else
					local CP, HC, Pos = UPL:Predict(_Q, myHero, target)
					if HC and HC > config.pred.hc then
						CastSpell(_Q, CP.x, CP.z)
					end
				end
			end
			if ValidTarget(unit, 475) and unit.health < e_dmg and not hasE(unit) and CanCast(_E) then
				CastSpell(_E, unit)
			end
			if ValidTarget(unit, 475) and unit.health < e_dmg + q_dmg and CanCast(_Q) and CanCast(_E) and not hasE(unit) then
				CastSpell(_E, unit)
				DelayAction(function()
				CastSpell(_Q, unit.x, unit.z)
				end, .1)
			end
		end
	end
end
