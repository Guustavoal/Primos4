local staminarefill = Action()
function staminarefill.onUse(player, item, fromPosition, target, toPosition, isHotkey) 
	player:setStamina (4200)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "You have Restored Your STAMINA.")
	doRemoveItem(item.uid, 1)
return true
end

staminarefill:id(28495)
staminarefill:register()