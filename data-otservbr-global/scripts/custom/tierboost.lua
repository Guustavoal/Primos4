local config = {
    durationForge = 5, -- duration animation forge
	skillTree = 69891, -- storage do level da skill
	skillExpTree = 69892, -- storage da exp da skill
    storageNoLogout = 69893, -- storage para impedir de deslogar
    storageTalk = 69894, -- storage cooldown talkaction
    tierBoostItem = 44111, -- item que da o boost no item
    removeBoostItem = false, -- se vai remover ao usar
    minTier = 0, -- minimo de tier para dar boost
    exaltedCore = 22724,
    exaltedCoreName = "Titanium Token",
    exaltedCoreChance = 0.15,
    exaltedChest = 37561,
    exaltedSlivers = 37109,
    statusCommand = "!forgestatus",
    actionId = 64999,
    createDust = 60, -- valor em dust para criar as slivers
    createSliver = 3, -- valor em sliver para criar as dusts
    sliverToDust = 60, -- quantos dusts vai ganhar
    coreToSliver = 1, -- quantos exalted core para transformar em sliver
    createCoreToSliver = 50, -- quantos slivers vão ser criador ao consumir coreToSliver
    addExaltedCore = 69895, -- ao adicionar o exalted core para forjar recebe essa storage
    checkExaltedCore = 69896, -- checagem em tempo para remover a addExaltedCore
    chanceAddExaltedCore = 0.15, -- 0.15 = 15% de bonus ao adicionar exalted core na forja
}

local classification = {
    -- Upgrade classification 1
	[1] = {
        [0] = { price = 25000, core = 1, dust = 5 },
		[1] = { price = 125000, core = 1, dust = 10 },
        [2] = { price = 625000, core = 2, dust = 15 },
        [3] = { price = 3125000, core = 3, dust = 20 },
	},
	-- Upgrade classification 2
	[2] = {
        [0] = { price = 750000, core = 1, dust = 10 },
		[1] = { price = 5000000, core = 1, dust = 20 },
		[2] = { price = 25000000, core = 2, dust = 30 },
        [3] = { price = 125000000, core = 3, dust = 40 },
        [4] = { price = 625000000, core = 4, dust = 50 },
        [5] = { price = 1250000000, core = 5, dust = 60 },
	},
	-- Upgrade classification 3
	[3] = {
        [0] = { price = 4000000, core = 1, dust = 20 },
		[1] = { price = 10000000, core = 1, dust = 40},
		[2] = { price = 20000000, core = 2, dust = 60 },
		[3] = { price = 50000000, core = 3, dust = 80 },
        [4] = { price = 100000000, core = 4, dust = 100 },
        [5] = { price = 500000000, core = 5, dust = 120 },
        [6] = { price = 1000000000, core = 6, dust = 140 },
        [7] = { price = 5000000000, core = 7, dust = 160 },
        [8] = { price = 10000000000, core = 8, dust = 180 },
	},
	-- Upgrade classification 4
	[4] = {
        [0] = { price = 8000000, core = 1, dust = 30 },
		[1] = { price = 20000000, core = 1, dust = 60 },
		[2] = { price = 40000000, core = 2, dust = 90 },
		[3] = { price = 65000000, core = 3, dust = 120 },
		[4] = { price = 100000000, core = 4, dust = 150 },
		[5] = { price = 250000000, core = 5, dust = 180 },
		[6] = { price = 750000000, core = 6, dust = 210 },
		[7] = { price = 2500000000, core = 7, dust = 240 },
		[8] = { price = 8000000000, core = 8, dust = 270 },
		[9] = { price = 15000000000, core = 9, dust = 300 },
		[10] = { price = 20000000000, core = 10, dust = 325 },
	},
}

local bonusEffect = { -- 0.16 = 16%
    notConsumedGoldCoin = 0.16, -- nao gastar gold coin
	notConsumedDust = 0.14, -- nao gastar dust
    notConsumedGoldAndDust = 0.13, -- não gastar gold e dust
	notConsumedExaltedCore = 0.12, -- nao gastar exalted core
	doubleExpGainSucess = 0.10, -- ganhar exp de forja 2x
	rechargeDustMax = 0.08, -- recarregar a capacidade de dust ao maximo
	reduceTierItem = 0.06, -- reduzir o item do item
	notEffectUpgrade = 0.04, -- sem efeito mesmo que tenha sucesso
	doubleTierUpgrade = 0.02, -- subir dois niveis de tier de vez
}

local skillTree = {
    chanceFree = 0.10, -- chance para dar sucesso ao forjar (0.10 = 10%)
	chanceVip = 0.15, -- chance vip para dar sucesso ao forjar (0.15 = 15%)
	chanceTree = 0.005, -- chance adicional por nivel skill tree (0.005 * 100 = 0.50 = 50%)
	failForgeSkill = 50, -- Exp ganha por falha ao tentar fazer o tier
	sucessForgeSkill = 200, -- Exp ganha por ter sucesso ao tentar fazer o tier
    maxLevelFree = 80, -- Nivel maximo de skill Free
	maxLevelVip = 120, -- Nivel maximo de skill Vip
    maxExpFree = 1500, -- Exp para o free subir de nivel Formula: maxExpFree * levelForge
    maxExpVip = 1000, -- Exp para o vip subir de nivel Formula: maxExpVip * levelForge
}

local message = {
    notTierMin = "The item must be in the tier.", -- mensagem sem tier necessario
    notTierMinTwo = "or greater.", -- mensagem sem tier necessario
    notTierMax = "The item is at the maximum tier", -- mensagem tier maximo atingido
    notItem = "Put the item in the forge first.", -- mensagem sem item na forja
    boostFailed = "Failed upgrade tier boost", -- mensagem ao dar falha no boost
    successTier = "Sucess upgrade tier boost", -- mensagem de sucesso
	notValid = "The location is invalid for forging.", -- mensagem local nao e valido
	notItemInForge = "The forge is empty.", -- mensagem segunda parte local nao e valido
    notValidItem = "The item is invalid for forging.",
}

local effect = {
    sucess = CONST_ME_FIREWORK_YELLOW, -- efeito ao dar boost no item
    failed = CONST_ME_EXPLOSIONAREA, -- efeito ao dar falha na forja
    notValid = CONST_ME_POFF, -- efeito caso não for o lugar adequado para o boost
	forgeProgress = CONST_ME_GROUNDSHAKER, -- efeito na bancada quando o item sumir dando efeito de martelada
    firstHit = CONST_ME_BLOCKHIT, -- efeito ao usar a ferramenta no item
}

local sound = {
    forgeHit = SOUND_EFFECT_TYPE_ENV_FORGE_METAL_1,
    notification = SOUND_EFFECT_TYPE_ACTION_NOTIFICATION,
    failedForge = SOUND_EFFECT_TYPE_ACTION_WOOD_PIECES_FALL,
    alertChance = SOUND_EFFECT_TYPE_ACTION_SELECT_OBJECT,
    incorrectPos = SOUND_EFFECT_TYPE_MONSTER_MELEE_ATK_CONSTRUCT,
    levelup = SOUND_EFFECT_TYPE_ACTION_LEVEL_ACHIEVEMENT,
    payment = SOUND_EFFECT_TYPE_ACTION_REAWRD_FEY,
}

local forge = {
    north = { -- /\ /\ /\ /\
    --Position(32371, 32237, 7),
    },
    south = { -- \/ \/ \/ \/
    Position(32354, 32236, 6),
    Position(32356, 32236, 6),
    Position(32352, 32241, 6),
    Position(32350, 32241, 6),
    },
    east = { -- => => => =>
    --Position(32370, 32242, 7),
    },
    west = { -- <= <= <= <=
    --Position(32366, 32238, 7),
    },
}

local itemForge = {
    base = 2342, -- <== or ==>
    basetwo = 2344, -- /\ or \/
    anvil = 3458,
    basin = 2113,
    basintwo = 2112,
    basintree = 2111,
}

local chanceGlobal = {}
local chanceLevelForgeGlobal = {}
local exaltedChanceGlobal = {}
local targetGlobal = {}
local tierGlobal = {}
local classGlobal = {}

local leotk_tierBoost = Action()

