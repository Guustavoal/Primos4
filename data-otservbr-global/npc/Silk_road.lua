local internalNpcName = "Silk Road"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType=132,
	lookHead=114,
	lookBody=88,
	lookLegs=94,
	lookFeet=114,
	lookAddons=3
}

npcConfig.flags = {
	floorchange = false,
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end


npcHandler:setMessage(MESSAGE_GREET, "Welcome, young |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "May Goku bless you, |PLAYERNAME|!")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)



npcConfig.currency = 44106


npcConfig.shop = {
	{ itemName = "Falcon Circlet", clientId = 28714, sell = 10 },
    { itemName = "Falcon Coif", clientId = 28715, sell = 10 },
	{ itemName = "Gnome Helmet", clientId = 27647, sell = 3 },
	{ itemName = "Green Demon Helmet", clientId = 37609, sell = 5 },
	{ itemName = "Lion Spangenhelm", clientId = 34156, sell = 10 },
	{ itemName = "Shroud of Despair", clientId = 22757, sell = 5 },
	{ itemName = "Terra Helmet", clientId = 31577, sell = 5 },
	{ itemName = "Visage of the end days", clientId = 22754, sell = 5 },
	{ itemName = "Bear Skin", clientId = 31578, sell = 5 },
	{ itemName = "Dawnfire Sherwani", clientId = 39164, sell = 5 },
	{ itemName = "Dream Shroud", clientId = 29423, sell = 5 },
	{ itemName = "Embrace of Nature", clientId = 31579, sell = 5 },
	{ itemName = "Gnome Armor", clientId = 27648, sell = 3 },
	{ itemName = "Living Armor", clientId = 29418, sell = 5 },
	{ itemName = "Death Gaze", clientId = 22758, sell = 5 },
	{ itemName = "Gnome Shield", clientId = 27650, sell = 3 },
	{ itemName = "Morshabaal's Mask", clientId = 37611, sell = 5 },
	{ itemName = "Lion Shield", clientId = 34154, sell = 10 },
	{ itemName = "Pair of Dreamwalkers", clientId = 29424, sell = 5 },
	{ itemName = "Shoulder Plate", clientId = 29420, sell = 5 },
	{ itemName = "Resizer", clientId = 29419, sell = 5 },
	{ itemName = "Summerblade", clientId = 29421, sell = 5 },
	{ itemName = "Winterblade", clientId = 29422, sell = 5 },
	{ itemName = "Lion Longsword", clientId = 34155, sell = 10 },
	{ itemName = "Energized Limb", clientId = 29425, sell = 5 },
	{ itemName = "Lion Wand", clientId = 34152, sell = 10 },
	{ itemName = "Lion Rod", clientId = 34151, sell = 10 },
	{ itemName = "Lion Longbow", clientId = 34150, sell = 10 },
	{ itemName = "Living Vine Bow", clientId = 29417, sell = 5 },
	{ itemName = "enchanted theurgic amulet", clientId = 30402, sell = 5 },
	{ itemName = "Enchanted Pendulet", clientId = 30344, sell = 5 },
	{ itemName = "Enchanted Sleep Shawl", clientId = 30343, sell = 5 },
	{ itemName = "Enchanted Turtle Amulet", clientId = 39233, sell = 5 },
	{ itemName = "Enchanted Ring of Souls", clientId = 32621, sell = 5 },
	{ itemName = "Feverbloom Boots", clientId = 39161, sell = 5 },
	{ itemName = "Midnight Tunic", clientId = 39165, sell = 5 },
	{ itemName = "Bast Legs", clientId = 35517, sell = 5 },
	{ itemName = "Book of Lies", clientId = 22755, sell = 5 },
	{ itemName = "Dawnfire Pantaloons", clientId = 39166, sell = 5 },
	{ itemName = "Exotic Legs", clientId = 35516, sell = 5 },
	{ itemName = "Frostflower Boots", clientId = 39158, sell = 5 },
	{ itemName = "Golden Boots", clientId = 3555, sell = 5 },
	{ itemName = "Green Demon Slippers", clientId = 37610, sell = 5 },
	{ itemName = "Lion Spellbook", clientId = 34153, sell = 10 },
	{ itemName = "Make-do Boots", clientId = 35520, sell = 5 },
	{ itemName = "Makeshift Boots", clientId = 35519, sell = 5 },
	{ itemName = "Pair of Nightmare Boots", clientId = 32619, sell = 5 },
	{ itemName = "Treader of Torment", clientId = 22756, sell = 5 },
	{ itemName = "Winged Boots", clientId = 31617, sell = 5 },
	{ itemName = "soulful legs", clientId = 32618, sell = 5 },
	{ itemName = "Bunnyslippers", clientId = 3553, sell = 10 },
	{ itemName = "Cobra Boots", clientId = 30394, sell = 10 },
	{ itemName = "Ectoplasmic Shield", clientId = 29430, sell = 5 },
	{ itemName = "Elven Mail", clientId = 3399, sell = 5 },
	{ itemName = "Ghost Chestplate", clientId = 32628, sell = 5 },
	{ itemName = "Jungle Quiver", clientId = 35524, sell = 5 },
	{ itemName = "Tempest Shield", clientId = 3442, sell = 5 },
	{ itemName = "Fabulous Legs", clientId = 32617, sell = 5 },
	{ itemName = "Gnome Legs", clientId = 27649, sell = 3 },
	{ itemName = "Green Demon Legs", clientId = 37607, sell = 5 },
	{ itemName = "Hammer of Prophecy", clientId = 7450, sell = 5 },
	{ itemName = "Jungle Flail", clientId = 35514, sell = 5 },
	{ itemName = "Lion Axe", clientId = 34253, sell = 10 },
	{ itemName = "impaler of the igniter", clientId = 22760, sell = 5 },
	{ itemName = "Phantasmal Axe", clientId = 32616, sell = 5 },
	{ itemName = "Plague Bite", clientId = 22759, sell = 5 },
	{ itemName = "Ravager's Axe", clientId = 3331, sell = 15 },
	{ itemName = "maimer", clientId = 22762, sell = 5 },
	{ itemName = "Deepling Ceremonial Dagger", clientId = 28825, sell = 5 },
	{ itemName = "Deepling Fork", clientId = 28826, sell = 5 },
	{ itemName = "Midnight Sarong", clientId = 39167, sell = 5 },
	{ itemName = "Throwing Axe", clientId = 35515, sell = 5 },
	{ itemName = "Falcon Battleaxe", clientId = 28724, sell = 10 },
	{ itemName = "Falcon Greaves", clientId = 28720, sell = 10 },
	{ itemName = "Falcon Longsword", clientId = 28723, sell = 10 },
	{ itemName = "Falcon Wand", clientId = 28717, sell = 10 },
	{ itemName = "Falcon Bow", clientId = 28718, sell = 10 },
	{ itemName = "Falcon Rod", clientId = 28716, sell = 10 },
	{ itemName = "Falcon Escutcheon", clientId = 28722, sell = 10 },
	{ itemName = "Falcon Plate", clientId = 28719, sell = 10 },
	{ itemName = "Naga Axe", clientId = 39156, sell = 5 },
	{ itemName = "Naga Club", clientId = 39157, sell = 5 },
	{ itemName = "Naga Sword", clientId = 39155, sell = 5 },
	{ itemName = "Naga Crossbow", clientId = 39159, sell = 5 },
	{ itemName = "Naga Rod", clientId = 39163, sell = 5 },
	{ itemName = "Naga Wand", clientId = 39162, sell = 5 },
	{ itemName = "Naga Quiver", clientId = 39160, sell = 5 },
	{ itemName = "Eldritch Bow", clientId = 36664, sell = 10 },
	{ itemName = "Eldritch Rod", clientId = 36674, sell = 10 },
	{ itemName = "Exotic Amulet", clientId = 35523, sell = 5 },
	{ itemName = "Jungle Bow", clientId = 35518, sell = 5 },
	{ itemName = "Jungle Rod", clientId = 35521, sell = 5 },
	{ itemName = "Gnome Sword", clientId = 27651, sell = 3 },
	{ itemName = "Havoc Blade", clientId = 7405, sell = 5 },
	{ itemName = "Jungle Wand", clientId = 35522, sell = 5 },
	{ itemName = "Lion Hammer", clientId = 34254, sell = 5 },
	{ itemName = "Mortal Mace", clientId = 31580, sell = 5 },
	{ itemName = "The Calamity", clientId = 8104, sell = 5 },
	{ itemName = "The Stomper", clientId = 8101, sell = 5 },
	{ itemName = "Thunder Hammer", clientId = 3309, sell = 5 },
	{ itemName = "Bow of Cataclysm", clientId = 31581, sell = 5 },
	{ itemName = "Lion Plate", clientId = 34157, sell = 10 },
	{ itemName = "Lion Amulet", clientId = 34158, sell = 10 },
	{ itemName = "Rainbow Necklace", clientId = 30323, sell = 5 },
	{ itemName = "The Devileye", clientId = 8024, sell = 5 },
	{ itemName = "The Ironworker", clientId = 8025, sell = 1 },
	{ itemName = "Wand of Dimensions", clientId = 12603, sell = 15 },
	{ itemName = "spool of yarn", clientId = 5886, buy = 15 },
	{ itemName = "Legion Helmet", clientId = 3374, buy = 100 },
	{ itemName = "damaged steel helmet", clientId = 5924, buy = 300 },
	{ itemName = "winning lottery ticket", clientId = 5958, buy = 300 },
	{ itemName = "dragon claw", clientId = 5919, buy = 500 },
	{ itemName = "griffinclaw container", clientId = 5937, buy = 500 },
	{ itemName = "coral comb", clientId = 5945, buy = 500 },
	{ itemName = "Ron the Ripper's sabre", clientId = 6101, buy = 100 },
	{ itemName = "Deadeye Devious' eye patch", clientId = 6102, buy = 100 },
	{ itemName = "Lethal Lissy's shirt", clientId = 6100, buy = 100 },
	{ itemName = "Brutus Bloodbeard's hat", clientId = 6099, buy = 100 },
	{ itemName = "voodoo doll", clientId = 3002, buy = 75 },
	{ itemName = "nose ring", clientId = 5804, buy = 200 },
	{ itemName = "staff", clientId = 6107, buy = 200 },
	{ itemName = "plague mask", clientId = 12786, buy = 200 },
	{ itemName = "plague bell", clientId = 12787, buy = 200 },
	{ itemName = "dream warden claw", clientId = 20275, buy = 200 },
	{ itemName = "dream warden mask", clientId = 20276, buy = 200 },
	{ itemName = "deed of ownership", clientId = 7866, buy = 300 },
	{ itemName = "diapason", clientId = 12547, buy = 400 },
	{ itemName = "nightmare horn", clientId = 20274, buy = 400 },
	{ itemName = "jester hat", clientId = 894, buy = 150 },
	{ itemName = "jester staff", clientId = 895, buy = 150 },
	{ itemName = "brass button", clientId = 37604, buy = 200 },
	{ itemName = "decorative plume", clientId = 37605, buy = 200 },
	{ itemName = "porcelain mask", clientId = 25088, buy = 30 },
	{ itemName = "colourful feathers", clientId = 25089, buy = 5 },
	{ itemName = "Lasting Exercise Wand", clientId = 35290, buy = 50 },
	{ itemName = "Lasting Exercise Rod", clientId = 35289, buy = 50 },
	{ itemName = "Lasting Exercise Sword", clientId = 35285, buy = 50 },
	{ itemName = "Lasting Exercise Axe", clientId = 35286, buy = 50 },
	{ itemName = "Lasting Exercise Club", clientId = 35287, buy = 50 },
	{ itemName = "Lasting Exercise Bow", clientId = 35288, buy = 50 },

}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
