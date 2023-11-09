local internalNpcName = "Mount"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1211,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookMount = 1682,
	lookAddons = 3
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{text = 'Come see my Mounts Patrao!'}
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

mountinfo = {
['Widow Queen'] = {cost = 0, items = {{12320,1}}, ID = 1},
['Racing Bird'] = {cost = 0, items = {{12311,1}}, ID = 2},
['War Bear'] = {cost = 0, items = {{5907,1}}, ID = 3},
['Black Sheep'] = {cost = 0, items = {{12308,1}}, ID = 4},
['Midnight Panther'] = {cost = 0, items = {{12306,10}}, ID = 5},
['Draptor'] = {cost = 0, items = {{12307,1}}, ID = 6},
['Titanica'] = {cost = 0, items = {{12318,1}}, ID = 7},
['Tin Lizzard'] = {cost = 0, items = {{12305,1}}, ID = 8},
['Blazebringer'] = {cost = 0, items = {{7866 ,1}}, ID = 9},
['Rapid Boar'] = {cost = 0, items = {{12260,1}}, ID = 10},
['Stampor'] = {cost = 0, items = {{12314,30},{12312,50},{12313,100}}, ID = 11},
['Undead Cavebear'] = {cost = 0, items = {{12304,1}}, ID = 12},
['Donkey'] = {cost = 0, items = {{12548,1}}, ID = 13},
['Tiger Slug'] = {cost = 0, items = {{12519,1}}, ID = 14},
['Uniwheel'] = {cost = 0, items = {{12801,1}}, ID = 15},
['Crystal Wolf'] = {cost = 0, items = {{12547,1}}, ID = 16},
['War Horse'] = {cost = 0, items = {{12802,500}}, ID = 17},
['Kingly Deer'] = {cost = 0, items = {{12550,1}}, ID = 18},
['Tamed Panda'] = {cost = 0, items = {{12549,1}}, ID = 19},
['Dromedary'] = {cost = 0, items = {{12546,1}}, ID = 20},
['Scorpion King'] = {cost = 0, items = {{12509,1}}, ID = 21},
['Lady Bug'] = {cost = 0, items = {{14143,1}}, ID = 27},
['Manta Ray'] = {cost = 0, items = {{14142,1}}, ID = 28},
['Ironblight'] = {cost = 0, items = {{16153,1}}, ID = 29},
['Magma Crawler'] = {cost = 0, items = {{16154,1}}, ID = 30},
['Dragonling'] = {cost = 0, items = {{16155,1}}, ID = 31},
['Gnarlhound'] = {cost = 0, items = {{16251,1}}, ID = 32},
['Water Buffalo'] = {cost = 0, items = {{17858,1}}, ID = 35},
['Ursagrodon'] = {cost = 0, items = {{20355,1}}, ID = 38},
['Gravedigger'] = {cost = 0, items = {{19136,1}}, ID = 39},
['Shock Head'] = {cost = 0, items = {{20274,1}}, ID = 42},
['Walker'] = {cost = 0, items = {{21186,1}}, ID = 43},
['Glooth Glider'] = {cost = 0, items = {{21897,1},{21901,1},{21902,1},{21906,1},{21905,1},{21899,1},{21898,1}}, ID = 71},
['Stone Rhino'] = {cost = 0, items = {{24954,1},{24955,1},{24956,1},{24957,1},{24958,1},{24959,1},}, ID = 106},
['Mole'] = {cost = 0, items = {{27605,1}}, ID = 119},
['Fleeting Knowledge'] = {cost = 0, items = {{28791,1}}, ID = 126},
['Lacewing Moth'] = {cost = 0, items = {{30170,1}}, ID = 130},
['Hibernal Moth'] = {cost = 0, items = {{30171,1}}, ID = 131},
['Percht 1'] = {cost = 0, items = {{30192,1}}, ID = 132},
['Percht 2'] = {cost = 0, items = {{30192,1}}, ID = 133},
['Percht 3'] = {cost = 0, items = {{30192,1}}, ID = 134},
['Gryphon'] = {cost = 0, items = {{31572,1},{31573,1},{31574,1},{31575,1},}, ID = 144},
['Percht 4'] = {cost = 0, items = {{30192,1}}, ID = 147},
['Percht 5'] = {cost = 0, items = {{30192,1}}, ID = 148},
['Percht 6'] = {cost = 0, items = {{30192,1}}, ID = 149},
['Percht 7'] = {cost = 0, items = {{30192,1}}, ID = 150},
['Percht 8'] = {cost = 0, items = {{30192,1}}, ID = 151},
['Percht 9'] = {cost = 0, items = {{30192,1}}, ID = 152},
['Blue Barrel'] = {cost = 0, items = {{32103,1}}, ID = 156},
['Red Barrel'] = {cost = 0, items = {{32104,1}}, ID = 157},
['Green Barrel'] = {cost = 0, items = {{32105,1}}, ID = 158},
['White Lion'] = {cost = 0, items = {{34258,1}}, ID = 174},
['Krakoloss'] = {cost = 0, items = {{35576,1}}, ID = 175},
['Phant'] = {cost = 10000000000, items = {}, ID = 182},
['Shellodon'] = {cost = 0, items = {{36835,1}}, ID = 183},
['Giant Beaver'] = {cost = 0, items = {{39548,1}}, ID = 201},
['Noble Lion'] = {cost = 0, items = {{21439,1}}, ID = 40},
['Haze'] = {cost = 0, items = {{32629,1}}, ID = 162},

}