function leotk_tierBoost.onUse(player, item, fromPosition, target, toPosition, isHotkey, tilePosition)
    local targetItem = target:getId()
    targetGlobal = targetItem
    local chance = math.random()
    chanceGlobal = chance
    local chanceBonus = math.random()
    local isForgeEmpty = true
    local expForge = player:getStorageValue(config.skillExpTree)
    local levelForge = player:getStorageValue(config.skillTree)
    local chanceLevelForge = skillTree.chanceTree * levelForge
    chanceLevelForgeGlobal = chanceLevelForge
    local expForgeFail = expForge + math.random(1, skillTree.failForgeSkill)
    local expForgeSucess = expForge + math.random(skillTree.failForgeSkill, skillTree.sucessForgeSkill)
    local expCheckLevelFree
    local expCheckLevelVip
    if levelForge == 0 then
        expCheckLevelFree = skillTree.maxExpFree
        expCheckLevelVip = skillTree.maxExpVip
    else
        expCheckLevelFree = skillTree.maxExpFree * (levelForge + 1)
        expCheckLevelVip = skillTree.maxExpVip * (levelForge + 1)
    end
    local tier = target:getTier()
    tierGlobal = tier
    local class = target:getClassification()
    classGlobal = class
    local checkPayment = false
    local validForge = false
    local forgePosition = nil
    local posTo = {}
    local directions = {"north", "south", "east", "west"}
    for _, direction in pairs(directions) do
        for _, wallPosition in pairs(forge[direction]) do
            local tile = Tile(wallPosition)
            if tile then
                local itemsOnForge = tile:getItems()
                for _, itemOnForge in ipairs(itemsOnForge) do
                    local itemID = itemOnForge:getId()
                    if not (
                        itemID == itemForge.anvil or
                        itemID == itemForge.base or
                        itemID == itemForge.basetwo
                    ) then
                        isForgeEmpty = false
                        validForge = true
                        break
                    end
                end
            end
        end
    end

    local isValidPosition = false
    for _, direction in pairs(directions) do
        for _, wallPosition in pairs(forge[direction]) do
            if wallPosition == toPosition then
                isValidPosition = true
                break
            end
        end
    end
    
    if not isValidPosition then
        player:say(targetItem and message.notValid, TALKTYPE_MONSTER_SAY)
        player:getPosition():sendMagicEffect(effect.notValid)
        player:getPosition():sendSingleSoundEffect(sound.incorrectPos, player:isInGhostMode() and nil or player)
        return true
    end

    if isForgeEmpty then
        player:say(targetItem and message.notItemInForge, TALKTYPE_MONSTER_SAY)
        player:getPosition():sendMagicEffect(effect.notValid)
        player:getPosition():sendSingleSoundEffect(sound.incorrectPos, player:isInGhostMode() and nil or player)
        return true
    end

    if tier < config.minTier then
        player:say(message.notTierMin .." "..config.minTier.." "..message.notTierMinTwo.." ", TALKTYPE_MONSTER_SAY)
        player:getPosition():sendMagicEffect(effect.notValid)
        player:getPosition():sendSingleSoundEffect(sound.incorrectPos, player:isInGhostMode() and nil or player)
        return true
    end

    if tier >= 10 then
        player:say(message.notTierMax, TALKTYPE_MONSTER_SAY)
        player:getPosition():sendMagicEffect(effect.notValid)
        player:getPosition():sendSingleSoundEffect(sound.incorrectPos, player:isInGhostMode() and nil or player)
        return true
    end

    if player:getStorageValue(config.storageNoLogout) - os.time() > 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[System] Alert, you must wait "..player:getStorageValue(config.storageNoLogout) - os.time().." seconds, to forge again.")
        player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
        player:getPosition():sendMagicEffect(effect.notValid)
        return true
        end
    
    if not validForge then
        player:say(targetItem and message.notValid, TALKTYPE_MONSTER_SAY)
		player:getPosition():sendMagicEffect(effect.notValid)
        player:getPosition():sendSingleSoundEffect(sound.incorrectPos, player:isInGhostMode() and nil or player)
        return true
    end

    if validForge and tier < config.minTier or tier >= 10 then
        player:say(targetItem and message.notValidItem, TALKTYPE_MONSTER_SAY)
		player:getPosition():sendMagicEffect(effect.notValid)
        player:getPosition():sendSingleSoundEffect(sound.incorrectPos, player:isInGhostMode() and nil or player)
        return true
    end

    if player:getStorageValue(config.checkExaltedCore) - os.time() <= 0 and player:getStorageValue(config.addExaltedCore) == 0 then
        player:setStorageValue(config.addExaltedCore, -1)
    end

    if player:getStorageValue(config.addExaltedCore) <= -1 then
        addDetailExaltedCore(player)
        return true
    end

    if player:getStorageValue(config.addExaltedCore) <= -1 then
        return true
    end

    if player:getStorageValue(config.addExaltedCore) >= 1 then
        if player:isVip() == true then
            local exaltedChance = skillTree.chanceVip + chanceLevelForge + config.chanceAddExaltedCore
            exaltedChanceGlobal = exaltedChance
        else
            local exaltedChance = skillTree.chanceFree + chanceLevelForge + config.chanceAddExaltedCore  
            exaltedChanceGlobal = exaltedChance
        end
    else
        if player:isVip() == false then
            local exaltedChance = skillTree.chanceVip + chanceLevelForge
            exaltedChanceGlobal = exaltedChance
        else
            local exaltedChance = skillTree.chanceVip + chanceLevelForge
            exaltedChanceGlobal = exaltedChance
        end
    end

    local classificationId = class
    local classificationTable = classification[classificationId]
    if classificationTable then
        local upgradeLevel = tier
        local info = classificationTable[upgradeLevel]
        if info then
            if classificationId <= 4 and upgradeLevel >= 10 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Classification] This item belonging to classification ".. class .." cannot exceed tier ".. tier ..".")
            player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
            player:getPosition():sendMagicEffect(effect.notValid)
            return true
            elseif classificationId <= 3 and upgradeLevel >= 8 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Classification] This item belonging to classification ".. class .." cannot exceed tier ".. tier ..".")
            player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
            player:getPosition():sendMagicEffect(effect.notValid)
            return true
            elseif classificationId <= 2 and upgradeLevel >= 5 then   
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Classification] This item belonging to classification ".. class .." cannot exceed tier ".. tier ..".")
            player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
            player:getPosition():sendMagicEffect(effect.notValid)
            return true
            elseif classificationId <= 1 and upgradeLevel >= 3 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Classification] This item belonging to classification ".. class .." cannot exceed tier ".. tier ..".")
            player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
            player:getPosition():sendMagicEffect(effect.notValid)
            return true
            end

            if classificationId <= 1 and upgradeLevel <= 3 then
                if upgradeLevel == 1 and player:getStorageValue(config.skillTree) <= 3 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 3 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 2 and player:getStorageValue(config.skillTree) <= 6 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 6 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 3 and player:getStorageValue(config.skillTree) <= 10 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 10 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                end
            elseif classificationId == 2 and upgradeLevel <= 5 then
                if upgradeLevel == 1 and player:getStorageValue(config.skillTree) <= 15 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 15 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 2 and player:getStorageValue(config.skillTree) <= 20 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 20 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 3 and player:getStorageValue(config.skillTree) <= 25 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 25 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 4 and player:getStorageValue(config.skillTree) <= 30 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 30 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 5 and player:getStorageValue(config.skillTree) <= 35 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 35 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                end
            elseif classificationId == 3 and upgradeLevel <= 8 then
                if upgradeLevel == 1 and player:getStorageValue(config.skillTree) <= 40 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 40 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 2 and player:getStorageValue(config.skillTree) <= 45 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 45 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 3 and player:getStorageValue(config.skillTree) <= 50 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 50 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 4 and player:getStorageValue(config.skillTree) <= 55 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 55 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 5 and player:getStorageValue(config.skillTree) <= 60 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 60 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 6 and player:getStorageValue(config.skillTree) <= 65 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 65 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 7 and player:getStorageValue(config.skillTree) <= 70 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 70 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 8 and player:getStorageValue(config.skillTree) <= 75 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 75 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                end
            elseif classificationId == 4 and upgradeLevel <= 10 then
                if upgradeLevel == 1 and player:getStorageValue(config.skillTree) <= 80 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 80 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 2 and player:getStorageValue(config.skillTree) <= 83 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 83 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 3 and player:getStorageValue(config.skillTree) <= 86 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 86 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 4 and player:getStorageValue(config.skillTree) <= 89 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 89 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 5 and player:getStorageValue(config.skillTree) <= 94 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 94 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 6 and player:getStorageValue(config.skillTree) <= 98 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 98 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 7 and player:getStorageValue(config.skillTree) <= 103 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 103 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 8 and player:getStorageValue(config.skillTree) <= 108 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 108 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 9 and player:getStorageValue(config.skillTree) <= 115 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 115 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                elseif upgradeLevel == 10 and player:getStorageValue(config.skillTree) <= 120 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] You need to be at forging level 120 to be able to forge items of this classification or tier.")
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)
                end
            end

            if player:getMoney() + player:getBankBalance() < info.price then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Payment Failed] You don't have enough " .. info.price .. " gold coins.")
                player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                player:getPosition():sendMagicEffect(effect.notValid)
            elseif player:getForgeDusts() < info.dust then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Payment Failed] You don't have enough " .. info.dust .. " dusts.")
                player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                player:getPosition():sendMagicEffect(effect.notValid)
            elseif chanceBonus <= bonusEffect.notConsumedGoldCoin then 
                checkPayment = true
                player:removeForgeDusts(info.dust)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bonus Effect] You have successfully. The ".. info.price .." gold wasn't consumed in the process, ".. info.dust .." dusts into the forge.")
                player:getPosition():sendMagicEffect(effect.sucess)
                player:getPosition():sendSingleSoundEffect(sound.payment, player:isInGhostMode() and nil or player)
            elseif chanceBonus <= bonusEffect.notConsumedDust then
                checkPayment = true
                player:removeMoneyBank(info.price)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bonus Effect] You have successfully deposited ".. info.price .." gold coins and The ".. info.dust .." dust wasn't consumed in the process.")
                player:getPosition():sendMagicEffect(effect.sucess)
                player:getPosition():sendSingleSoundEffect(sound.payment, player:isInGhostMode() and nil or player)
            elseif chanceBonus <= bonusEffect.notConsumedGoldAndDust then
                checkPayment = true
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bonus Effect] You have successfully. The ".. info.price .." gold wasn't consumed in the process, The ".. info.dust .." dust wasn't consumed in the process.")
                player:getPosition():sendMagicEffect(effect.sucess)
                player:getPosition():sendSingleSoundEffect(sound.payment, player:isInGhostMode() and nil or player)
            else
                checkPayment = true
                player:removeMoneyBank(info.price) 
                player:removeForgeDusts(info.dust)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Payment] You have successfully deposited ".. info.price .." gold coins and ".. info.dust .." dust into the forge.")
                player:getPosition():sendMagicEffect(effect.sucess)
                player:getPosition():sendSingleSoundEffect(sound.payment, player:isInGhostMode() and nil or player)
            end
        end
    end
    if checkPayment == true then else return true end
    posTo = player:getPosition()
    local itemRemoved = false
    local playerPosition = player:getPosition()
    local tolerance = 1
    for _, direction in pairs(directions) do
        for _, wallPosition in pairs(forge[direction]) do
            if math.abs(playerPosition.x - wallPosition.x) <= tolerance and
               math.abs(playerPosition.y - wallPosition.y) <= tolerance and
               math.abs(playerPosition.z - wallPosition.z) <= tolerance then
                local tile = Tile(wallPosition)
                if tile then
                    local itemOnForge = tile:getItemById(targetItem)
                    if itemOnForge then
                        player:setStorageValue(config.storageNoLogout, os.time() + config.durationForge + 2)
                        itemOnForge:remove()
                        wallPosition:sendMagicEffect(effect.firstHit)
                        forgePosition = wallPosition
                        for i = 1, config.durationForge do
                            addEvent(function() wallPosition:sendMagicEffect(effect.forgeProgress) end, 1000 * (i - 1))
                            addEvent(function() player:getPosition():sendSingleSoundEffect(sound.forgeHit, player:isInGhostMode() and nil or player) end, 1000 * (i - 2.8))
                        end
                        for i = 1, config.durationForge * 10 do
                            addEvent(function() player:teleportTo(posTo) end, 100 * (i - 1))
                        end
                        itemRemoved = true
                        break
                    end
                end
            end
        end
        if itemRemoved then
            break
        end
    end
    
    if player:getStorageValue(config.addExaltedCore) >= 1 then
        if player:isVip() == true then
            local showChanceVip = (exaltedChanceGlobal) * 100
            player:say(showChanceVip .. "% Sucess !", TALKTYPE_MONSTER_SAY)
            player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)   
        elseif player:isVip() == false then
            local showChanceFree = (exaltedChanceGlobal) * 100
            player:say(showChanceFree .. "% Sucess !", TALKTYPE_MONSTER_SAY)
            player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)   
        end
    else
        if player:isVip() == true then
            local showChanceVip = (skillTree.chanceVip + chanceLevelForge) * 100
            player:say(showChanceVip .. "% Sucess !", TALKTYPE_MONSTER_SAY)
            player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)   
        elseif player:isVip() == false then
            local showChanceFree = (skillTree.chanceFree + chanceLevelForge) * 100
            player:say(showChanceFree .. "% Sucess !", TALKTYPE_MONSTER_SAY)
            player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)   
        end
    end
    addEvent(function()
        -- CONFIGURAÇÃO DOS VIP
        if player:isVip() == true then
            if chance <= exaltedChanceGlobal then
                forgePosition:sendMagicEffect(effect.sucess)
                if config.removeBoostItem == true then
                    item:remove(config.tierBoostItem)
                end
                if chanceBonus <= bonusEffect.doubleTierUpgrade then
                    if levelForge >= skillTree.maxLevelFree then
                        player:say(targetItem and message.successTier .." ".. getItemName(targetItem) .." +".. tier+2 .. "", TALKTYPE_MONSTER_SAY)
                    else
                        if chanceBonus <= bonusEffect.doubleExpGainSucess then
                            player:say(targetItem and message.successTier .." ".. getItemName(targetItem) .." +".. tier+2 .. " \nBlacksmith: ".. (expForgeSucess * 2)-expForge .." exp", TALKTYPE_MONSTER_SAY)
                        else
                            player:say(targetItem and message.successTier .." ".. getItemName(targetItem) .." +".. tier+2 .. " \nBlacksmith: ".. expForgeSucess-expForge .." exp", TALKTYPE_MONSTER_SAY)
                        end
                    end
                else
                    if levelForge >= skillTree.maxLevelFree then
                        player:say(targetItem and message.successTier .." ".. getItemName(targetItem) .." +".. tier+1 .. "", TALKTYPE_MONSTER_SAY)
                    else
                        if chanceBonus <= bonusEffect.doubleExpGainSucess then
                            player:say(targetItem and message.successTier .." ".. getItemName(targetItem) .." +".. tier+1 .. " \nBlacksmith: ".. (expForgeSucess * 2)-expForge .." exp", TALKTYPE_MONSTER_SAY)
                        else
                            player:say(targetItem and message.successTier .." ".. getItemName(targetItem) .." +".. tier+1 .. " \nBlacksmith: ".. expForgeSucess-expForge .." exp", TALKTYPE_MONSTER_SAY)
                        end
                    end
                end
                if chanceBonus <= bonusEffect.doubleTierUpgrade and tier <= 8 then
                    local exaltedChest = player:addItem(config.exaltedChest, 1)
                    exaltedChest:addItem(target:getId(), 1):setTier(tier+2)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bonus Effect] Tier gained ".. tier .." to ".. tier+2 .."")
                else
                    local exaltedChest = player:addItem(config.exaltedChest, 1)
                    exaltedChest:addItem(target:getId(), 1):setTier(tier+1)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] Tier gained ".. tier .." to ".. tier+1 .."")
                end
                player:getPosition():sendSingleSoundEffect(sound.notification, player:isInGhostMode() and nil or player)
                if player:getStorageValue(config.skillTree) >= skillTree.maxLevelFree then
                    
                elseif expForgeSucess >= expCheckLevelVip then
                    local levelForgeSucess = levelForge + 1
                    player:say("Blacksmith Level Up", TALKTYPE_MONSTER_SAY)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] Level gained ".. levelForge .." to ".. levelForgeSucess .." level")
                    player:getPosition():sendSingleSoundEffect(sound.levelup, player:isInGhostMode() and nil or player)
                    player:setStorageValue(config.skillExpTree, 0)
                    player:setStorageValue(config.skillTree, levelForgeSucess)
                else
                    if chanceBonus <= bonusEffect.doubleExpGainSucess then
                        player:setStorageValue(config.skillExpTree, expForgeSucess * 2)
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bonus Effect] Exp gained from blacksmith: ".. (expForgeSucess * 2)-expForge .." - Exp: ".. (expForgeSucess * 2) .."/".. expCheckLevelVip ..".")
                    else
                        player:setStorageValue(config.skillExpTree, expForgeSucess)
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Sucess] Exp gained from blacksmith: ".. expForgeSucess-expForge .." - Exp: ".. expForgeSucess .."/".. expCheckLevelVip ..".")
                    end
                end
                else
                forgePosition:sendMagicEffect(effect.failed)
                if config.removeBoostItem == true then
                    item:remove(config.tierBoostItem)
                end
                if chanceBonus <= bonusEffect.notEffectUpgrade then
                    if levelForge >= skillTree.maxLevelFree then
                        player:say(targetItem and message.boostFailed .." ".. getItemName(targetItem) .." +".. tier+1 .."", TALKTYPE_MONSTER_SAY)
                    else
                        if chanceBonus <= bonusEffect.doubleExpGainSucess then
                            player:say(targetItem and message.boostFailed .." ".. getItemName(targetItem) .." +".. tier+1 .." \nBlacksmith: ".. (expForgeFail * 2)-expForge .." exp", TALKTYPE_MONSTER_SAY)
                        else
                            player:say(targetItem and message.boostFailed .." ".. getItemName(targetItem) .." +".. tier+1 .." \nBlacksmith: ".. expForgeFail-expForge .." exp", TALKTYPE_MONSTER_SAY)
                        end
                    end
                elseif chanceBonus <= bonusEffect.reduceTierItem then
                    if levelForge >= skillTree.maxLevelFree then
                        player:say(targetItem and message.boostFailed .." ".. getItemName(targetItem) .." +".. tier+1 .."", TALKTYPE_MONSTER_SAY)
                    else
                        if chanceBonus <= bonusEffect.doubleExpGainSucess then
                            player:say(targetItem and message.boostFailed .." ".. getItemName(targetItem) .." +".. tier+1 .." \nBlacksmith: ".. (expForgeFail * 2)-expForge .." exp", TALKTYPE_MONSTER_SAY)
                        else
                            player:say(targetItem and message.boostFailed .." ".. getItemName(targetItem) .." +".. tier+1 .." \nBlacksmith: ".. expForgeFail-expForge .." exp", TALKTYPE_MONSTER_SAY)
                        end
                    end
                end
                if chanceBonus <= bonusEffect.notEffectUpgrade then
                    local exaltedChest = player:addItem(config.exaltedChest, 1)
                    exaltedChest:addItem(target:getId(), 1):setTier(tier)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] Tier gained ".. tier .." to ".. tier .."")
                elseif chanceBonus <= bonusEffect.reduceTierItem and tier >= 1 then
                    local exaltedChest = player:addItem(config.exaltedChest, 1)
                    exaltedChest:addItem(target:getId(), 1):setTier(tier-1)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bonus Effect] Tier gained ".. tier .." to ".. tier-1 .."")
                else
                    local exaltedChest = player:addItem(config.exaltedChest, 1)
                    exaltedChest:addItem(target:getId(), 1):setTier(tier)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] Tier gained ".. tier .." to ".. tier .."")
                end
                    player:getPosition():sendSingleSoundEffect(sound.failedForge, player:isInGhostMode() and nil or player)
                if levelForge >= skillTree.maxLevelFree then

                elseif expForgeFail >= expCheckLevelVip then
                    local levelForgeFailed = levelForge + 1
                    player:say("Blacksmith Level Up", TALKTYPE_MONSTER_SAY)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] Level up ".. levelForge .." to ".. levelForgeFailed .." level.")
                    player:getPosition():sendSingleSoundEffect(sound.levelup, player:isInGhostMode() and nil or player)
                    player:setStorageValue(config.skillExpTree, 0)
                    player:setStorageValue(config.skillTree, levelForgeFailed)
                else
                    if chanceBonus <= bonusEffect.doubleExpGainSucess then
                        player:setStorageValue(config.skillExpTree, expForgeFail * 2)
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bonus Effect] Exp gained from blacksmith: ".. (expForgeFail * 2)-expForge .. " - Exp: ".. (expForgeFail * 2) .."/".. expCheckLevelVip ..".")
                    else
                        player:setStorageValue(config.skillExpTree, expForgeFail)
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Failed] Exp gained from blacksmith: ".. expForgeFail-expForge .. " - Exp: ".. expForgeFail .."/".. expCheckLevelVip ..".")
                    end
                end
            end

            -- CONFIGURAÇÃO DOS FREE
        elseif player:isVip() == false then
            if chance <= exaltedChanceGlobal then
                    forgePosition:sendMagicEffect(effect.sucess)
                    if config.removeBoostItem == true then
                        item:remove(config.tierBoostItem)
                    end
                        if chanceBonus <= bonusEffect.doubleTierUpgrade then
                            if levelForge >= skillTree.maxLevelFree then
                                player:say(targetItem and message.successTier .." ".. getItemName(targetItem) .." +".. tier+2 .. "", TALKTYPE_MONSTER_SAY)
                            else
                                if chanceBonus <= bonusEffect.doubleExpGainSucess then
                                    player:say(targetItem and message.successTier .." ".. getItemName(targetItem) .." +".. tier+2 .. " \nBlacksmith: ".. (expForgeSucess * 2)-expForge .." exp", TALKTYPE_MONSTER_SAY)
                                else
                                    player:say(targetItem and message.successTier .." ".. getItemName(targetItem) .." +".. tier+2 .. " \nBlacksmith: ".. expForgeSucess-expForge .." exp", TALKTYPE_MONSTER_SAY)
                                end
                            end
                        else
                            if levelForge >= skillTree.maxLevelFree then
                                player:say(targetItem and message.successTier .." ".. getItemName(targetItem) .." +".. tier+1 .. "", TALKTYPE_MONSTER_SAY)
                            else
                                if chanceBonus <= bonusEffect.doubleExpGainSucess then
                                    player:say(targetItem and message.successTier .." ".. getItemName(targetItem) .." +".. tier+1 .. " \nBlacksmith: ".. (expForgeSucess * 2)-expForge .." exp", TALKTYPE_MONSTER_SAY)
                                else
                                    player:say(targetItem and message.successTier .." ".. getItemName(targetItem) .." +".. tier+1 .. " \nBlacksmith: ".. expForgeSucess-expForge .." exp", TALKTYPE_MONSTER_SAY)
                                end
                            end
                        end
                    if chanceBonus <= bonusEffect.doubleTierUpgrade and tier <= 8 then
                        local exaltedChest = player:addItem(config.exaltedChest, 1)
                        exaltedChest:addItem(target:getId(), 1):setTier(tier+2)
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bonus Effect] Tier gained ".. tier .." to ".. tier+2 .."")
                    else
                        local exaltedChest = player:addItem(config.exaltedChest, 1)
                        exaltedChest:addItem(target:getId(), 1):setTier(tier+1)
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] Tier gained ".. tier .." to ".. tier+1 .."")
                    end
                    player:getPosition():sendSingleSoundEffect(sound.notification, player:isInGhostMode() and nil or player)
                    if player:getStorageValue(config.skillTree) >= skillTree.maxLevelFree then
                    elseif expForgeSucess >= expCheckLevelFree then
                        local levelForgeSucess = levelForge + 1
                        player:say("Blacksmith Level Up", TALKTYPE_MONSTER_SAY)
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] Level gained ".. levelForge .." to ".. levelForgeSucess .." level")
                        player:getPosition():sendSingleSoundEffect(sound.levelup, player:isInGhostMode() and nil or player)
                        player:setStorageValue(config.skillExpTree, 0)
                        player:setStorageValue(config.skillTree, levelForgeSucess)
                    else
                        if chanceBonus <= bonusEffect.doubleExpGainSucess then
                            player:setStorageValue(config.skillExpTree, expForgeSucess * 2)
                            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bonus Effect] Exp gained from blacksmith: ".. (expForgeSucess * 2)-expForge .." - Exp: ".. (expForgeSucess * 2) .."/".. expCheckLevelFree ..".")  
                        else
                            player:setStorageValue(config.skillExpTree, expForgeSucess)
                            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Sucess] Exp gained from blacksmith: ".. expForgeSucess-expForge .." - Exp: ".. expForgeSucess .."/".. expCheckLevelFree ..".")
                        end
                    end
                    else
                    forgePosition:sendMagicEffect(effect.failed)
                    if config.removeBoostItem == true then
                        item:remove(config.tierBoostItem)
                    end
                    if chanceBonus <= bonusEffect.notEffectUpgrade then
                        if levelForge >= skillTree.maxLevelFree then
                            player:say(targetItem and message.boostFailed .." ".. getItemName(targetItem) .." +".. tier+1 .."", TALKTYPE_MONSTER_SAY)
                        else
                            if chanceBonus <= bonusEffect.doubleExpGainSucess then
                                player:say(targetItem and message.boostFailed .." ".. getItemName(targetItem) .." +".. tier+1 .." \nBlacksmith: ".. (expForgeFail * 2)-expForge .." exp", TALKTYPE_MONSTER_SAY)
                            else
                                player:say(targetItem and message.boostFailed .." ".. getItemName(targetItem) .." +".. tier+1 .." \nBlacksmith: ".. expForgeFail-expForge .." exp", TALKTYPE_MONSTER_SAY)
                            end
                        end
                    elseif chanceBonus <= bonusEffect.reduceTierItem then
                        if levelForge >= skillTree.maxLevelFree then
                            player:say(targetItem and message.boostFailed .." ".. getItemName(targetItem) .." +".. tier+1 .."", TALKTYPE_MONSTER_SAY)
                        else
                            if chanceBonus <= bonusEffect.doubleExpGainSucess then
                                player:say(targetItem and message.boostFailed .." ".. getItemName(targetItem) .." +".. tier+1 .." \nBlacksmith: ".. (expForgeFail * 2)-expForge .." exp", TALKTYPE_MONSTER_SAY)
                            else
                                player:say(targetItem and message.boostFailed .." ".. getItemName(targetItem) .." +".. tier+1 .." \nBlacksmith: ".. expForgeFail-expForge .." exp", TALKTYPE_MONSTER_SAY)
                            end
                        end
                    end
                    if chanceBonus <= bonusEffect.notEffectUpgrade then
                        local exaltedChest = player:addItem(config.exaltedChest, 1)
                        exaltedChest:addItem(target:getId(), 1):setTier(tier)
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] Tier gained ".. tier .." to ".. tier .."")
                    elseif chanceBonus <= bonusEffect.reduceTierItem and tier >= 1 then
                        local exaltedChest = player:addItem(config.exaltedChest, 1)
                        exaltedChest:addItem(target:getId(), 1):setTier(tier-1)
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bonus Effect] Tier gained ".. tier .." to ".. tier-1 .."")
                    else
                        local exaltedChest = player:addItem(config.exaltedChest, 1)
                        exaltedChest:addItem(target:getId(), 1):setTier(tier) 
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] Tier gained ".. tier .." to ".. tier .."")
                    end
                    player:getPosition():sendSingleSoundEffect(sound.failedForge, player:isInGhostMode() and nil or player)
                    if levelForge >= skillTree.maxLevelFree then

                    elseif expForgeFail >= expCheckLevelFree then
                        local levelForgeFailed = levelForge + 1
                        player:say("Blacksmith Level Up", TALKTYPE_MONSTER_SAY)
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Blacksmith] Level up ".. levelForge .." to ".. levelForgeFailed .." level.")
                        player:getPosition():sendSingleSoundEffect(sound.levelup, player:isInGhostMode() and nil or player)
                        player:setStorageValue(config.skillExpTree, 0)
                        player:setStorageValue(config.skillTree, levelForgeFailed)
                    else
                        if chanceBonus <= bonusEffect.doubleExpGainSucess then
                            player:setStorageValue(config.skillExpTree, expForgeFail * 2)
                            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bonus Effect] Exp gained from blacksmith: ".. (expForgeFail * 2)-expForge .. " - Exp: ".. (expForgeFail * 2) .."/".. expCheckLevelFree ..".")
                        else
                            player:setStorageValue(config.skillExpTree, expForgeFail)
                            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Failed] Exp gained from blacksmith: ".. expForgeFail-expForge .. " - Exp: ".. expForgeFail .."/".. expCheckLevelFree ..".")
                        end
                        return true
                    end
                    return true
                end
                return true
            end
    end, config.durationForge * 1000)
    if chanceBonus <= bonusEffect.rechargeDustMax then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bonus Effect] Dust refilled to maximum.")
        player:setForgeDusts(player:getForgeDustLevel())
    end
    if player:getStorageValue(config.addExaltedCore) >= 0 then
        player:setStorageValue(config.addExaltedCore, -1)
    end
    return true
