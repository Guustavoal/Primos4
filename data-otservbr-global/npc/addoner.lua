local internalNpcName = "Addoner"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 130,
	lookHead = 115,
	lookBody = 39,
	lookLegs = 96,
	lookFeet = 118,
	lookAddons = 3
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{text = 'Come see my Addons bro!'}
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

addoninfo = {
['citizen'] = {cost = 0, items = {{5878,100},{5890,50}, {5902,25}, {3374,1}}, outfit_female = 136, outfit_male = 128, addon = 3, storageID = 50966},
['hunter'] = {cost = 0, items = {{5876,100}, {5948,100}, {5891,5}, {5887,1}, {5889,1}, {5888,1},{5875,1}}, outfit_female = 137, outfit_male = 129, addon = 3, storageID = 50991},
['knight'] = {cost = 0, items = {{5880,100}, {5892,1},{5893,100}, {5924,1}, {5885,1}, {5887,1}}, outfit_female = 139, outfit_male = 131, addon = 3, storageID = 50992},
['mage'] = {cost = 0, items = {{5903,1}}, outfit_female = 138, outfit_male = 130, addon = 3, storageID = 50998},
['summoner'] = {cost = 0, items = {{5958,1},{5894,70}, {5911,20}, {5883,40}, {5922,35}, {5886,10}, {5881,60}, {5882,40}, {5904,15}, {5905,30}}, outfit_female = 138, outfit_male = 133, addon = 3, storageID = 50999},
['barbarian'] = {cost = 0, items = {{5880,100}, {5892,1}, {5893,50}, {5876,50},{5884,1}, {5885,1}, {5910,50}, {5911,50}, {5886,10}}, outfit_female = 147, outfit_male = 143, addon = 3, storageID = 51033},
['druid'] = {cost = 0, items = {{5896,50}, {5897,50},{5906,100},{5937,1}}, outfit_female = 148, outfit_male = 144, addon = 3, storageID = 50977},
['nobleman'] = {cost = 300000, items = {}, outfit_female = 140, outfit_male = 132, addon = 3, storageID = 51003},
['oriental'] = {cost = 0, items = {{5945,1},{5883,100}, {5895,100}, {5891,2}, {5912,100}}, outfit_female = 150, outfit_male = 146, addon = 3, storageID = 51025},
['warrior'] = {cost = 0, items = {{5880,100}, {5887,1},{5925,100}, {5899,100}, {5884,1}, {5919,1}}, outfit_female = 142, outfit_male = 134, addon = 3, storageID = 51005},
['wizard'] = {cost = 0, items = {{5922,50},{3436,1}, {3386,1}, {3382,1}, {3006,1}}, outfit_female = 149, outfit_male = 145, addon = 3, storageID = 51035},
['assassin'] = {cost = 0, items = {{5804,1}, {5930,1},{5912,50}, {5910,50}, {5911,50}, {5913,50}, {5914,50}, {5909,50}, {5886,10}}, outfit_female = 156, outfit_male = 152, addon = 3, storageID = 51014},
['beggar'] = {cost = 0, items = {{5878,50}, {5921,30}, {5913,20}, {5894,10}, {5883,100},{6107,1}}, outfit_female = 157, outfit_male = 153, addon = 3, storageID = 50975},
['pirate'] = {cost = 0, items = {{6098,100}, {6126,100}, {6097,100},{6101,1}, {6102,1}, {6100,1}, {6099,1}}, outfit_female = 155, outfit_male = 151, addon = 3, storageID = 51010},
['shaman'] = {cost = 0, items = {{3348,5}, {3403,5}, {5014,1}, {3002,5}}, outfit_female = 158, outfit_male = 154, addon = 3, storageID = 51036},
['norseman'] = {cost = 0, items = {{7290,15}}, outfit_female = 252, outfit_male = 251, addon = 3, storageID = 51039},
['afflicted'] = {cost = 0, items = {{12551,1},{12552,1},{12553,1},{12554,1},{12555,1},{12556,1}, {12786,1}, {12787,1}}, outfit_female = 431, outfit_male = 430, addon = 3, storageID = 50962},
['battle mage'] = {cost = 0, items = {{28792,5}, {28793,20}}, outfit_female = 1070, outfit_male = 1069, addon = 3, storageID = 50124},
['brotherhood'] = {cost = 0, items = {{6499,5000}}, outfit_female = 279, outfit_male = 278, addon = 3, storageID = 51018},
['citizen of issavi'] = {cost = 0, items = {{37002,1}, {37003,1}}, outfit_female = 1387, outfit_male = 1386, addon = 3, storageID = 47603},
['deepling'] = {cost = 0, items = {{14021,1}, {14022,1}, {14023,1}}, outfit_female = 464, outfit_male = 463, addon = 3, storageID = 51026},
['elementalist'] = {cost = 0, items = {{12599,1}, {12803,1}}, outfit_female = 433, outfit_male = 432, addon = 3, storageID = 43851},
['dream warden'] = {cost = 0, items = {{20063,10}, {20062,500}, {20276,1}, {20275,1}}, outfit_female = 578, outfit_male = 577, addon = 3, storageID = 30019}, 
['golden outfit'] = {cost = 1000000000, items = {}, outfit_female = 1211, outfit_male = 1210, addon = 3, storageID =  51015},
['nightmare'] = {cost = 0, items = {{6499,5000}}, outfit_female = 269, outfit_male = 268, addon = 3, storageID = 51016}, 
['glooth engineer'] = {cost = 0, items = {{21897,1}, {21814,500},{21816,500}}, outfit_female = 618, outfit_male = 610, addon = 3, storageID = 44551},
['demon'] = {cost = 0, items = {{6499,5000}}, outfit_female = 542, outfit_male = 541, addon = 3, storageID = 44001},
['demon hunter'] = {cost = 0, items = {{6499,5000}}, outfit_female = 288, outfit_male = 289, addon = 3, storageID = 44002},
['fire fighter']= {cost = 0, items = {{39544,1}, {39545,1}}, outfit_female = 1569, outfit_male = 1568, addon = 3, storageID = 47867},
['crystal warlord'] = {cost = 0, items = {{16255,1}, {16256,1}, {16257,1}}, outfit_female = 513, outfit_male = 512, addon = 3, storageID = 43851},
['soil guardian']  = {cost = 0, items = {{16252,1}, {16253,1}, {16254,1}}, outfit_female = 514, outfit_male = 516, addon = 3, storageID = 43852}, 
['rift warrior'] = {cost = 0, items = {{22516,200}, {22721,200}}, outfit_female = 845, outfit_male = 846, addon = 3, storageID = 45201},
['royal costume'] = {cost = 0, items = {{22516,30000}, {22721,25000}}, outfit_female = 1456, outfit_male = 1457, addon = 3, storageID = 47801},
['jester'] = {cost = 0, items = {{894,1}, {894,1}}, outfit_female = 270, outfit_male = 273, addon = 3, storageID = 52076},
['formal dress'] = {cost = 0, items = {{37604,1}, {37605,1}}, outfit_female = 1461, outfit_male = 1460, addon = 3, storageID = 43552},
['festive'] = {cost = 0, items = {{25088,3}, {25089,50}}, outfit_female = 929, outfit_male = 931, addon = 3, storageID = 45451},
['yalaharian']  = {cost = 0, items = {{9068,2}}, outfit_female = 324, outfit_male = 325, addon = 3, storageID = 41913},
['revenant']  = {cost = 0, items = {{34075,1},{34076,1}}, outfit_female = 1323, outfit_male = 1322, addon = 3, storageID = 47201},
['rascoohan']  = {cost = 0, items = {{35595,1},{35695,1}}, outfit_female = 1372, outfit_male = 1371, addon = 3, storageID = 47517},
['insectoid'] = {cost = 0, items = {{24966,2}}, outfit_female = 466, outfit_male = 465, addon = 3, storageID = 43551},
['cave explorer'] = {cost = 0, items = {{22756,1}, {22758,1}, {22754,1}, {22760,1}}, outfit_female = 575, outfit_male = 574, addon = 3, storageID = 44301},
['wayfarer'] = {cost = 0, items = {{11701,1}, {11700,1}}, outfit_female = 366, outfit_male = 367, addon = 3, storageID = 42951},
['dream warrior'] = {cost = 0, items = {{30169,5}, {30168,1}}, outfit_female = 1147, outfit_male = 1146, addon = 3, storageID = 46301},
['makeshift'] = {cost = 0, items = {{27655,1}, {27656,1},{27657,1}}, outfit_female = 1043, outfit_male = 1042, addon = 3, storageID = 45989},
['hand'] = {cost = 0, items = {{31737,1}, {31738,1}}, outfit_female = 1244, outfit_male = 1243, addon = 3, storageID = 46879},
['poltergeist'] = {cost = 0, items = {{32630,1}, {32629,1}}, outfit_female = 1271, outfit_male = 1270, addon = 3, storageID = 47021},
['first mage addon'] = {cost = 0, items = {{3074,1}, {3075,1}, {3072,1}, {3073,1}, {3071,1}, {3066,1}, {3070,1}, {3069,1}, {3065,1}, {3067,1}, {5904,10}, {3077,20}, {5809,1}}, outfit_female = 138, outfit_male = 130, addon = 1, storageID = Storage.OutfitQuest.MageSummoner.AddonWand},
}


