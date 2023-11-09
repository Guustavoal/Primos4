local bp = TalkAction("!bp")

function bp.onSay(player, words, param)
    if player:removeMoneyBank(35) then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        player:addItem(2854, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought a backpack!")
    else
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("You do not have enough money.")
    end
end

bp:separator(" ")
bp:groupType("normal")
bp:register()