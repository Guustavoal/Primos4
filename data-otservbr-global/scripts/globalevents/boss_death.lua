local config = {
	["Camus"] = {teleportId = 34111, timeTeleport = 900, createTeleportPosition = Position(32398, 33183, 7), teleportPositionTo = Position(32456, 33150, 7)},
	["Aldebaran"] = {teleportId = 34111, timeTeleport = 900, createTeleportPosition = Position(32362, 33172, 7), teleportPositionTo = Position(32456, 33150, 7)},
	["Milo"] = {teleportId = 34111, timeTeleport = 900, createTeleportPosition = Position(32402, 33144, 7), teleportPositionTo = Position(32456, 33150, 7)},
}

-- reinicia e testa

local function doCreateTeleport(itemId, position, destination, timeTeleport)
	local tile = Tile(position)
	if tile then
		local item = tile:getItemById(itemId)
		if item then
			item:remove()
		else
			local teleport = Game.createItem(itemId, 1, position)
			if teleport then
				teleport:setDestination(destination)
				addEvent(doCreateTeleport, timeTeleport * 1000, itemId, position, destination, timeTeleport)
			end
		end
	end
end

local bossDeathCreateTeleport = CreatureEvent("bossDeathCreateTeleport")

function bossDeathCreateTeleport.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end

	local boss = config[creature:getName()]
	if boss then
		doCreateTeleport(boss.teleportId, boss.createTeleportPosition, boss.teleportPositionTo, boss.timeTeleport)
	end

	return true
end

bossDeathCreateTeleport:register()
