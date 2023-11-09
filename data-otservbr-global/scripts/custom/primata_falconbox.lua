local rewards = {
    --Helmets
    { id = 28720, count = 1, name = "falcon greaves" },
    { id = 28717, count = 1, name = "falcon wand " },
    { id = 28714, count = 1, name = "falcon circlet" },
    { id = 28715, count = 1, name = "falcon coif" },
	{ id = 28722, count = 1, name = "falcon escutcheon" },
	{ id = 28719, count = 1, name = "falcon plate" },
	{ id = 28723, count = 1, name = "falcon longsword" },
	{ id = 28725, count = 1, name = "falcon mace" },
	{ id = 28716, count = 1, name = "falcon rod" },
	{ id = 28718, count = 1, name = "falcon bow" },
	{ id = 28721, count = 1, name = "falcon shield" },
}

local KnightSurpriseBag = Action()

function KnightSurpriseBag.onUse(player, item, fromPosition, target, toPosition, isHotkey)
 
    local exhaustedSeconds = 1
    local exhaustedStorage = 75215
    if getPlayerStorageValue(player, exhaustedStorage) >= os.time() then
        return player:sendTextMessage(MESSAGE_STATUS_SMALL, 'Da um tempo ai meu consagrado.')
    else
        setPlayerStorageValue(player, exhaustedStorage, os.time()+exhaustedSeconds)
    end
    local randId = math.random(1 , #rewards)
	local rewardItem = rewards[randId]
    --[[player:setStorageValue(75219, player:getStorageValue(75219) + 1)
      if player:getStorageValue(75219) == 4 then
        player:addItem(39546, 1) 
        Game.broadcastMessage('O Jogador '..player:getName() ..' abriu 5 Knight Surprise Box e Recebeu uma Primal Bag.', MESSAGE_GAME_HIGHLIGHT)
        sendChannelMessage(12, TALKTYPE_CHANNEL_R1, 'O Jogador '..player:getName() ..', abriu 5 Knight Surprise Box e recebeu uma Primal Bag.', message)
         player:setStorageValue(75219, player:getStorageValue(75219) - 5) 
      end  ]]
	player:addItem(rewardItem.id, rewardItem.count)
	item:remove(1)
	sendChannelMessage(3, TALKTYPE_CHANNEL_R1, 'O Jogador '..player:getName() ..', Recebeu um ' .. rewardItem.name .. '.', message)
    player:getPosition():sendMagicEffect(CONST_ME_STONE_STORM)   
   
	return true
end




KnightSurpriseBag:id(44066)
KnightSurpriseBag:register()