end

leotk_tierBoost:id(config.tierBoostItem)
leotk_tierBoost:register()

local leotk_tierBoostLogout = CreatureEvent("TierBoostLogout")
function leotk_tierBoostLogout.onLogout(player)
	if player:getStorageValue(config.storageNoLogout) - os.time() > 0 then
       player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[System] Alert, you can disconnect at "..player:getStorageValue(config.storageNoLogout) - os.time().." seconds")
       player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
       player:getPosition():sendMagicEffect(effect.notValid)
	elseif player:getStorageValue(config.checkExaltedCore) - os.time() > 0 then
       player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[System] Alert, you can disconnect at "..player:getStorageValue(config.checkExaltedCore) - os.time().." seconds")
       player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
       player:getPosition():sendMagicEffect(effect.notValid)
	return false
	end
    return true
end
leotk_tierBoostLogout:register()

local leotk_tierBoostLogin = CreatureEvent("TierBoostLogin")
function leotk_tierBoostLogin.onLogin(player)
	if not player then
		return true
	end
    if player:getStorageValue(config.skillTree) < 0 then
        player:setStorageValue(config.skillTree, 0)
    end
    if player:getStorageValue(config.skillExpTree) < 0 then
        player:setStorageValue(config.skillExpTree, 0)
    end
    return true
