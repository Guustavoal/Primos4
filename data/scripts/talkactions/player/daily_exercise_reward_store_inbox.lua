local exerciseCharges = 1800
local rewardStorage = 29998

local reward = TalkAction("!reward")

function reward.onSay(player, words, param)
    if player:getLevel() < 25 then
        player:sendCancelMessage("You need to be at least level 25")
        player:sendSingleSoundEffect(1016, true)
    return true
   end
	if player then
        if player:getStorageValue(rewardStorage) >= os.time() then
            player:sendCancelMessage("You already collected your daily reward.")
        else
            player:setStorageValue(rewardStorage, os.time() + 24 * 60 * 60)
            player:getPosition():sendMagicEffect(CONST_ME_CAKE)

local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)

            if player:isSorcerer() then
                inbox:addItem(35284, exerciseCharges)
            elseif player:isDruid() then
                inbox:addItem(35283, exerciseCharges)
            elseif player:isPaladin() then
                inbox:addItem(35282, exerciseCharges)
            elseif player:isKnight() then
                if player:getSkillLevel(SKILL_SWORD) > player:getSkillLevel(SKILL_CLUB) and
                player:getSkillLevel(SKILL_SWORD) > player:getSkillLevel(SKILL_AXE) then
                   inbox:addItem(35279, exerciseCharges)
                elseif player:getSkillLevel(SKILL_CLUB) > player:getSkillLevel(SKILL_SWORD) and
                    player:getSkillLevel(SKILL_CLUB) > player:getSkillLevel(SKILL_AXE) then
                    inbox:addItem(35281, exerciseCharges)
                elseif player:getSkillLevel(SKILL_AXE) > player:getSkillLevel(SKILL_SWORD) and
                    player:getSkillLevel(SKILL_AXE) > player:getSkillLevel(SKILL_CLUB) then
                    inbox:addItem(35280, exerciseCharges)
                end
            end
        end
    end
end

reward:separator(" ")
reward:groupType("normal")
reward:register()