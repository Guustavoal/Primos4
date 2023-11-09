local bonusCharges = 3
local usedBonusStorage = 12345 -- Altere para um valor de armazenamento exclusivo

local bonus = TalkAction("!bonus")

function bonus.onSay(player, words, param)
    if player:getLevel() < 25 then
        player:sendCancelMessage("You need to be at least level 25")
        player:sendSingleSoundEffect(1016, true)
        return true
    end

    if player then
        if player:getStorageValue(usedBonusStorage) == 1 then
            player:sendCancelMessage("You have already used the bonus command.")
        else
            local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
            inbox:addItem(23721, bonusCharges)  -- Item 2: 23721
            
            player:setStorageValue(usedBonusStorage, 1) -- Marca o jogador como tendo usado o comando
            
            player:getPosition():sendMagicEffect(CONST_ME_CAKE) -- Efeito visual
            player:sendSingleSoundEffect(42, 100) -- Efeito sonoro
        end
    end
end

bonus:separator(" ")
bonus:groupType("normal")
bonus:register()
