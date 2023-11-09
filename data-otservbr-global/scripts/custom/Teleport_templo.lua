local config = {
	{ name="Thais", position = Position(32369, 32241, 7) },
	{ name="Venore", position = Position(32957, 32076, 7) },
	{ name="Carlin", position = Position(32360, 31782, 7) },
	{ name="Kazordoon", position = Position(32649, 31925, 11) },
	{ name="Ab'Dendriel", position = Position(32732, 31634, 7) },
	{ name="Ankrahmun", position = Position(33194, 32853, 8) },
	{ name="Edron", position = Position(33217, 31814, 8) },
	{ name="Farmine", position = Position(33023, 31521, 11) },
	{ name="Darashia", position = Position(33213, 32454, 1) },
	{ name="Liberty Bay", position = Position(32317, 32826, 7) },
	{ name="Port Hope", position = Position(32594, 32745, 7) },
	{ name="Svargrond", position = Position(32212, 31132, 7) },
	{ name="Yalahar", position = Position(32787, 31276, 7) },
	{ name="Gray Beach", position = Position(33447, 31323, 9) },
	{ name="Krailos", position = Position(33657, 31665, 8) },
	{ name="Oramond", position = Position(33594, 31899, 6) },
	{ name="Roshamuul", position = Position(33513, 32363, 6) },
	{ name="Issavi", position = Position(33921, 31477, 5) }
}

local function checkCondition(player)
	storage = Storage.PlayerCubeTeleportTime
	tempo = 5

	if player:getGroup():getAccess() or player:getAccountType() == ACCOUNT_TYPE_GOD then
		return true
	end

	if player:getStorageValue(storage) >= os.time() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait 5 seconds to can use teleport system again!")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		player:setStorageValue(storage, os.time() + tempo)
	end

	if player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Only work without fight.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
	return true
end

local teleportCube = Action()
function teleportCube.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not (checkCondition(player)) then
		return false
	end
	local window = ModalWindow({
		title = "Teleport Cube",
		message = "Locations",
	})
	for i, info in pairs(config) do
		window:addChoice(string.format("%s", info.name), function(player, button, choice)
			if button.name ~= "Select" then
				return true
			end
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You were teleported to " .. info.name)
			player:teleportTo(info.position)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			item:transform(item:getId(), item:getCharges() - 1)
			return true
		end)
	end
	window:addButton("Select")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
	return true
end

teleportCube:id(31633)
teleportCube:register()