end
leotk_tierBoostLogin:register()

local leotk_tierBoostStartup = GlobalEvent("TierBoostStartup")
function leotk_tierBoostStartup.onStartup()
    local function isItemOnPosition(position, itemId)
        local tile = Tile(position)
        return tile:getTopItemCount(itemId) > 0
    end
    
    local function createForgeBase(baseConfig, direction, itemForge, wallPosition)
        local yOffset = 0
        local xOffset = 0
    
        if direction == "north" then
            yOffset = 2
            xOffset = -1
        elseif direction == "south" then
            yOffset = -0
            xOffset = -1
        elseif direction == "east" then
            xOffset = -2
            yOffset = 1
        elseif direction == "west" then
            xOffset = 0
            yOffset = 1
        end
    
        for i, row in ipairs(baseConfig) do
            for j, value in ipairs(row) do
                local position = Position(wallPosition.x + j - 1 + xOffset, wallPosition.y - i + 1 + yOffset, wallPosition.z)
                if value == 2 and not isItemOnPosition(position, itemForge.basetwo) then
                    Game.createItem(itemForge.basetwo, 1, position)
                elseif value == 0 and isItemOnPosition(position, itemForge.basetwo) then
                    local topItems = Tile(position):getItems()
                    for _, item in ipairs(topItems) do
                        if item:getId() == itemForge.basetwo then
                            item:remove()
                        end
                    end
                elseif value == 3 then
                    if not isItemOnPosition(position, itemForge.base) then
                        Game.createItem(itemForge.base, 1, position)
                        local anvil = Game.createItem(itemForge.anvil, 1, position)
                        anvil:setActionId(config.actionId)
                    end
                elseif value == 4 then
                    local tile = Tile(position)
                    local items = tile:getItems()
                    local itemExists = false
                    for _, item in pairs(items) do
                        if item:getId() == itemForge.basin or item:getId() ~= itemForge.basin then
                            itemExists = true
                            break
                        end
                    end
                
                    if not itemExists then
                        Game.createItem(itemForge.basin, 1, position)
                    end 
                elseif value == 5 then
                    if not isItemOnPosition(position, itemForge.base) then
                        Game.createItem(itemForge.basetwo, 1, position)
                        local anvil = Game.createItem(itemForge.anvil, 1, position)
                        anvil:setActionId(config.actionId)
                    end
                elseif value == 6 then
                    if not isItemOnPosition(position, itemForge.base) then
                        Game.createItem(itemForge.basintwo, 1, position)
                    end 
                elseif value == 7 then
                    if not isItemOnPosition(position, itemForge.base) then
                        Game.createItem(itemForge.basintree, 1, position)
                    end 
                elseif value == 1 then  -- Adicionando verificação para o valor 1
                    if not isItemOnPosition(position, itemForge.base) then
                        Game.createItem(itemForge.base, 1, position)
                    end
                elseif value == 0 and isItemOnPosition(position, itemForge.basin) then
                    local topItems = Tile(position):getItems()
                    for _, item in ipairs(topItems) do
                        if item:getId() == itemForge.basin then
                            item:remove()
                        end
                    end
                end
            end
        end
    end    
    
    local directions = {"north", "south", "east", "west"}
    
    for _, direction in pairs(directions) do
        for _, wallPosition in pairs(forge[direction]) do
            local baseConfig
            if direction == "north" then
                baseConfig = {
                    {0, 0, 0},
                    {0, 0, 0},
                    {0, 3, 0},
                    {0, 0, 0}
                }
            elseif direction == "south" then
                baseConfig = {
                    {0, 3, 0},
                    {0, 0, 0},
                    {0, 0, 0}
                }
            elseif direction == "east" then
                baseConfig = {
                    {0, 0, 0},
                    {0, 0, 5},
                    {0, 0, 0}
                }
            elseif direction == "west" then
                baseConfig = {
                    {0, 0, 0},
                    {5, 0, 0},
                    {0, 0, 0}
                }
            end
            createForgeBase(baseConfig, direction, itemForge, wallPosition)
        end
    end
    
    return true