--  Outfits
--['discoverer'] = {cost = 0, items = {{,}, {,}}, outfit_female = 1095, outfit_male = 1094, addon = 3, storageID = 46001}, 
--['orcsoberfest']
--['orcsoberfest']
--['percht raider']
--['royal bounacean'] = {cost = 0, items = {{,}, {,}}, outfit_female = 1437, outfit_male = 1436, addon = 3, storageID = 47604},
--['warmaster']





local o = {'citizen', 'hunter', 'knight', 'mage', 'nobleman', 'summoner', 'warrior', 'barbarian', 'druid', 'wizard', 'oriental', 'pirate', 'assassin', 'beggar', 'shaman', 'norseman','afflicted', 'battle mage', 'brotherhood', 'citizen of issavi', 'deepling' , 'elementalist', 'dream warden', 'golden outfit', 'nightmare', 'glooth engineer', 'demon', 'demon hunter', 'fire fighter', 'crystal warlord', 'soil guardian', 'rift warrior', 'royal costume', 'rascoohan', 'revenant' ,'rascoohan', 'insectoid', 'cave explorer', 'wayfarer', 'dream warrior', 'makeshift', 'hand', 'poltergeist'}
local rtnt = {}
local function creatureSayCallback(npc, creature, type, message)
local talkUser = creature
local player = Player(creature)
local playerId = player:getId()

