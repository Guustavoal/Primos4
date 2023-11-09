local mType = Game.createMonsterType("Morgaroth")
local monster = {}

monster.description = "Morgaroth"
monster.experience = 100000000
monster.outfit = {
	lookType = 12,
	lookHead = 2,
	lookBody = 94,
	lookLegs = 78,
	lookFeet = 79,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 5000000
monster.maxHealth = 5000000
monster.race = "fire"
monster.corpse = 6068
monster.speed = 305
monster.manaCost = 0

monster.changeTarget = {
	interval = 10000,
	chance = 20
}

monster.bosstiary = {
	bossRaceId = 229,
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
	staticAttackChance = 98,
	targetDistance = 1,
	runHealth = 100,
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

monster.summon = {
	maxSummons = 6,
	summons = {
		{name = "Demon", chance = 33, interval = 4000, count = 6}
	}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "I AM MORGAROTH, LORD OF THE TRIANGLE... AND YOU ARE LOST!", yell = true},
	{text = "MY SEED IS FEAR AND MY HARVEST ARE YOUR SOULS!", yell = true},
	{text = "ZATHROTH! LOOK AT THE DESTRUCTION I AM CAUSING IN YOUR NAME!", yell = true},
	{text = "THE TRIANGLE OF TERROR WILL RISE!", yell = true}
}

monster.loot = {
	{id = 3043, chance = 60000, minCount = 30, maxCount = 80}, -- crystal coin
	{name = "platinum coin", chance = 95000, maxCount = 74},
	{name = "demonic essence", chance = 95000, maxCount = 5},
	{name = "green gem", chance = 50000},
	{name = "great mana potion", chance = 45000},
	{name = "small amethyst", chance = 36000, maxCount = 18},
	{name = "devileye", chance = 36000},
	{name = "small emerald", chance = 27000, maxCount = 7},
	{name = "small sapphire", chance = 27000, maxCount = 9},
	{name = "red tome", chance = 27000},
	{name = "ultimate health potion", chance = 27000},
	{name = "talon", chance = 22000, maxCount = 7},
	{name = "demon horn", chance = 22000, maxCount = 2},
	{id = 6299, chance = 22000}, -- death ring
	{id = 3098, chance = 22000}, -- ring of healing
	{name = "chain bolter", chance = 22000},
	{name = "dark lord's cape", chance = 22000},
	{name = "ironworker", chance = 25000},
	{name = "double axe", chance = 18000},
	{name = "great spirit potion", chance = 18000},
	{name = "magic plate armor", chance = 18000},
	{name = "might ring", chance = 18000},
	{name = "mind stone", chance = 18000},
	{id = 3049, chance = 18000}, -- stealth ring
	{name = "fireborn giant armor", chance = 18000},
	{name = "royal crossbow", chance = 18000},
	{name = "teddy bear", chance = 18000},
	{name = "white pearl", chance = 13000, maxCount = 11},
	{name = "black pearl", chance = 13000, maxCount = 13},
	{name = "assassin star", chance = 13000, maxCount = 35},
	{name = "demonbone", chance = 13000},
	{name = "golden mug", chance = 13000},
	{name = "Morgaroth's heart", chance = 13000},
	{name = "obsidian truncheon", chance = 13000},
	{name = "stomper", chance = 13000},
	{name = "blue gem", chance = 9000},
	{name = "gold ring", chance = 9000},
	{name = "demon shield", chance = 9000},
	{id = 3051, chance = 9000}, -- energy ring
	{name = "giant sword", chance = 9000},
	{name = "golden legs", chance = 9000},
	{name = "life crystal", chance = 9000},
	{id = 3046, chance = 9000}, -- magic light wand
	{name = "orb", chance = 9000},
	{name = "strange symbol", chance = 9000},
	{name = "steel boots", chance = 9000},
	{name = "thunder hammer", chance = 9000},
	{name = "small diamond", chance = 4500, maxCount = 5},
	{id = 3007, chance = 4500}, -- crystal ring
	{name = "fire axe", chance = 4500},
	{name = "great health potion", chance = 4500},
	{name = "mastermind shield", chance = 4500},
	{name = "dragon robe", chance = 4500},
	{name = "molten plate", chance = 4500},
	{name = "great shield", chance = 500},
	{id = 44065, chance = 1000, maxCount = 1}, -- Item Roleta
	{id = 33780, chance = 100000, maxCount = 2}, -- Watermelon Tourmaline (Pear)
    {id = 33779, chance = 100000}, -- Watermelon Tourmaline (Slice)
    {id = 32625, chance = 40000, maxCount = 2}, -- Amber with a Dragonfly
    {id = 30054, chance = 20000, maxCount = 3}, -- Unicorn Figurine
    {id = 31323, chance = 20000}, -- Sea Horse Figurine
    {id = 30060, chance = 10000, maxCount = 3}, -- Giant Emerald
	{id = 30061, chance = 10000, maxCount = 3}, -- Giant sapphire
	{id = 30059, chance = 10000, maxCount = 3}, -- Giant Ruby
	{id = 43895, chance = 250}, -- bag covet
	{id = 34109, chance = 1000}, -- bag you desire
	{id = 39546, chance = 1000}, -- primal bag
	{id = 44100, chance = 500}, -- Portella Backpack
	{id = 44099, chance = 500}, -- Primos Blessed Backpack
	{id = 44098, chance = 500}, -- Primos ice Backpack
	{id = 44068, chance = 4000}, -- gnome box
	{id = 44069, chance = 4000}, -- Lion Box
	{id = 44066, chance = 4000}, -- Falcon Box
	{id = 28495, chance = 1000}, -- Stamina Refil
	{id = 14112, chance = 10000}, -- Bar of Gold
	{ name = "Primos Seller Token", chance = 15880 , minCount = 1, maxCount = 20},
	{ name = "Primos Token", chance = 15880 , minCount = 1, maxCount = 50},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -1000, maxDamage = -3250},
	{name ="combat", interval = 3000, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -1210, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 1800, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -1580, range = 7, radius = 5, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -300, maxDamage = -1450, length = 8, spread = 3, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 2500, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -1480, range = 7, radius = 5, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -1500, range = 7, radius = 13, effect = CONST_ME_SOUND_RED, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -1450, radius = 14, effect = CONST_ME_LOSEENERGY, target = false},
	{name ="combat", interval = 3000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -1200, range = 7, radius = 3, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 15, speedChange = -400, range = 7, effect = CONST_ME_SOUND_RED, target = false, duration = 20000},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_MANADRAIN, minDamage = -70, maxDamage = -1320, radius = 3, effect = CONST_ME_HITAREA, target = true},
	{name ="dark torturer skill reducer", interval = 2000, chance = 5, target = false}
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{name ="combat", interval = 3000, chance = 35, type = COMBAT_HEALING, minDamage = 800, maxDamage = 1100, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 9000, chance = 15, type = COMBAT_HEALING, minDamage = 3800, maxDamage = 4000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 4000, chance = 80, speedChange = 470, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 50},
	{type = COMBAT_ENERGYDAMAGE, percent = 80},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = 80}
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