end

leotk_tierBoostStartup:register()


local forgePos = {}
function tierMain(player, button, choice)
    local window = ModalWindow{
        title = "Tier Forge",
        message = "Select one of the forge options."
        }
        window:addChoice("Open Forge [VIP]", function() openForge(player) end)
        window:addChoice("Create Slivers", function() detailSliver(player) end)
        window:addChoice("Create Dusts", function() createDust(player) end)
        window:addChoice("Create ".. config.exaltedCoreName.."", function() createCore(player) end)
		window:addChoice("Remove Exalted Core", function() removeExaltedCore(player) end)
        window:addButton("Select")
        window:addButton("Exit", function() closeTierForge(player) end)
        window:sendToPlayer(player)
    return true
end

function openForge(player, button, choice)
   if player:isVip() == true then
    player:openForge()
   elseif player:isVip() == false then
    local window = ModalWindow{
        title = "Tier Forge",
        message = "Only VIP players have access to this option."
        }
        window:addChoice("Purchase your VIP")
        window:addChoice("To access this option")
        window:addButton("Back", function() tierMain(player) end)
        window:addButton("Exit", function() closeTierForge(player) end)
        window:sendToPlayer(player)
    end
return true
end

function detailSliver(player, button, choice)
    local window = ModalWindow{
        title = "Tier Forge",
        message = "Select one of the forge options."
        }
        window:addChoice("Use Dusts", function() createSliver(player) end)
        window:addChoice("Use "..config.exaltedCoreName .."", function() detailCoreToSliver(player) end)
        window:addButton("Select")
        window:addButton("Back", function() tierMain(player) end)
        window:addButton("Exit", function() closeTierForge(player) end)
        window:sendToPlayer(player)
    return true
end

function createSliver(player, button, choice)
    local window = ModalWindow{
        title = "Tier Forge",
        message = "Select one of the forge options."
        }
        window:addChoice("Requirements: ")
        window:addChoice(config.createDust .."/"..player:getForgeDusts().." Dusts")
        window:addChoice("To receive: ")
        window:addChoice("3 Slivers")
        window:addButton("Forge", function() forgeSliver(player) end)
        window:addButton("Back", function() detailSliver(player) end)
        window:addButton("Exit", function() closeTierForge(player) end)
        window:sendToPlayer(player)
    return true
