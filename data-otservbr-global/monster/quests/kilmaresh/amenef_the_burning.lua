local mType = Game.createMonsterType("Amenef the Burning")
local monster = {}

monster.description = "Amenef the Burning"
monster.experience = 21500
monster.outfit = {
	lookType = 541,
	lookHead = 113,
	lookBody = 114,
	lookLegs = 113,
	lookFeet = 113,
	lookAddons = 1,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 2103,
	bossRace = RARITY_ARCHFOE,
	storageCooldown = Storage.Kilmaresh.AmenefTimer,
}

monster.health = 26000
monster.maxHealth = 26000
monster.race = "blood"
monster.corpse = 31646
monster.speed = 115
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ name = "crystal coin", chance = 44940, maxCount = 3 },
	{ name = "guardian halberd", chance = 11390 },
	{ id = 3097, chance = 8860 }, -- dwarven ring
	{ name = "mastermind potion", chance = 8203 },
	{ name = "doublet", chance = 6330 },
	{ name = "knight armor", chance = 5700 },
	{ id = 23529, chance = 5006 }, -- ring of blue plasma
	{ name = "epee", chance = 4403 },
	{ name = "underworld rod", chance = 4043 },
	{ name = "knight axe", chance = 3800 },
	{ name = "springsprout rod", chance = 3800 },
	{ name = "wand of cosmic energy", chance = 3106 },
	{ name = "wand of inferno", chance = 3016 },
	{ id = 281, chance = 2503 }, -- giant shimmering pearl (green)
	{ name = "spellbook of warding", chance = 2503 },
	{ name = "violet gem", chance = 2503 , maxCount = 3 },
	{ name = "wand of starstorm", chance = 2503 },
	{ name = "amber staff", chance = 1900 },
	{ name = "assassin dagger", chance = 1900 },
	{ name = "blue gem", chance = 1900 , maxCount = 3 },
	{ name = "eye-embroidered veil", chance = 500 },
	{ name = "warrior's axe", chance = 1900 },
	{ name = "focus cape", chance = 2207 },
	{ name = "noble axe", chance = 2270 },
	{ name = "sacred tree amulet", chance = 1207 },
	{ name = "golden mask", chance = 6003 },
	{ name = "mercenary sword", chance = 6300 },
	{ name = "tagralt-inlaid scabbard", chance = 500 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -150, maxDamage = -510 },
	{ name = "firering", interval = 2000, chance = 10, minDamage = -300, maxDamage = -600, target = false },
	{ name = "firex", interval = 2000, chance = 15, minDamage = -450, maxDamage = -750, target = false },
	{ name = "combat", interval = 2000, chance = 17, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -600, radius = 2, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -500, maxDamage = -750, length = 3, spread = 0, effect = CONST_ME_ENERGYHIT, target = false },
}

monster.defenses = {
	defense = 60,
	armor = 82,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
