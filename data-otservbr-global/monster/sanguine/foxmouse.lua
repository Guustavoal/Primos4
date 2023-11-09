local mType = Game.createMonsterType("Foxmouse")
local monster = {}

monster.description = "Foxmouse"
monster.experience = 24550
monster.outfit = {
	lookType = 1632,
}

monster.health = 29700
monster.maxHealth = 29700
monster.race = "blood"
monster.corpse = 26133
monster.speed = 685
monster.manaCost = 0
monster.maxSummons = 8

monster.changeTarget = {
	interval = 5000,
	chance = 8,
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {

	{ name = "Lava Creature", chance = 80, interval = 2000 },
	{ name = "The end of days", chance = 70, interval = 2000 },
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ name = "Crystal Coin", chance = 25000, maxCount = 3 },
	{ name = "Ultimate Health Potion", chance = 25000, maxCount = 8 },
	{ name = "Bullseye Potion", chance = 25000, maxCount = 8 },
	{ name = "Ultimate Spirit Potion", chance = 25000, maxCount = 8 },
	{ name = "Giant Topaz", chance = 5000, maxCount = 1 },
	{ name = "Giant Sapphire", chance = 5000, maxCount = 1 },
	{ name = "Berserk Potion", chance = 25000, maxCount = 8 },
	{ name = "Mastermind Potion", chance = 25000, maxCount = 12 },
	{ name = "Ultimate Mana Potion", chance = 25000, maxCount = 22 },
	{ name = "Terra Hood", chance = 14000 },
	{ name = "primal bag", chance = 50 },
	{ id = 34109, chance = 50 }, -- bag you desire
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -320, maxDamage = -1300 },
	{ name = "combat", interval = 1500, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -240, maxDamage = -1100, radius = 3, shootEffect = CONST_ANI_ENVENOMEDARROW, target = true },
	{ name = "combat", interval = 1500, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -240, maxDamage = -650, length = 4, spread = 3, effect = CONST_ME_ENERGYHIT, target = false },
	{ name = "combat", interval = 1500, chance = 35, type = COMBAT_DEATHDAMAGE, minDamage = -240, maxDamage = -850, radius = 4, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 1500, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -240, maxDamage = -650, radius = 4, effect = CONST_ME_FIREAREA, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 42,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 10 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
