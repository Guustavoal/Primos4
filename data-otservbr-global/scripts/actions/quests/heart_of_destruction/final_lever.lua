local config = {
	bossName = "World Devourer",
	summonName = "Spark of Destruction2",
	bossPos = Position(32271, 31347, 14),
	centerRoom = Position(32271, 31346, 14), -- Center Room


	exitPosition = Position(32537, 32609, 6), -- Exit Position
	newPos = Position(32272, 31358, 14), -- Player Position on room
	playerPositions = {
		Position(32271, 31374, 14),
		Position(32271, 31375, 14),
		Position(32271, 31376, 14),
		Position(32271, 31377, 14),
		Position(32271, 31378, 14),
		Position(32272, 31374, 14),
		Position(32272, 31375, 14),
		Position(32272, 31376, 14),
		Position(32272, 31377, 14),
		Position(32272, 31378, 14),
		Position(32273, 31374, 14),
		Position(32273, 31375, 14),
		Position(32273, 31376, 14),
		Position(32273, 31377, 14),
		Position(32273, 31378, 14),
	},
	range = 20,
	time = 20, -- time in minutes to remove the player
}
local function clearDevourerRoom()
	local spectators = Game.getSpectators(config.bossPos, false, false, 20, 20, 20, 20)
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:isPlayer() then
			spectator:teleportTo(config.exitPosition)
			spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			spectator:say("Time out! You were teleported out by strange forces.", TALKTYPE_MONSTER_SAY)
		elseif spectator:isMonster() then
			spectator:remove()
		end
	end
end

local heartDestructionFinal = Action()
function heartDestructionFinal.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 8911 then
		if player:getPosition() ~= Position(32272, 31374, 14) then
			return true
		end

		for x = 32271, 32273 do
			for y = 31374, 31378 do
				local playerTile = Tile(Position(x, y, 14)):getTopCreature()
				if playerTile and playerTile:isPlayer() then
					if playerTile:getStorageValue(Storage.Quest.U11_80.TheSecretLibrary.ScourgeOfOblivionTimer) > os.time() then
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You or a member in your team have to wait 4 days to face the World Devourer again!")
						item:transform(8912)
						return true
					end
				end
			end
		end

		local specs, spec = Game.getSpectators(config.centerRoom, false, false, 15, 15, 15, 15)
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There's someone fighting with World Devourer.")
				return true
			end
		end

		local spectators = Game.getSpectators(config.bossPos, false, false, 15, 15, 15, 15)
		for i = 1, #spectators do
			local spectator = spectators[i]
			if spectator:isMonster() then
				spectator:remove()
			end
		end

		for x = 32271, 32273 do
			for y = 31374, 31378 do
				local playerTile = Tile(Position(x, y, 14)):getTopCreature()
				if playerTile and playerTile:isPlayer() then
					playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
					playerTile:teleportTo(config.newPos)
					playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					playerTile:setStorageValue(Storage.Quest.U11_80.TheSecretLibrary.ScourgeOfOblivionTimer, os.time() + 4 * 24 * 60 * 60) 
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have 20 minutes to kill and loot this boss. Otherwise you will lose that chance and will be kicked out.")
					addEvent(clearDevourerRoom, 60 * config.time * 1000, player:getId(), config.centerRoom, config.range, config.range, config.exitPosition)


					--Game.createMonster(config.bossName, config.bossPos, true, true)
					item:transform(8912)
				end
			end
		end
		Game.createMonster("World Devourer", Position(32271, 31347, 14), true, true)
	elseif item.itemid == 8912 then
		item:transform(8911)
		return true
	end
end

heartDestructionFinal:aid(14332)
heartDestructionFinal:register()