local o = {'Widow Queen','Gravedigger', 'Racing Bird', 'War Bear', 'Black Sheep', 'Midnight Panther', 'Draptor', 'Titanica', 'Tin Lizzard', 'Blazebringer', 'Rapid Boar', 'Stampor', 'Undead Cavebear', 'Donkey', 'Tiger Slug', 'Uniwheel', 'Crystal Wolf', 'War Horse', 'Kingly Deer', 'Tamed Panda', 'Dromedary', 'Scorpion King', 'Lady Bug', 'Manta Ray', 'Ironblight', 'Magma Crawler', 'Dragonling', 'Gnarlhound', 'Water Buffalo', 'Ursagrodon', 'Shock Head', 'Walker', 'Glooth Glider', 'Stone Rhino', 'Mole', 'Fleeting Knowledge', 'Lacewing Moth', 'Hibernal Moth', 'Percht 1', 'Percht 2', 'Percht 3', 'Gryphon ', 'Percht 4', 'Percht 5', 'Percht 6', 'Percht 7', 'Percht 8', 'Percht 9', 'Blue Barrel', 'Red Barrel', 'Green Barrel', 'White Lion', 'Krakoloss', 'Phant', 'Shellodon', 'Giant Beaver', 'Noble Lion', 'Haze'}
local rtnt = {}
local function creatureSayCallback(npc, creature, type, message)
local talkUser = creature
local player = Player(creature)
local playerId = player:getId()

local talkState = {}
    if not npcHandler:checkInteraction(npc, creature) then
		return false
	end
    if mountinfo[message] ~= nil then
        local itemsTable = mountinfo[message].items
        local items_list = ''

		-- Start Checks
			-- Check if player already has the mount if true send error message and reopen window
		    if player:hasMount(mountinfo[message].ID) == true then
                npcHandler:say('You already have this mount!', npc, creature)
                npcHandler:resetNpc(creature)
                return true
        elseif table.maxn(itemsTable) > 0 then
            for i = 1, table.maxn(itemsTable) do
                local item = itemsTable[i]
                items_list = items_list .. item[2] .. ' ' .. ItemType(item[1]):getName()
                if i ~= table.maxn(itemsTable) then
                    items_list = items_list .. ', '
                end
            end
        end
        local text = ''
        if (mountinfo[message].cost > 0) then
            text = mountinfo[message].cost .. ' gp'
        elseif table.maxn(mountinfo[message].items) then
            text = items_list
        elseif (mountinfo[message].cost > 0) and table.maxn(mountinfo[message].items) then
            text = items_list .. ' and ' .. mountinfo[message].cost .. ' gp'
        end
        npcHandler:say('For ' .. message .. ' you will need ' .. text .. '. Do you have it all with you?', npc, creature)
        rtnt = message
        --talkState[talkUser] = mountinfo[message].storageID
        npcHandler:setTopic(playerId, 2)
        return true
    elseif npcHandler:getTopic(playerId) == 2 then
        if MsgContains(message, "yes") then
            local items_number = 0
            if table.maxn(mountinfo[rtnt].items) > 0 then
                for i = 1, table.maxn(mountinfo[rtnt].items) do
                    local item = mountinfo[rtnt].items[i]
                    if (getPlayerItemCount(creature,item[1]) >= item[2]) then
                        items_number = items_number + 1
                    end
                end
            end
            if(getPlayerMoney(creature) >= mountinfo[rtnt].cost) and (items_number == table.maxn(mountinfo[rtnt].items)) then
                doPlayerRemoveMoney(creature, mountinfo[rtnt].cost)
                if table.maxn(mountinfo[rtnt].items) > 0 then
                    for i = 1, table.maxn(mountinfo[rtnt].items) do
                        local item = mountinfo[rtnt].items[i]
                        doPlayerRemoveItem(creature,item[1],item[2])
                    end
                end
                player:addMount(mountinfo[rtnt].ID)
                npcHandler:say('Here you are.', npc, creature)
            else
                npcHandler:say('You do not have needed items!', npc, creature)
            end
            rtnt = nil
            talkState[talkUser] = 0
            npcHandler:resetNpc(creature)
            return true
        end
    elseif MsgContains(message, "mount") then
        npcHandler:say('You can get this mounts: {' .. table.concat(o, "}, {") .. '}.', npc, creature)
        rtnt = nil
        talkState[talkUser] = 0
        npcHandler:resetNpc(creature)
        return true
    elseif MsgContains(message, "help") then
        npcHandler:say('You must say the name of the mount.', npc, creature)
        rtnt = nil
        talkState[talkUser] = 0
        npcHandler:resetNpc(creature)
        return true
    else
        if talkState[talkUser] ~= nil then
            if talkState[talkUser] > 0 then
            npcHandler:say('Come back when you get these items.', npc, creature)
            rtnt = nil
            talkState[talkUser] = 0
            npcHandler:resetNpc(creature)
            return true
            end
        end
    end
    return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Welcome |PLAYERNAME|! If you want some mounts, just ask me! Do you want to see my {mount}, or are you decided? If you are decided, just ask me like this: {Donkey}')
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)
npcType:register(npcConfig)
