local turtle = TalkAction("!turtle")

function turtle.onSay(player, words, param)

    if player:getItemCount(39235) >= 1 then
        if player:removeItem(22516,3) then
            if not player:removeItem(39235, 1) then
                player:sendCancelMessage("You don't have a turtle amulet to repair.")
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
            end
            player:addItem(39233, 1)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Your turtle amulet has been repaired!")
            player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
        else
            player:sendCancelMessage("You don't have 3 Silver Token to repair turtle amulet.")
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
        end
    else
        player:sendCancelMessage("You don't have a turtle amulet to repair.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    return false
end

turtle:separator(" ")
turtle:groupType("normal")
turtle:register()