end

function forgeSliver(player)
    local posTo = player:getPosition()
    if player:getForgeDusts() >= 60 then
        player:removeForgeDusts(60)
        for i = 1, config.durationForge do
            addEvent(function() forgePos:sendMagicEffect(effect.forgeProgress) end, 1000 * (i - 1))
            addEvent(function() player:getPosition():sendSingleSoundEffect(sound.forgeHit, player:isInGhostMode() and nil or player) end, 1000 * (i - 2.8))
        end
        for i = 1, config.durationForge * 10 do
            addEvent(function() player:teleportTo(posTo) end, 100 * (i - 1))
        end
        addEvent(function()
        player:addItem(config.exaltedSlivers, 3)
        player:getPosition():sendSingleSoundEffect(sound.notification, player:isInGhostMode() and nil or player)
        player:getPosition():sendMagicEffect(effect.sucess)
        local window = ModalWindow{
            title = "Tier Forge",
            message = "You converted dust to slivers."
        }
        window:addChoice("Convert: ".. config.createDust.." dusts")
        window:addChoice("To: ".. config.createSliver.." slivers")
        window:addButton("Forge", function() forgeSliver(player) end)
        window:addButton("Back", function() createSliver(player) end)
        window:addButton("Exit", function() closeTierForge(player) end)
        window:sendToPlayer(player)
        end, config.durationForge * 1000)
     else
            local window = ModalWindow{
                title = "Tier Forge",
                message = "You do not have enough dusts."
            }
            window:addChoice("Need is: ".. config.createDust.. " dusts")
            window:addChoice("You have: ".. player:getForgeDusts().. " dusts")
            window:addButton("Back", function() createSliver(player) end)
            window:addButton("Exit", function() closeTierForge(player) end)
            window:sendToPlayer(player)
        player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
        player:getPosition():sendMagicEffect(effect.notValid)
    end
end

function createDust(player, button, choice)
    local getSliver = player:getItemCount(config.exaltedSlivers)
    local window = ModalWindow{
        title = "Tier Forge",
        message = "Select one of the forge options."
        }
        window:addChoice("Requirements: ")
        window:addChoice(config.createSliver .."/"..getSliver.." Slivers")
        window:addChoice("To receive: ")
        window:addChoice("60 Dusts")
        window:addButton("Forge", function() sliverToDust(player) end)
        window:addButton("Back", function() tierMain(player) end)
        window:addButton("Exit", function() closeTierForge(player) end)
        window:sendToPlayer(player)
    return true
end

function sliverToDust(player)
    local getSliver = player:getItemCount(config.exaltedSlivers)
    local posTo = player:getPosition()
    local getDusts = player:getForgeDusts() + config.sliverToDust
    if getDusts <= player:getForgeDustLevel() then
        if getSliver >= 3 then
            player:removeItem(config.exaltedSlivers, 3)
            for i = 1, config.durationForge do
                addEvent(function() forgePos:sendMagicEffect(effect.forgeProgress) end, 1000 * (i - 1))
                addEvent(function() player:getPosition():sendSingleSoundEffect(sound.forgeHit, player:isInGhostMode() and nil or player) end, 1000 * (i - 2.8))
            end
            for i = 1, config.durationForge * 10 do
                addEvent(function() player:teleportTo(posTo) end, 100 * (i - 1))
            end
            addEvent(function()
            player:addForgeDusts(60)
            player:getPosition():sendSingleSoundEffect(sound.notification, player:isInGhostMode() and nil or player)
            player:getPosition():sendMagicEffect(effect.sucess)
            local window = ModalWindow{
                title = "Tier Forge",
                message = "You converted slivers to dust."
            }
            window:addChoice("Convert: ".. config.createSliver.." slivers")
            window:addChoice("To: ".. config.createDust.." dusts")
            window:addButton("Forge", function() sliverToDust(player) end)
            window:addButton("Back", function() createDust(player) end)
            window:addButton("Exit", function() closeTierForge(player) end)
            window:sendToPlayer(player)
            end, config.durationForge * 1000)
            else
                local window = ModalWindow{
                    title = "Tier Forge",
                    message = "You do not have enough slivers."
                }
                window:addChoice("Need is: ".. config.createSliver.." slivers")
                window:addChoice("You have: ".. getSliver.." slivers")
                window:addButton("Back", function() createDust(player) end)
                window:addButton("Exit", function() closeTierForge(player) end)
                window:sendToPlayer(player)
            player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
            player:getPosition():sendMagicEffect(effect.notValid)
        end
    else
        local window = ModalWindow{
            title = "Tier Forge",
            message = "You cannot exceed your maximum Dust capacity."
        }
        window:addChoice("Amount: ".. getDusts .." dusts")
        window:addChoice("Capacity: ".. player:getForgeDustLevel() .." dusts")
        window:addChoice("Forced: ".. player:getForgeDustLevel() .."/".. player:getForgeDustLevel() .." dusts")
        window:addButton("Force", function() ForcesliverToDust(player) end)
        window:addButton("Back", function() createDust(player) end)
        window:addButton("Exit", function() closeTierForge(player) end)
        window:sendToPlayer(player)
        player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
        player:getPosition():sendMagicEffect(effect.notValid)
    end
end

function ForcesliverToDust(player)
    local getSliver = player:getItemCount(config.exaltedSlivers)
    local posTo = player:getPosition()
    local getDusts = player:getForgeDusts() + config.sliverToDust
    if getDusts < player:getForgeDustLevel() then
        if getSliver >= 3 then
            player:removeItem(config.exaltedSlivers, 3)
            for i = 1, config.durationForge do
                addEvent(function() forgePos:sendMagicEffect(effect.forgeProgress) end, 1000 * (i - 1))
                addEvent(function() player:getPosition():sendSingleSoundEffect(sound.forgeHit, player:isInGhostMode() and nil or player) end, 1000 * (i - 2.8))
            end
            for i = 1, config.durationForge * 10 do
                addEvent(function() player:teleportTo(posTo) end, 100 * (i - 1))
            end
            addEvent(function()
            player:setForgeDusts(player:getForgeDustLevel())
            player:getPosition():sendSingleSoundEffect(sound.notification, player:isInGhostMode() and nil or player)
            player:getPosition():sendMagicEffect(effect.sucess)
            local window = ModalWindow{
                title = "Tier Forge",
                message = "You converted slivers to dust."
            }
            window:addChoice("Convert: ".. config.createSliver.." slivers")
            window:addChoice("To: ".. config.createDust.." dusts")
            window:addButton("Forge", function() sliverToDust(player) end)
            window:addButton("Back", function() createDust(player) end)
            window:addButton("Exit", function() closeTierForge(player) end)
            window:sendToPlayer(player)
            end, config.durationForge * 1000)
            else
                local window = ModalWindow{
                    title = "Tier Forge",
                    message = "You do not have enough slivers."
                }
                window:addChoice("Need is: ".. config.createSliver.." slivers")
                window:addChoice("You have: ".. getSliver.." slivers")
                window:addButton("Back", function() createDust(player) end)
                window:addButton("Exit", function() closeTierForge(player) end)
                window:sendToPlayer(player)
            player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
            player:getPosition():sendMagicEffect(effect.notValid)
        end
    else
        if player:getForgeDusts() < player:getForgeDustLevel() then
            player:removeItem(config.exaltedSlivers, 3)
            for i = 1, config.durationForge do
                addEvent(function() forgePos:sendMagicEffect(effect.forgeProgress) end, 1000 * (i - 1))
                addEvent(function() player:getPosition():sendSingleSoundEffect(sound.forgeHit, player:isInGhostMode() and nil or player) end, 1000 * (i - 2.8))
            end
            for i = 1, config.durationForge * 10 do
                addEvent(function() player:teleportTo(posTo) end, 100 * (i - 1))
            end
            addEvent(function()
            player:setForgeDusts(player:getForgeDustLevel())
            player:getPosition():sendSingleSoundEffect(sound.notification, player:isInGhostMode() and nil or player)
            player:getPosition():sendMagicEffect(effect.sucess)
            local window = ModalWindow{
                title = "Tier Forge",
                message = "You converted slivers to dust."
            }
            window:addChoice("Convert: ".. config.createSliver.." slivers")
            window:addChoice("To: ".. player:getForgeDustLevel().." dusts")
            window:addButton("Back", function() createDust(player) end)
            window:addButton("Exit", function() closeTierForge(player) end)
            window:sendToPlayer(player)
            end, config.durationForge * 1000)
        else
            player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
            player:getPosition():sendMagicEffect(effect.notValid)
            local window = ModalWindow{
                title = "Tier Forge",
                message = "You already have the maximum dust capacity."
            }
            window:addChoice("Amount: ".. player:getForgeDusts().." slivers")
            window:addChoice("Capacity: ".. player:getForgeDustLevel().." dusts")
            window:addButton("Back", function() createDust(player) end)
            window:addButton("Exit", function() closeTierForge(player) end)
            window:sendToPlayer(player)
        end
    end
end

