local spiritthorn = TalkAction("!spiritthorn")

function spiritthorn.onSay(player, words, param)

    if player:getItemCount(39179) >= 1 then
        if player:removeItem(22516,5) then
            if not player:removeItem(39179, 1) then
                player:sendCancelMessage("You don't have a spiritthorn Ring to repair.")
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
            end
            player:addItem(39177, 1)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Your spiritthorn Ring has been repaired!")
            player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
        else
            player:sendCancelMessage("You don't have 5 Silver Token to repair spiritthorn Ring.")
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
        end
    else
        player:sendCancelMessage("You don't have a spiritthorn Ring to repair.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    return false
end

spiritthorn:separator(" ")
spiritthorn:groupType("normal")
spiritthorn:register()