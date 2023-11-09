local mType = Game.createMonsterType("Milo")
local monster = {}

monster.description = "Milo"
monster.experience = 90000
monster.outfit = {
	lookType = 1593,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 500000
monster.maxHealth = 500000
monster.race = "blood"
monster.corpse = 6068
monster.speed = 120
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.bosstiary = {
	bossRaceId = 1518,
	bossRace = RARITY_BANE
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.events = {
	"bossDeathCreateTeleport"
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Krrrk!", yell = false}
}

monster.loot = {
	{name = "platinum coin", chance = 10000, maxCount = 80},
	{name = "crystal coin", chance = 10000, maxCount = 25},
	{name = "gold ingot", chance = 10000, maxCount = 2},
	{name = "great mana potion", chance = 10000, maxCount = 10},
	{name = "great spirit potion", chance = 10000, maxCount = 18},
	{name = "mastermind potion", chance = 10000, maxCount = 2},
	{name = "small diamond", chance = 10000, maxCount = 12},
	{name = "small emerald", chance = 10000, maxCount = 12},
	{name = "Portella Backpack", chance = 250, maxCount = 1},
	{name = "Primos Blessed Backpack", chance = 250, maxCount = 1},
	{name = "Primos ice Backpack", chance = 250, maxCount = 1},
	{name = "small ruby", chance = 10000, maxCount = 12},
	{name = "Roulette Primos Coin", chance = 250, maxCount = 1},
	{name = "ultimate health potion", chance = 10000, maxCount = 8},
	{name = "Primos Oberon Box", chance = 250, maxCount = 1},
	{ id = 14021, chance = 500, unique = true }, -- Jaul's Pearl
	{ id = 19136, chance = 500 }, -- nail case
	{ id = 12307, chance = 500 }, -- harness
	{ id = 12308, chance = 500 }, -- reins
	{ id = 5907, chance = 500 }, -- slingshot
	{ id = 12802, chance = 1000, maxCount = 20 }, -- sugar oat
	{ name = "purple tendril lantern", chance = 400 },
	{ id = 23538, chance = 300 }, -- vibrant egg
	{ id = 23684, chance = 200 }, -- crackling egg
	{name = "Giant Shrimp", chance = 300},
	{name = "Fist on a Stick", chance = 300},

	{ name = "bear skin", chance = 790 },
	{ name = "embrace of nature", chance = 750 },
	{ name = "giant emerald",  chance = 1700, maxCount = 3 },
	{ name = "giant ruby", chance = 1900, maxCount = 4 },
	{ name = "giant sapphire", chance = 1800 , maxCount = 3},
	{ name = "medal of valiance", chance = 1200 , maxCount = 1},
	{ name = "terra helmet", chance = 790 },
	{ name = "amber", chance = 5880 , maxCount = 2},
	{ name = "amber with a dragonfly", chance = 3920, maxCount = 3 },
	{ name = "bloody tears", chance = 1500 },
	{ name = "ghost chestplate", chance = 1050 },
	{ name = "fabulous legs", chance = 1050 },
	{ name = "ghost backpack", chance = 1050 },
	{ name = "spectral scrap of cloth", chance = 1050 },
	{ name = "figurine of malice", chance = 400 },
	{ name = "figurine of cruelty", chance = 400 },
	{ name = "figurine of hatred", chance = 400 },
	{ name = "figurine of greed", chance = 400 },
	{ name = "figurine of spite", chance = 400 },
	{ name = "figurine of megalomania", chance = 400 },
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 700, maxDamage = -2350},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 700, maxDamage = -2600, radius = 8, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = 800, maxDamage = -3200, length = 8, spread = 5, effect = CONST_ME_YELLOW_RINGS, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = 670, maxDamage = -2100, length = 8, spread = 9, effect = CONST_ME_POFF, target = false},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_DEATHDAMAGE, minDamage = 300, maxDamage = -2000, radius = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = 900, maxDamage = -3000, radius = 5, effect = CONST_ME_SMALLPLANTS, target = false}
}

monster.defenses = {
	defense = 5,
	armor = 10
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 60},
	{type = COMBAT_ENERGYDAMAGE, percent = 60},
	{type = COMBAT_EARTHDAMAGE, percent = 60},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 60},
	{type = COMBAT_HOLYDAMAGE , percent = 60},
	{type = COMBAT_DEATHDAMAGE , percent = 60}
}

monster.heals = {
	{type = COMBAT_FIREDAMAGE, percent = 100},
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
