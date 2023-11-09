local mType = Game.createMonsterType("Primos Boss")
local monster = {}

monster.description = "Primos Boss"
monster.experience = 10000000
monster.outfit = {
	lookType = 947,
	lookHead = 38,
	lookBody = 114,
	lookLegs = 0,
	lookFeet = 94,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 5000000
monster.maxHealth = 5000000
monster.race = "blood"
monster.corpse = 25065
monster.speed = 730
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 10
}

monster.bosstiary = {
	bossRaceId = 2118,
	bossRace = RARITY_NEMESIS
	--storageCooldown = Storage.Quest.U12_70.AdventuresOfGalthen.MegasylvanYseldaTimer
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Revenge for my little brother!", yell = false},
	{text = "You are starting to annoy me!", yell = false},
	{text = "I will restore our family honor!", yell = false}
}

monster.summons = {
}

monster.loot = {
    {id = 3043, chance = 60000, maxCount = 60}, -- crystal coin
	{id = 5903, chance = 20, unique = true}, -- ferumbras' hat
	{id = 3422, chance = 50, unique = true}, -- great shield
	{id = 44065, chance = 500, maxCount = 1}, -- Item Roleta
    {id = 23373, chance = 40000, maxCount = 100}, -- Ultimate Mana Potion
    {id = 7643, chance = 30000, maxCount = 100}, -- Ultimate Health Potion
    {id = 23374, chance = 30000, maxCount = 100}, -- Ultimate Spirit Potion
    {id = 33780, chance = 100000}, -- Watermelon Tourmaline (Pear)
    {id = 33779, chance = 100000}, -- Watermelon Tourmaline (Slice)
    {id = 32625, chance = 40000}, -- Amber with a Dragonfly
    {id = 30054, chance = 20000}, -- Unicorn Figurine
    {id = 31323, chance = 20000}, -- Sea Horse Figurine
    {id = 30060, chance = 10000}, -- Giant Emerald
	{id = 43895, chance = 250, unique = true}, -- bag covet
	{id = 34109, chance = 1000, unique = true}, -- bag you desire
	{id = 39546, chance = 1000, unique = true}, -- primal bag
	{id = 44100, chance = 500, unique = true}, -- Portella Backpack
	{id = 44099, chance = 500, unique = true}, -- Primos Blessed Backpack
	{id = 44098, chance = 500, unique = true}, -- Primos ice Backpack
	{id = 44067, chance = 500}, -- aleatorio box
	{id = 44068, chance = 2000 }, -- gnome box
	{id = 44069, chance = 2000}, -- Lion Box
	{id = 44066, chance = 500, unique = true}, -- Falcon Box
	{id = 28495, chance = 1000}, -- Stamina Refil
	{id = 14112, chance = 10000}, -- Bar of Gold
    {id = 37608, chance = 2000}, -- Green Demon Armor
    {id = 37609, chance = 2000}, -- Green Demon Helmet
    {id = 37607, chance = 2000}, -- Green Demon Legs
    {id = 37610, chance = 2000}, -- Green Demon Slippers
    {id = 30053, chance = 10000}, -- Dragon Figurine
    {id = 3309, chance = 300}, -- Thunder Hammer
	{ id = 14143, chance = 250, count = 1 }, -- four-leaf clover
	{ id = 17858, chance = 250, count = 1 }, -- leech
	{ id = 32103, chance = 250 }, -- decorative blue sheet
	{ id = 32104, chance = 250 }, -- decorative red sheet
	{ id = 32105, chance = 250 }, -- decorative green sheet
	{ id = 16155, chance = 250 }, -- decorative ribbon
	{ id = 16252, chance = 250 }, -- gnomish voucher type MB
	{ id = 16253, chance = 250 }, -- gnomish voucher type MA1
	{ id = 16254, chance = 250 }, -- gnomish voucher type MA2
	{ id = 16255, chance = 250 }, -- gnomish voucher type CB
	{ id = 16256, chance = 250 }, -- gnomish voucher type CA1
	{ id = 16257, chance = 250 }, -- gnomish voucher type CA2
	{ id = 12801, chance = 250 }, -- golden can of oil
	{ id = 12550, chance = 250 }, -- golden fir cone
	{ id = 16251, chance = 250 }, -- Golem Wrench
	{ id = 12320, chance = 250 }, -- Sweet Smelling Bait
	{ id = 16154, chance = 250 }, -- Glow Wine
	{ id = 12547, chance = 250 }, -- Diapason 
	{ name = "tinged pot", chance = 250 },
	{ name = "candle stump", chance = 250 },
	{ name = "plan for a makeshift armour", chance = 280 },
	{ id = 27657, chance = 250 }, -- crude wood plans
	{ name = "maxilla maximus", chance = 250 },
	{ name = "Scorpion Sceptre", chance = 250 },
	{ id = 22865, chance = 100, unique = true }, -- mysterious scroll
	{ id = 16153, chance = 250 }, -- Iron Loadstone
	{ id = 39548, chance = 250 }, -- Colourful Water Lily
	{ id = 21439, chance = 250 }, -- The Lion's Heart
	{ id = 12305, chance = 250 }, -- Tin Key
	{ id = 21901, chance = 250, unique = true }, -- glooth glider casing
	{ id = 21292, chance = 250 }, -- feedbag
	{ id = 21901, chance = 250 }, -- glooth glider casing
	{ id = 21292, chance = 250 }, -- feedbag
	{ id = 21897, chance = 250 }, -- glooth glider blueprint
	{ id = 21902, chance = 250 }, -- glooth glider crank
	{ id = 21906, chance = 250 }, -- glooth glider gear wheel
	{ id = 21898, chance = 250 }, -- roll of covering
	{ id = 21905, chance = 250 }, -- glooth glider hinge
	{ id = 21899, chance = 250, unique = true }, -- glooth glider tubes and wires
	{ name = "sturdy book", chance = 500 },
	{ name = "epaulette", chance = 500 },
	{ name = "library ticket", chance = 500, unique = true },
	{ name = "giant emerald",  chance = 17000, maxCount = 3 },
	{ name = "giant ruby", chance = 10000, maxCount = 4 },
	{ name = "giant sapphire", chance = 10000 , maxCount = 3},
	{ name = "medal of valiance", chance = 12000 , maxCount = 1},
	{ name = "amber", chance = 5880 , maxCount = 2},
	{ name = "amber with a dragonfly", chance = 3920, maxCount = 3 },
	{ name = "figurine of malice", chance = 400 },
	{ name = "figurine of cruelty", chance = 400 },
	{ name = "figurine of hatred", chance = 400 },
	{ name = "figurine of greed", chance = 400 },
	{ name = "figurine of spite", chance = 400 },
	{ name = "figurine of megalomania", chance = 400 },
	{ name = "brainstealer's tissue", chance = 1000 },
	{ name = "brainstealer's brain", chance = 1000 },
	{ name = "brainstealer's brainwave", chance = 1500 },

	{ name = "brain head's giant neuron", chance = 2500 },
	{ name = "brain head's left hemisphere", chance = 2500 },
	{ name = "brain head's right hemisphere", chance = 2500},


	{ name = "Primos Seller Token", chance = 15880 , minCount = 1, maxCount = 20},
	{ name = "Primos Token", chance = 15880 , minCount = 1, maxCount = 20},

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
}

monster.defenses = {
	defense = 160,
	armor = 160,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 5000, maxDamage = 2000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 2000, maxDamage = 5000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 1000, chance = 8, speedChange = 1901, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000},
	{name ="invisible", interval = 1000, chance = 4, effect = CONST_ME_MAGIC_BLUE},
	{name ="invisible", interval = 1000, chance = 17, effect = CONST_ME_MAGIC_BLUE},
	{name ="outfit", interval = 1000, chance = 2, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 7000, outfitItem = 2916}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 5},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)
