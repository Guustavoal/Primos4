local castleEnter = MoveEvent()

function castleEnter.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if not canEnterCastle() then
		player:teleportTo(fromPosition, true)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait some minutes to start invading!")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendSingleSoundEffect(2731, false)
		return true
	end

	if isInvadingCastle(player) then
		player:teleportTo(fromPosition, true)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot Give UP!")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendSingleSoundEffect(2731, false)
		return true
	end

	local guildId = player:getGuild()
	if guildId == nil then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot pass because you are not a member of a guild.")
		player:teleportTo(CASTLE_KICK_POSITION, true)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendSingleSoundEffect(2731, false)
		return true
	end

	local dominantGuildId = getDominantGuildId()
	local playerGuildId = player:getGuild():getId()
	local playerGuild = Guild(playerGuildId)
	local invasionOccurring = checkInvasionOccurring()
	if dominantGuildId ~= playerGuildId and not invasionOccurring then
		broadcastAndStartInvasion(playerGuild:getName())
	end

	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	player:say("FIGHT!", TALKTYPE_MONSTER_SAY)

	setInvadingCastle(player, true)

	return true
end

castleEnter:type("stepin")
castleEnter:aid(CASTLE_ENTRANCE_ACTIONID)
castleEnter:register()

---------------------------------------------------------------------------------------
local castleTaken = MoveEvent()

function castleTaken.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local guildId = player:getGuild()
	if guildId == nil then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot pass because you are not a member of a guild.")
		player:teleportTo(CASTLE_KICK_POSITION, true)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendSingleSoundEffect(2731, false)
		return true
	end

	local dominantGuildId = getDominantGuildId()
	local playerGuildId = player:getGuild():getId()
	local playerGuild = Guild(playerGuildId)
	local invasionOccurring = checkInvasionOccurring()
	if dominantGuildId ~= playerGuildId and invasionOccurring then
		stopInvasion()
		setDominantGuild(playerGuildId)
	end

	return true
end

castleTaken:type("stepin")
castleTaken:aid(CASTLE_THRONE_ACTIONID)
castleTaken:register()

------------------------------------------------------------------------------------------ ev on death
local deathInvasor = CreatureEvent("DeathInvasor")

function deathInvasor.onDeath(player, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	if isInvadingCastle(player) then
		setInvadingCastle(player, false)
	end
end

deathInvasor:register()

---------------------------------------------------------------------------------------------- bonus EXP
local callbackBonusExp = EventCallback()

function callbackBonusExp.playerOnGainExperience(player, source, exp, rawExp)
	if not player or not player:getGuild() then
		return exp
	end
	local dominantGuildId = getDominantGuildId()
	local playerGuildId = player:getGuild():getId()
	if dominantGuildId == playerGuildId then
		return exp * 1.10
	end
end

callbackBonusExp:register()

---------------------------------------------------------------------------------------------------- atalho guildmembers

local atalhoMoveIda = MoveEvent("AtalhoCastleIda")
function atalhoMoveIda.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	local guildId = player:getGuild()
	if guildId == nil then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot pass because you are not a member of a guild.")
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendSingleSoundEffect(2731, false)
		return true
	end

	local dominantGuildId = getDominantGuildId()
	local playerGuildId = player:getGuild():getId()

	if dominantGuildId ~= playerGuildId then
		player:teleportTo(fromPosition, true)
	end
end
atalhoMoveIda:type("stepin")
atalhoMoveIda:aid(CASTLE_ATALHOENTRADA_ACTIONID)
atalhoMoveIda:register()
