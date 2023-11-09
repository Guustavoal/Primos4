local rewards = {
    --Helmets
    { id = 34155, count = 1, name = "lion longsword" },
    { id = 34155, count = 1, name = "lion spellbook" },
    { id = 34253, count = 1, name = "lion axe" },
    { id = 34254, count = 1, name = "lion hammer" },
	{ id = 34151, count = 1, name = "lion rod" },
	{ id = 34157, count = 1, name = "lion plate" },
	{ id = 34152, count = 1, name = "lion wand" },
	{ id = 34154, count = 1, name = "lion shield" },
	{ id = 34156, count = 1, name = "lion spangenhelm" },
	{ id = 34150, count = 1, name = "lion longbow" },
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




KnightSurpriseBag:id(44069)
KnightSurpriseBag:register()