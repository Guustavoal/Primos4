local rewards = {
    --Helmets
    { id = 30394, count = 1, name = "cobra boots" },
    { id = 30400, count = 1, name = "cobra rod " },
    { id = 30399, count = 1, name = "cobra wand" },
    { id = 31631, count = 1, name = "the cobra amulet" },
	{ id = 30396, count = 1, name = "cobra axe" },
	{ id = 30398, count = 1, name = "cobra sword" },
	{ id = 30397, count = 1, name = "cobra hood" },
	{ id = 30395, count = 1, name = "cobra club" },
	{ id = 30393, count = 1, name = "cobra crossbow" },
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




KnightSurpriseBag:id(44070)
KnightSurpriseBag:register()