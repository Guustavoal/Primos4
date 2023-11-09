local internalNpcName = "Primos Online"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 150
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1683,
	lookHead = 114,
	lookBody = 0,
	lookLegs = 76,
	lookFeet = 94,
	lookAddons = 3
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.currency = 44079

npcConfig.shop = {
	{ itemName = "lasting exercise rod", clientId = 35289, buy = 100},
	{ itemName = "lasting exercise sword", clientId = 35285, buy = 100, },
	{ itemName = "lasting exercise axe", clientId = 35286, buy = 100, },
	{ itemName = "lasting exercise club", clientId = 35287, buy = 100, },
	{ itemName = "lasting exercise bow", clientId = 35288, buy = 100, },
	{ itemName = "lasting exercise wand", clientId = 35290, buy = 100, },
	{ itemName = "Roulette Primos Coin", clientId = 44065, buy = 200, },
	{ itemName = "Primos Lion Box", clientId = 44069, buy = 200 },
	{ itemName = "Primos Falcon box", clientId = 44066, buy = 200 },
	{ itemName = "Primos Gnome box", clientId = 44068, buy = 200},
	{ itemName = "Primos Random Box", clientId = 44067, buy = 200},
	{ itemName = "Primos Cobra box", clientId = 44070, buy = 200},
	{ itemName = "Stamina Refill", clientId = 28495, buy = 200, },
	{ itemName = "exalted core", clientId = 37110, buy = 10 },
	{ itemName = "squeezing gear of girlpower", clientId = 9596, buy = 50 }
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
npcType.onCheckItem = function(npc, player, clientId, subType)
end

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

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	ParseAlesarSay(npc, creature, message, npcHandler)
	return true
end

local function onTradeRequest(npc, creature)
	local player = Player(creature)
	local playerId = player:getId()

	if player:getStorageValue(Storage.DjinnWar.EfreetFaction.Mission03) ~= 3 then
		npcHandler:say("I'm sorry, but you don't have Malor's permission to trade with me.", npc, creature)
		return false
	end

	return true
end

npcHandler:setMessage(MESSAGE_GREET, "What do you want from me, |PLAYERNAME|?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Finally.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Finally.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "At your service, just browse through my wares.")

npcHandler:setCallback(CALLBACK_ON_TRADE_REQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcType:register(npcConfig)

