local mType = Game.createMonsterType("Ghazbaran")
local monster = {}

monster.description = "Ghazbaran"
monster.experience = 100000000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 85,
	lookLegs = 78,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 6000000
monster.maxHealth = 6000000
monster.race = "undead"
monster.corpse = 6068
monster.speed = 200
monster.manaCost = 0

monster.changeTarget = {
	interval = 10000,
	chance = 20
}

monster.bosstiary = {
	bossRaceId = 312,
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
	runHealth = 3500,
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
	maxSummons = 4,
	summons = {
		{name = "Deathslicer", chance = 20, interval = 4000, count = 4}
	}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "COME AND GIVE ME SOME AMUSEMENT", yell = false},
	{text = "IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?", yell = true},
	{text = "I AM GHAZBARAN OF THE TRIANGLE... AND I AM HERE TO CHALLENGE YOU ALL.", yell = true},
	{text = "FLAWLESS VICTORY!", yell = true}
}

monster.loot = {
	{id = 3043, chance = 60000, minCount = 30,  maxCount = 80}, -- crystal coin
	{name = "blue tome", chance = 20000},
	{name = "teddy bear", chance = 12500},
	{id = 3007, chance = 8333}, -- crystal ring
	{name = "white pearl", chance = 25000, maxCount = 15},
	{name = "black pearl", chance = 11111, maxCount = 14},
	{name = "small diamond", chance = 25000, maxCount = 5},
	{name = "small sapphire", chance = 25000, maxCount = 10},
	{name = "small emerald", chance = 25000, maxCount = 10},
	{name = "small amethyst", chance = 25000, maxCount = 17},
	{name = "talon", chance = 12500, maxCount = 7},
	{name = "platinum coin", chance = 100000, maxCount = 69},
	{name = "green gem", chance = 20000},
	{name = "blue gem", chance = 14285},
	{name = "might ring", chance = 12500},
	{id = 3049, chance = 12500}, -- stealth ring
	{name = "strange symbol", chance = 11111},
	{name = "life crystal", chance = 12500},
	{name = "mind stone", chance = 20000},
	{name = "gold ring", chance = 20000},
	{id = 3098, chance = 20000}, -- ring of healing
	{name = "twin axe", chance = 11111},
	{name = "golden armor", chance = 8333},
	{name = "magic plate armor", chance = 8333},
	{name = "demon shield", chance = 12500},
	{name = "golden boots", chance = 8333},
	{name = "demon horn", chance = 33333, maxCount = 2},
	{id = 6299, chance = 25000}, -- death ring
	{name = "demonic essence", chance = 100000},
	{name = "ruthless axe", chance = 14285},
	{name = "assassin star", chance = 12500, maxCount = 44},
	{name = "havoc blade", chance = 16666},
	{name = "ravenwing", chance = 14285},
	{name = "great mana potion", chance = 20000},
	{name = "great health potion", chance = 20000},
	{name = "glacier kilt", chance = 8333},
	{name = "great spirit potion", chance = 25000},
	{name = "ultimate health potion", chance = 25000},
	{name = "oceanborn leviathan armor", chance = 16666},
	{name = "frozen plate", chance = 8333},
	{name = "spellbook of warding", chance = 20000},
	{name = "spellbook of mind control", chance = 11111},
	{name = "spellbook of lost souls", chance = 16666},
	{name = "spellscroll of prophecies", chance = 25000},
	{name = "spellbook of dark mysteries", chance = 20000},
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -1500, maxDamage = -3191},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -750, maxDamage = -1500, range = 7, radius = 6, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 3000, chance = 34, type = COMBAT_PHYSICALDAMAGE, minDamage = -820, maxDamage = -1500, range = 7, radius = 1, shootEffect = CONST_ANI_WHIRLWINDSWORD, target = true},
	{name ="combat", interval = 4000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -300, maxDamage = -1800, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -400, maxDamage = -1480, range = 14, radius = 5, effect = CONST_ME_POFF, target = false},
	{name ="combat", interval = 4000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -600, maxDamage = -1650, range = 7, radius = 13, effect = CONST_ME_BLOCKHIT, target = false},
	{name ="combat", interval = 4000, chance = 18, type = COMBAT_PHYSICALDAMAGE, minDamage = -800, maxDamage = -1600, radius = 14, effect = CONST_ME_LOSEENERGY, target = false},
	{name ="combat", interval = 3000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -800, maxDamage = -1750, range = 7, radius = 4, effect = CONST_ME_ENERGYAREA, target = false}
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{name ="combat", interval = 3000, chance = 35, type = COMBAT_HEALING, minDamage = 300, maxDamage = 800, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 4000, chance = 80, speedChange = 440, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 1},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = -1},
	{type = COMBAT_DEATHDAMAGE , percent = 1}
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
