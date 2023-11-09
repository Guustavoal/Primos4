local talkAddon = TalkAction("!addondoll")

function talkAddon.onSay(player, words, param)
	if player then
    player:registerEvent("talkAddonMW")
    local w = ModalWindow(0, "Choose your new Addon.")
	for index, value in pairs(MODAL_OUTFITS) do
		w:addChoice(value[1], index)
	end	
    w:addButton(0, "Ok")
    w:addButton(1, "Voltar")
    w:setDefaultEnterButton(0)
    w:setDefaultEscapeButton(1)
    w:sendToPlayer(player)
    return true
	end
end

talkAddon:separator(" ")
talkAddon:groupType("normal")
talkAddon:register()


local playerBuyAddon = CreatureEvent("talkAddonMW")

function playerBuyAddon.onModalWindow(player, modalWindowId, buttonId, choiceId)
    if player then
		player:unregisterEvent("talkAddonMW")
		local addon = getAddonByTableId(choiceId)
		local idMale = addon[3]
		local idFemale = addon[2]
		 if buttonId == 0 and player:getItemCount(ADDON_DOLL_ITEMID) >= 1 then
			if player:getSex() == PLAYERSEX_FEMALE then
				if not player:hasOutfit(idFemale,3) and player:removeItem(ADDON_DOLL_ITEMID,1) then
					player:addOutfitAddon(idFemale, 3)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"Now you can wear the choosen addon.")
				else
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You already have this addon or you dont have addon doll.")
				end
			else
				if not player:hasOutfit(idMale,3) and player:removeItem(ADDON_DOLL_ITEMID,1) then
					player:addOutfitAddon(idMale, 3)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"Now you can wear the choosen addon.")
				else
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You already have this addon or you dont have addon doll.")
				end	
			end
		
		 end
	end
    return true
end

playerBuyAddon:type("modalwindow")
playerBuyAddon:register()

--Mounts

local talkMount = TalkAction("!mountdoll")

function talkMount.onSay(player, words, param)
	if player then
    player:registerEvent("talkMountMW")
    local w = ModalWindow(0, "Choose your new Mount.")
	for index, value in pairs(MODAL_MOUNTS) do
		w:addChoice(value, index)
	end	
    w:addButton(0, "Ok")
    w:addButton(1, "Voltar")
    w:setDefaultEnterButton(0)
    w:setDefaultEscapeButton(1)
    w:sendToPlayer(player)
    return true
	end
end

talkMount:separator(" ")
talkMount:groupType("normal")
talkMount:register()


local playerBuyMount = CreatureEvent("talkMountMW")

function playerBuyMount.onModalWindow(player, modalWindowId, buttonId, choiceId)
    if player then
		player:unregisterEvent("talkMountMW")
		 if buttonId == 0 and player:getItemCount(MOUNT_DOLL_ITEMID) >= 1 then
				if not player:hasMount(choiceId) and player:removeItem(MOUNT_DOLL_ITEMID,1) then
					player:addMount(choiceId)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"Now you can use the choosen mount.")
				else
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You already have this mount or you dont have mount doll.")
				end
	
		 end
	end
    return true
end

playerBuyMount:type("modalwindow")
playerBuyMount:register()

