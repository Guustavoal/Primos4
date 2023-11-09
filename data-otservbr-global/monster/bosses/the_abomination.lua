local mType = Game.createMonsterType("The Abomination")
local monster = {}

monster.description = "the Abomination"
monster.experience = 5000000
monster.outfit = {
	lookType = 1393,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3805000
monster.maxHealth = 3805000
monster.race = "venom"
monster.corpse = 36612
monster.speed = 170
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.bosstiary = {
	bossRaceId = 373,
	bossRace = RARITY_NEMESIS
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
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Blubb", yell = false}
	{text = "Sai da frente que eu vou explodirrrrrrrrrrrrrrrrrrrrrrrrr", yell = true}
}

monster.loot = {
	{id = 3043, chance = 100000, maxCount = 100}, -- gold coin
	{id = 36938, chance = 5000, maxCount = 2}, -- fiery horseshoe
	{id = 6499, chance = 2857, maxCount = 60}, -- demonic essence
	{id = 5944, chance = 2500, maxCount = 2} -- soul orb
	{ id = 36791, chance = 10150 }, -- Abomination's tail
	{ id = 36792, chance = 10150 }, -- Abomination's eye
	{ id = 36793, chance = 10150 }, -- Abomination's tongue
	{ id = 281, chance = 1150 }, -- giant shimmering pearl (green)
	{ name = "giant sapphire", chance = 10000, maxCount = 2 },
	{ name = "giant emerald", chance = 10000, maxCount = 3 },
	{ name = "giant topaz", chance = 10000, maxCount = 3 },
	{ name = "violet gem", chance = 6000, maxCount = 4 },
	{ name = "blue gem", chance = 10000, maxCount = 5 },
	{ id = 3039, chance = 10000, maxCount = 3 }, -- red gem
	{ name = "green gem", chance = 10000, maxCount = 4 },
	{ name = "yellow gem", chance = 10000, maxCount = 10 },
	{ name = "white gem", chance = 6000, maxCount = 15 },
	{ name = "royal almandine", chance = 8322 },
	{ name = "raw watermelon tourmaline", chance = 7322 },
	{ name = "giant amethyst", chance = 6122 },
	{ name = "giant ruby", chance = 4082 },
	{ name = "giant emerald", chance = 4082 },
	{ name = "giant sapphire", chance = 2041 },
	{ name = "giant topaz", chance = 2041 },
	{ name = "amber with a bug", chance = 2450 },
	{ name = "amber with a dragonfly", chance = 2150 },
	{ name = "arboreal tome", chance = 200 },
	{ name = "arboreal crown", chance = 200 },
	{ name = "spiritthorn armor", id = 39147, chance = 200 },
	{ name = "spiritthorn helmet", id = 39148, chance = 200 },
	{ name = "alicorn headguard", chance = 200 },
	{ name = "alicorn quiver", chance = 200 },
	{ name = "arcanomancer regalia", chance = 200 },
	{ name = "arcanomancer folio", chance = 200 },
	{ id = 39183, chance = 200 }, -- name = "charged arcanomancer sigil"
	{ id = 39186, chance = 200 }, -- name = "charged arboreal ring"
	{ id = 39180, chance = 200 }, -- name = "charged alicorn ring"
	{ id = 39177, chance = 200 }, -- name = "charged spiritthorn ring"
	{ name = "Primos Seller Token", chance = 15880 , minCount = 1, maxCount = 20},
	{ name = "Primos Token", chance = 15880 , minCount = 1, maxCount = 20},
	{id = 34109, chance = 1000, unique = true}, -- bag you desire
	{id = 39546, chance = 1000, unique = true}, -- primal bag
	{id = 44100, chance = 500, unique = true}, -- Portella Backpack
	{id = 44099, chance = 500, unique = true}, -- Primos Blessed Backpack
	{id = 44098, chance = 500, unique = true}, -- Primos ice Backpack
	{id = 44067, chance = 500}, -- aleatorio box
	{id = 44068, chance = 2000 }, -- gnome box
	{id = 44069, chance = 2000}, -- Lion Box
	{id = 44066, chance = 500, unique = true}, -- Falcon Box
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -8500, length = 8, spread = 0, effect = CONST_ME_GREYCHAIN},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -4000, maxDamage = -15000, effect = CONST_ME_ICEATTACK},
	{name ="melee", interval = 2000, chance = 100, skill = 200, attack = 250},
	{name ="combat", interval = 1000, chance = 7, type = COMBAT_MANADRAIN, minDamage = -100, maxDamage = -2000, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_POFF, target = false},
	{name ="drunk", interval = 1000, chance = 7, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="strength", interval = 1000, chance = 9, range = 7, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_LIFEDRAIN, minDamage = -400, maxDamage = -3700, radius = 8, effect = CONST_ME_LOSEENERGY, target = false},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -400, maxDamage = -3700, radius = 8, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="strength", interval = 1000, chance = 8, radius = 5, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 1000, chance = 34, type = COMBAT_FIREDAMAGE, minDamage = -100, maxDamage = -3900, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -500, maxDamage = -2850, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false}
	{name ="melee", interval = 2000, chance = 100, skill = 90, attack = 120},
	{name ="speed", interval = 1000, chance = 12, speedChange = -800, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 10000},
	{name ="combat", interval = 1000, chance = 9, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -650, radius = 4, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 1000, chance = 11, type = COMBAT_LIFEDRAIN, minDamage = -400, maxDamage = -900, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_SOUND_GREEN, target = true},
	{name ="combat", interval = 2000, chance = 19, type = COMBAT_PHYSICALDAMAGE, minDamage = -350, maxDamage = -850, length = 7, spread = 3, shootEffect = CONST_ANI_POISON, target = false}
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{ name = "combat", interval = 3000, chance = 15, type = COMBAT_HEALING, minDamage = 25000, maxDamage = 35000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 4000, chance = 80, speedChange = 700, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000 },}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
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