function detailCoreToSliver(player, button, choice)
    local window = ModalWindow{
        title = "Tier Forge",
        message = "Select one of the forge options."
        }
        window:addChoice("Requirements: ")
        window:addChoice(config.coreToSliver .."/"..player:getItemCount(config.exaltedCore).."  ".. config.exaltedCoreName .."")
        window:addChoice("To receive: ")
        window:addChoice(config.createCoreToSliver.." slivers")
        window:addButton("Forge", function() createCoreToSliver(player) end)
        window:addButton("Back", function() detailSliver(player) end)
        window:addButton("Exit", function() closeTierForge(player) end)
        window:sendToPlayer(player)
    return true
end

function createCoreToSliver(player, button, choice)
    local posTo = player:getPosition()
    if player:getItemCount(config.exaltedCore) >= 1 then
        player:removeItem(config.exaltedCore, 1)
        for i = 1, config.durationForge do
            addEvent(function() forgePos:sendMagicEffect(effect.forgeProgress) end, 1000 * (i - 1))
            addEvent(function() player:getPosition():sendSingleSoundEffect(sound.forgeHit, player:isInGhostMode() and nil or player) end, 1000 * (i - 2.8))
        end
        for i = 1, config.durationForge * 10 do
            addEvent(function() player:teleportTo(posTo) end, 100 * (i - 1))
        end
        addEvent(function()
        player:addItem(config.exaltedSlivers, 50)
        player:getPosition():sendSingleSoundEffect(sound.notification, player:isInGhostMode() and nil or player)
        player:getPosition():sendMagicEffect(effect.sucess)
        local window = ModalWindow{
            title = "Tier Forge",
            message = "You converted core to slivers."
        }
        window:addChoice("Convert: ".. config.coreToSliver.." ".. config.exaltedCoreName .."")
        window:addChoice("To: ".. config.createCoreToSliver.." slivers")
        window:addButton("Forge", function() createCoreToSliver(player) end)
        window:addButton("Back", function() detailCoreToSliver(player) end)
        window:addButton("Exit", function() closeTierForge(player) end)
        window:sendToPlayer(player)
        end, config.durationForge * 1000)
     else
            local window = ModalWindow{
                title = "Tier Forge",
                message = "You do not have enough dusts."
            }
            window:addChoice("Need is: ".. config.coreToSliver.. " ".. config.exaltedCoreName .."")
            window:addChoice("You have: ".. player:getItemCount(config.exaltedCore).. " ".. config.exaltedCoreName .."")
            window:addButton("Back", function() detailCoreToSliver(player) end)
            window:addButton("Exit", function() closeTierForge(player) end)
            window:sendToPlayer(player)
        player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
        player:getPosition():sendMagicEffect(effect.notValid)
    end
    return true
end

function createCore(player, button, choice)
    local getSliver = player:getItemCount(config.exaltedSlivers)
    local window = ModalWindow{
        title = "Tier Forge",
        message = "Select one of the forge options."
        }
        window:addChoice("Requirements: ")
        window:addChoice(config.createCoreToSliver .."/"..player:getItemCount(config.exaltedSlivers).." Slivers")
        window:addChoice("To receive: ")
        window:addChoice("1 ".. config.exaltedCoreName .."")
        window:addButton("Forge", function() forgeCore(player) end)
        window:addButton("Back", function() tierMain(player) end)
        window:addButton("Exit", function() closeTierForge(player) end)
        window:sendToPlayer(player)
    return true
end

function forgeCore(player, button, choice)
    local posTo = player:getPosition()
    if player:getItemCount(config.exaltedSlivers) >= 50 then
        player:removeItem(config.exaltedSlivers, 50)
        for i = 1, config.durationForge do
            addEvent(function() forgePos:sendMagicEffect(effect.forgeProgress) end, 1000 * (i - 1))
            addEvent(function() player:getPosition():sendSingleSoundEffect(sound.forgeHit, player:isInGhostMode() and nil or player) end, 1000 * (i - 2.8))
        end
        for i = 1, config.durationForge * 10 do
            addEvent(function() player:teleportTo(posTo) end, 100 * (i - 1))
        end
        addEvent(function()
        player:addItem(config.exaltedCore, 1)
        player:getPosition():sendSingleSoundEffect(sound.notification, player:isInGhostMode() and nil or player)
        player:getPosition():sendMagicEffect(effect.sucess)
        local window = ModalWindow{
            title = "Tier Forge",
            message = "You converted slivers to core."
        }
        window:addChoice("Convert: ".. config.createCoreToSliver.." slivers")
        window:addChoice("To: ".. config.coreToSliver.." ".. config.exaltedCoreName .."")
        window:addButton("Forge", function() forgeCore(player) end)
        window:addButton("Back", function() createCore(player) end)
        window:addButton("Exit", function() closeTierForge(player) end)
        window:sendToPlayer(player)
        end, config.durationForge * 1000)
     else
            local window = ModalWindow{
                title = "Tier Forge",
                message = "You do not have enough dusts."
            }
            window:addChoice("Need is: ".. config.createCoreToSliver.. " slivers")
            window:addChoice("You have: ".. player:getItemCount(config.exaltedSlivers).. " slivers")
            window:addButton("Back", function() createCore(player) end)
            window:addButton("Exit", function() closeTierForge(player) end)
            window:sendToPlayer(player)
        player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
        player:getPosition():sendMagicEffect(effect.notValid)
    end
    return true
end

function closeTierForge(player, button, choice)
    return true
end

function addDetailExaltedCore(player, button, choice)
    local classificationId = classGlobal
    local classificationTable = classification[classificationId]
    if classificationTable then
        local upgradeLevel = tierGlobal
        local info = classificationTable[upgradeLevel]
        if info then
                local window = ModalWindow{
                    title = "Tier Forge",
                    message = "Do you want to add ".. config.exaltedCoreName .." to forge?"
                }
                local chanceExaltedCore = {}
                local NewchanceExaltedCore = {}
                local levelForge = player:getStorageValue(config.skillTree)
                if player:isVip() == true then
                    local chance = ((skillTree.chanceVip * 100) + (skillTree.chanceTree * levelForge * 100))
                    local newChance = ((skillTree.chanceVip * 100) + (skillTree.chanceTree * levelForge * 100) + (config.chanceAddExaltedCore * 100))
                    chanceExaltedCore = chance
                    NewchanceExaltedCore = newChance
                elseif player:isVip() == false then
                    local chance = ((skillTree.chanceFree * 100) + (skillTree.chanceTree * levelForge * 100))
                    local newChance = ((skillTree.chanceFree * 100) + (skillTree.chanceTree * levelForge * 100) + (config.chanceAddExaltedCore * 100))
                    chanceExaltedCore = chance
                    NewchanceExaltedCore = newChance
                end
                if info.core >= 2 then
                    window:addChoice("Added: ".. info.core .." "..config.exaltedCoreName .."'s")
                    window:addChoice("You have: ".. player:getItemCount(config.exaltedCore) .. " ".. config.exaltedCoreName .."'s")
                    if player:isVip() == true then
                        window:addChoice("Chance: " .. string.format("%.1f%%", chanceExaltedCore))
                        window:addChoice("New Chance: " .. string.format("%.1f%%", NewchanceExaltedCore))
                    elseif player:isVip() == false then
                        window:addChoice("Chance: " .. string.format("%.1f%%", chanceExaltedCore))
                        window:addChoice("New Chance: " .. string.format("%.1f%%", NewchanceExaltedCore))
                    end
                else
                    window:addChoice("Added: ".. info.core .." ".. config.exaltedCoreName .."")
                    window:addChoice("You have: ".. player:getItemCount(config.exaltedCore).. " ".. config.exaltedCoreName .."")
                    if player:isVip() == true then
                        window:addChoice("Chance: " .. string.format("%.1f%%", chanceExaltedCore))
                        window:addChoice("New Chance: " .. string.format("%.1f%%", NewchanceExaltedCore))
                    elseif player:isVip() == false then
                        window:addChoice("Chance: " .. string.format("%.1f%%", chanceExaltedCore))
                        window:addChoice("New Chance: " .. string.format("%.1f%%", NewchanceExaltedCore))
                    end
                end
                window:addButton("Add", function() addExaltedCore(player) end)
                window:addButton("No", function() noExaltedCore(player) end)
                window:sendToPlayer(player)
            end
        end
    return true
end

function noExaltedCore(player, button, choice)
        if player:getStorageValue(config.addExaltedCore) == -1 then
            player:setStorageValue(config.addExaltedCore, 0)
            player:setStorageValue(config.checkExaltedCore, os.time() + config.durationForge + 2)
        end
    return true
end

