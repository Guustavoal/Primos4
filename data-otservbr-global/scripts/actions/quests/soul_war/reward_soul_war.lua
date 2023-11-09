

local rewardSoulWar = Action()
function rewardSoulWar.onUse(creature, item, fromPosition, target, toPosition, isHotkey)

	local player = creature:getPlayer()
	if not player then
		return false
	end
	if player:getStorageValue(Storage.Quest.U12_40.SoulWar.QuestReward) < 2 then
		player:addItem(34109, 1) --bag soulwar
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a bag you desire.")
		player:setStorageValue(Storage.Quest.U12_40.SoulWar.QuestReward, 3)
		if player:getSex() == 0 then
			player:addOutfit(1323)
		else
			player:addOutfit(1322)
		end
		return true
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already collected your reward")
		return false
	end
end

rewardSoulWar:position({ x = 33620, y = 31400, z = 10 })
rewardSoulWar:register()