local talkState = {}
    if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

    if addoninfo[message] ~= nil then
        local itemsTable = addoninfo[message].items
        local items_list = ''
        if (getPlayerStorageValue(creature, addoninfo[message].storageID) ~= -1) then
                npcHandler:say('You already have this addon!', npc, creature)
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
        if (addoninfo[message].cost > 0) then
            text = addoninfo[message].cost .. ' gp'
        elseif table.maxn(addoninfo[message].items) then
            text = items_list
        elseif (addoninfo[message].cost > 0) and table.maxn(addoninfo[message].items) then
            text = items_list .. ' and ' .. addoninfo[message].cost .. ' gp'
        end
        npcHandler:say('For ' .. message .. ' you will need ' .. text .. '. Do you have it all with you?', npc, creature)
        rtnt = message
        talkState[talkUser] = addoninfo[message].storageID
        npcHandler:setTopic(playerId, 2)
        return true
    elseif npcHandler:getTopic(playerId) == 2 then
        if MsgContains(message, "yes") then
            local items_number = 0
            if table.maxn(addoninfo[rtnt].items) > 0 then
                for i = 1, table.maxn(addoninfo[rtnt].items) do
                    local item = addoninfo[rtnt].items[i]
                    if (getPlayerItemCount(creature,item[1]) >= item[2]) then
                        items_number = items_number + 1
                    end
                end
            end
            if(getPlayerMoney(creature) >= addoninfo[rtnt].cost) and (items_number == table.maxn(addoninfo[rtnt].items)) then
                doPlayerRemoveMoney(creature, addoninfo[rtnt].cost)
                if table.maxn(addoninfo[rtnt].items) > 0 then
                    for i = 1, table.maxn(addoninfo[rtnt].items) do
                        local item = addoninfo[rtnt].items[i]
                        doPlayerRemoveItem(creature,item[1],item[2])
                    end
                end
                doPlayerAddOutfit(creature, addoninfo[rtnt].outfit_male, addoninfo[rtnt].addon)
                doPlayerAddOutfit(creature, addoninfo[rtnt].outfit_female, addoninfo[rtnt].addon)
                setPlayerStorageValue(creature,addoninfo[rtnt].storageID,1)
                npcHandler:say('Here you are.', npc, creature)
            else
                npcHandler:say('You do not have needed items!', npc, creature)
            end
            rtnt = nil
            talkState[talkUser] = 0
            npcHandler:resetNpc(creature)
            return true
        end
    elseif MsgContains(message, "addon") then
        npcHandler:say('I can give you all addons for {' .. table.concat(o, "}, {") .. '} outfits.', npc, creature)
        rtnt = nil
        talkState[talkUser] = 0
        npcHandler:resetNpc(creature)
        return true
    elseif MsgContains(message, "help") then
        npcHandler:say('You must say the name of the addon for the outfit and full addon.', npc, creature)
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

npcHandler:setMessage(MESSAGE_GREET, 'Welcome |PLAYERNAME|! If you want some addons, just ask me! Do you want to see my {addons}, or are you decided? If you are decided, just ask me like this: {citizen addon}')
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)
npcType:register(npcConfig)