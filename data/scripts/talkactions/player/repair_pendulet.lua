local sleepshawl = TalkAction("!pendulet")

function sleepshawl.onSay(player, words, param)

    if player:getItemCount(29429) >= 1 then
        if player:removeItem(22516,3) then
            if not player:removeItem(29429, 2) then
                player:sendCancelMessage("You don't have a Pendulet to repair.")
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
            end
            player:addItem(30344, 1)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Your Pendulet has been repaired!")
            player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
        else
            player:sendCancelMessage("You don't have 2 Silver Token to repair Pendulet.")
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
        end
    else
        player:sendCancelMessage("You don't have a Pendulet to repair.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    return false
end

sleepshawl:separator(" ")
sleepshawl:groupType("normal")
sleepshawl:register()