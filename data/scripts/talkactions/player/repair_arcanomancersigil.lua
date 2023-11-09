local arcanomancersigil = TalkAction("!sigil")

function arcanomancersigil.onSay(player, words, param)

    if player:getItemCount(39185) >= 1 then
        if player:removeItem(22516,5) then
            if not player:removeItem(39185, 1) then
                player:sendCancelMessage("You don't have a arcanomancer sigil to repair.")
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
            end
            player:addItem(39183, 1)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Your arcanomancer sigil has been repaired!")
            player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
        else
            player:sendCancelMessage("You don't have 5 Silver Token to repair Alicorn Ring.")
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
        end
    else
        player:sendCancelMessage("You don't have a arcanomancer sigil to repair.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    return false
end

arcanomancersigil:separator(" ")
arcanomancersigil:groupType("normal")
arcanomancersigil:register()