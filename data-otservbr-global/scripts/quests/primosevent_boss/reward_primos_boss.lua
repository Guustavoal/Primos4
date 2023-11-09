local rewards = {
    {id = 3036, name = "violet gem"},
    {id = 8061, name = "skullcracker armor"},
    {id = 8063, name = "paladin armor"},
    {id = 8074, name = "spellbook of mind control"},
    {id = 3366, name = "magic plate armor"},
    {id = 3414, name = "mastermind shield"},
    {id = 27449, name = "blade of destruction"},
    {id = 27450, name = "slayer of destruction"},
    {id = 27451, name = "axe of destruction"},
    {id = 27452, name = "chopper of destruction"},
    {id = 27455, name = "bow of destruction"},
    {id = 5919, name = "dragon claw"},
    {id = 22721, name = "gold token"},
    {id = 12307, name = "harness"},
    {id = 20274, name = "nightmare horn"},
    {id = 34109, name = "bag you desire"},
    {id = 43895, name = "bag you covet"},
	{id = 3079, name = "boots of haste"},
	{id = 10387, name = "Zaoan legs"},
	{id = 10385, name = "Zaoan helmet"},
	{id = 20089, name = "umbral spellbook"},
    {id = 39546, name = "primal bag"}
}

local rewardSoulWar = Action()
function rewardSoulWar.onUse(creature, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]
	local player = creature:getPlayer()
	if not player then
		return false
	end
	if player:getStorageValue(Storage.Quest.U12_90.PrimalOrdeal.Bosses.rewardtime) < 0 then
		player:addItem(rewardItem.id, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a ' .. rewardItem.name .. '.')
		player:setStorageValue(Storage.Quest.U12_90.PrimalOrdeal.Bosses.rewardtime, 1)
		return true
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have already collected your reward')
		return false
	end
end

rewardSoulWar:position({x = 32454, y = 33151, z = 7})
rewardSoulWar:register()
