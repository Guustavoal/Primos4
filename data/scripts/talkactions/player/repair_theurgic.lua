local theurgic = TalkAction("!theurgic")

function theurgic.onSay(player, words, param)

    if player:getItemCount(30401) >= 1 then
        if player:removeItem(22516,3) then
            if not player:removeItem(30401, 1) then
                player:sendCancelMessage("You don't have a Sleep Shawl to repair.")
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
            end
            player:addItem(30403, 1)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Your theurgic has been repaired!")
            player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
        else
            player:sendCancelMessage("You don't have 3 Silver Token to repair theurgic.")
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
        end
    else
        player:sendCancelMessage("You don't have a theurgic to repair.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    return false
end

theurgic:separator(" ")
theurgic:groupType("normal")
theurgic:register()