function addExaltedCore(player, target, button, choice)
    local tier = tierGlobal
    local class = classGlobal
    local classificationId = class
    local classificationTable = classification[classificationId]
    if classificationTable then
        local upgradeLevel = tier
        local info = classificationTable[upgradeLevel]
        if info then
            if player:getItemCount(config.exaltedCore) >= info.core then
                player:removeItem(config.exaltedCore, info.core)
                player:setStorageValue(config.addExaltedCore, 1)
                player:getPosition():sendSingleSoundEffect(sound.notification, player:isInGhostMode() and nil or player)
                player:getPosition():sendMagicEffect(effect.sucess)
                local window = ModalWindow{
                    title = "Tier Forge",
                    message = "You added ".. info.core .." ".. config.exaltedCoreName .." to the forge."
                }
                if info.core >= 2 then
                    window:addChoice("Added: ".. info.core .." ".. config.exaltedCoreName .."'s")
                    window:addChoice("You have: ".. player:getItemCount(config.exaltedCore).. " ".. config.exaltedCoreName .."'s")
                else
                    window:addChoice("Added: ".. info.core .." ".. config.exaltedCoreName .."")
                    window:addChoice("You have: ".. player:getItemCount(config.exaltedCore).. " ".. config.exaltedCoreName .."")
                end
                window:addButton("Exit", function() closeTierForge(player) end)
                window:sendToPlayer(player)
                else
                local window = ModalWindow{
                    title = "Tier Forge",
                    message = "You do not have enough ".. config.exaltedCoreName .."."
                }
                if info.core >= 2 then
                    window:addChoice("Need is: ".. info.core .. " ".. config.exaltedCoreName .."'s")
                    window:addChoice("You have: ".. player:getItemCount(config.exaltedCore).. " ".. config.exaltedCoreName .."'s")
                else
                    window:addChoice("Need is: ".. info.core .. " ".. config.exaltedCoreName .."")
                    window:addChoice("You have: ".. player:getItemCount(config.exaltedCore).. " ".. config.exaltedCoreName .."")
                end
                window:addButton("Exit", function() closeTierForge(player) end)
                window:sendToPlayer(player)
                player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                player:getPosition():sendMagicEffect(effect.notValid)
            end
        end
    end
    return true
end

function removeExaltedCore(player, button, choice)
    local tier = tierGlobal
    local class = classGlobal
    local classificationId = class  -- Converta a classificaÃ§Ã£o para o Ã­ndice da tabela
    local classificationTable = classification[classificationId]
    if classificationTable then
        local upgradeLevel = tier  -- NÃ­vel desejado
        local info = classificationTable[upgradeLevel]
        if info then
            if player:getStorageValue(config.addExaltedCore) >= 1 then
                    player:addItem(config.exaltedCore, info.core)
                    player:setStorageValue(config.addExaltedCore, -1)
                    player:getPosition():sendSingleSoundEffect(sound.notification, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.sucess)
                    local window = ModalWindow{
                        title = "Tier Forge",
                        message = "You removed ".. info.core .." ".. config.exaltedCoreName .." to the forge."
                    }
                    if info.core >= 2 then
                        window:addChoice("Removed: ".. info.core .." ".. config.exaltedCoreName .."'s")
                        window:addChoice("Status: Disabled")
                    else
                        window:addChoice("Removed: ".. info.core .." ".. config.exaltedCoreName .."")
                        window:addChoice("Status: Disabled")
                    end
                    window:addButton("Exit", function() closeTierForge(player) end)
                    window:sendToPlayer(player)
                    else
                    local window = ModalWindow{
                        title = "Tier Forge",
                        message = "You do not have ".. config.exaltedCoreName .." in the forge."
                    }
                    if info.core >= 2 then
                        window:addChoice("Need is: ".. info.core .. " ".. config.exaltedCoreName .."'s")
                        window:addChoice("You have: ".. player:getItemCount(config.exaltedCore).. " ".. config.exaltedCoreName .."'s")
                    elseif info.core == 1 then
                        window:addChoice("Need is: ".. info.core .. " ".. config.exaltedCoreName .."")
                        window:addChoice("You have: ".. player:getItemCount(config.exaltedCore).. " ".. config.exaltedCoreName .."")
                    end
                    window:addButton("Exit", function() closeTierForge(player) end)
                    window:sendToPlayer(player)
                    player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
                    player:getPosition():sendMagicEffect(effect.notValid)    
            end
            else
            local window = ModalWindow{
                title = "Tier Forge",
                message = "You do not have ".. config.exaltedCoreName .." in the forge."
            }
            if info.core >= 2 then
                window:addChoice("Need is: ".. info.core .. " ".. config.exaltedCoreName .."'s")
                window:addChoice("You have: ".. player:getItemCount(config.exaltedCore).. " ".. config.exaltedCoreName .."'s")
            elseif info.core == 1 then
                window:addChoice("Need is: ".. info.core .. " ".. config.exaltedCoreName .."")
                window:addChoice("You have: ".. player:getItemCount(config.exaltedCore).. " ".. config.exaltedCoreName .."")
            end
            window:addButton("Exit", function() closeTierForge(player) end)
            window:sendToPlayer(player)
            player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
            player:getPosition():sendMagicEffect(effect.notValid)
        end
    else
        local window = ModalWindow{
            title = "Tier Forge",
            message = "You do not have ".. config.exaltedCoreName .." in the forge."
        }
    window:addChoice("The forge is empty.")
        window:addButton("Exit", function() closeTierForge(player) end)
        window:sendToPlayer(player)
        player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
        player:getPosition():sendMagicEffect(effect.notValid)
    end
    return true
end

local anvilForge = Action()

function anvilForge.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getActionId() == config.actionId then
        tierMain(player)
        forgePos = item:getPosition()
    end
	return true
end

anvilForge:aid(config.actionId)
anvilForge:register()

local leotk_tierBoostTalk = TalkAction(config.statusCommand)

function leotk_tierBoostTalk.onSay(player, words, param)
    local expForge = player:getStorageValue(config.skillExpTree)
    local levelForge = player:getStorageValue(config.skillTree)
    local expCheckLevelFree
    local expCheckLevelVip
    if levelForge == 0 then
        expCheckLevelFree = skillTree.maxExpFree
        expCheckLevelVip = skillTree.maxExpVip
    else
        expCheckLevelFree = skillTree.maxExpFree * (levelForge + 1)
        expCheckLevelVip = skillTree.maxExpVip * (levelForge + 1)
    end
    if not player then
		return true
	end
    if player:getStorageValue(config.storageTalk) - os.time() > 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[System] Alert, you must wait "..player:getStorageValue(config.storageTalk) - os.time().." seconds, to forge again.")
        player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
        player:getPosition():sendMagicEffect(effect.notValid)
        return true
    end

    local text = "Tier Boost Forge Info: \n\n"
	text = text .. "Name: " .. player:getName() .. "\n\n"
	text = text .. "Level: " .. levelForge .. "\n\n"
    if player:isVip() == true then
        text = text .. "Exp: " .. expForge .. "/".. expCheckLevelVip .."\n\n" 
        text = text .. "Max level: " .. skillTree.maxLevelVip .. "\nMax chance: ".. skillTree.chanceTree*skillTree.maxLevelVip*100 .."%\n"
        text = text .. "Chance: " .. skillTree.chanceVip*100 .. "%\n\n"
        if player:getStorageValue(config.addExaltedCore) >= 1 then
            text = text .. "Exalted Bonus: Activated\n\n"
        else
            text = text .. "Exalted Bonus: Disabled\n\n"
        end
        if player:getStorageValue(config.addExaltedCore) >= 1 then
            text = text .. "Chance Total: " .. (skillTree.chanceVip * 100) + (skillTree.chanceTree * levelForge * 100) + (config.chanceAddExaltedCore * 100) .. "%\n\n"
        else
            text = text .. "Chance Total: " .. (skillTree.chanceVip * 100) + (skillTree.chanceTree * levelForge) .. "%\n\n"
        end
    elseif player:isVip() == false then
        text = text .. "Exp: " .. expForge .. "/".. expCheckLevelFree .."\n\n"
        text = text .. "Max level: " .. skillTree.maxLevelFree .. "\nMax chance: ".. skillTree.chanceTree*skillTree.maxLevelFree*100 .."%\n"
        text = text .. "Chance: " .. skillTree.chanceFree*100 .. "%\n\n"
        if player:getStorageValue(config.addExaltedCore) >= 1 then
            text = text .. "Exalted Bonus: Activated\n\n"
        else
            text = text .. "Exalted Bonus: Disabled\n\n"
        end
        if player:getStorageValue(config.addExaltedCore) >= 1 then
            text = text .. "Chance Total: " .. (skillTree.chanceFree * 100) + (skillTree.chanceTree * levelForge * 100) + (config.chanceAddExaltedCore * 100) .. "%\n\n"
        else
            text = text .. "Chance Total: " .. (skillTree.chanceFree * 100) + (skillTree.chanceTree * levelForge * 100) .. "%\n\n"
        end
    end
    text = text .. "Fail forge exp: 1 ~ " .. skillTree.failForgeSkill .. "\n\n"
    text = text .. "Sucess forge exp: ".. skillTree.failForgeSkill.." ~ " .. skillTree.sucessForgeSkill .. "\n\n"
    text = text .. "Multiplier chance level: " .. skillTree.chanceTree*100 .. "% per level\n"

	player:popupFYI(text)
    player:setStorageValue(config.storageTalk, os.time() + config.durationForge + 2)
    player:say(""..config.statusCommand.."", TALKTYPE_MONSTER_SAY)
	return true
end

leotk_tierBoostTalk:separator(" ")
leotk_tierBoostTalk:groupType("normal")
leotk_tierBoostTalk:register()