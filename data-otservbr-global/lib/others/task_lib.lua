taskOptions = {
	bonusReward = 65018, -- storage bonus reward
	bonusRate = 2, -- rate bonus reward
	taskBoardPositions = {
		{x = 32356, y = 32230, z = 7},
		{x = 32356, y = 32229, z = 7},
		{x = 32356, y = 32232, z = 7},
		{x = 32541, y = 30936, z = 7},
    },
	selectLanguage = 2 -- options: 1 = pt_br or 2 = english
}

task_pt_br = {
	exitButton = "Fechar",
	confirmButton = "Validar",
	cancelButton = "Anular",
	returnButton = "Voltar",
	title = "Quadro De Miss�es",
	missionError = "Miss�o esta em andamento ou ela j� foi concluida.",
	missionErrorTwo = "Voc� concluiu a miss�o",
	missionErrorTwoo = "\nAqui est�o suas recompensas:",
	choiceText = "- Experi�ncia: ",
	messageAcceptedText = "Voc� aceitou essa miss�o!",
	messageDetailsText = "Detalhes da miss�o:",
	choiceMonsterName = "Nome: ",
	choiceMonsterKill = "Abates: ",
	choiceEveryDay = "Repeti��o: Todos os dias",
	choiceRepeatable = "Repeti��o: Sempre",
	choiceOnce = "Repeti��o: Apenas uma vez",
	choiceReward = "Recompensas:",
	messageAlreadyCompleteTask = "Voc� j� concluiu essa miss�o.",
	choiceCancelTask = "Voc� cancelou essa miss�o",
	choiceCancelTaskError = "Voc� n�o pode cancelar essa miss�o, porque ela j� foi conclu�da ou n�o foi iniciada.",
	choiceBoardText = "Escolha uma miss�o e use os bot�es abaixo:",
	choiceRewardOnHold = "Resgatar Pr�mio",
	choiceDailyConclued = "Di�ria Conclu�da",
	choiceConclued = "Conclu�da",
	messageTaskBoardError = "O quadro de miss�es esta muito longe ou esse n�o � o quadro de miss�es correto.",
	messageCompleteTask = "Voc� terminou essa miss�o! \nRetorne para o quadro de miss�es e pegue sua recompensa.",
}

taskConfiguration = {
{name = "Rotworm", color = 40, total = 250, type = "once", storage = 190006, storagecount = 190007, 
rewards = {
{3374, 1},	--legion helmet
{3043, 10}, --crystal coin
{22724, 3}, -- item forge
{"exp", 1000000},
	},
},

{name = "Minotaur", color = 40, total = 5000, type = "once", storage = 190000, storagecount = 190001, 
rewards = {
{5878, 100},--100 mino leather 
{5804, 1}, -- nose ring
{22724, 10}, -- item forge
{"exp", 100000000},
	},
},


{name = "Dragon", color = 40, total = 1000, type = "once", storage = 190002, storagecount = 190003, 
rewards = {
{3043, 100},--crystal coin
{5908, 1}, --obsidian knife
{22724, 5}, -- item forge
{"exp", 15000000},
	},
},

{name = "Dragon Lord", color = 40, total = 6000, type = "once", storage = 190004, storagecount = 190005, 
rewards = {
{5948, 150}, --red dragon leather
{5919, 1}, --dragon claw
{22724, 5}, -- item forge
{"exp", 15000000},
	},
},

{name = "Amazon", color = 40, total = 50000, type = "once", storage = 190008, storagecount = 190009, 
rewards = { 
{3437, 1}, -- amazon shield
{22724, 50}, -- item forge
{"exp", 50000000},
	},
},


{name = "Guzzlemaw", color = 40, total = 10000, type = "once", storage = 190022, storagecount = 190023, 
rewards = { 
{20275, 1},	-- dream warden claw
{20270, 1}, -- silver prison key
{22724, 10}, -- item forge
{"exp", 15000000},
	},
},

{name = "Frazzlemaw", color = 40, total = 10000, type = "once", storage = 190022, storagecount = 190023, 
rewards = { 
{20276, 1},	-- dream warden mask
{20272, 1}, -- bronze prison key
{22724, 10}, -- item forge
{"exp", 15000000},

	},
},

{name = "Silencer", color = 40, total = 5000, type = "once", storage = 190024, storagecount = 190025, 
rewards = { 
{20271, 1}, --copper prison key
{22724, 5}, -- item forge
{"exp", 15000000},

	},
},

{name = "Medusa", color = 40, total = 25000, type = "once", storage = 190026, storagecount = 190027, 
rewards = { 
{3393, 1}, --amazon helmet
{22724, 25}, -- item forge
{"exp", 25000000},

	},
},

{name = "Demon", color = 40, total = 66666, type = "once", storage = 190028, storagecount = 190029, 
rewards = { 
{3365, 1}, -- golden helmet
{22724, 66}, -- item forge
{"exp", 150000000},

	},
},

{name = "Hero", color = 40, total = 50000, type = "once", storage = 190030, storagecount = 190031, 
rewards = { 
{3394, 1}, -- amazon armor
{22724, 30}, -- item forge
{"exp", 150000000},
	},
},

{name = "Cloak Of Terror", color = 40, total = 1000, type = "daily", storage = 190032, storagecount = 190033, 
rewards = { 
{"exp", 150000000},
{22724, 5}, -- item forge
	},
},

{name = "Vibrant Phantom", color = 40, total = 1000, type = "daily", storage = 190034, storagecount = 190035, 
rewards = { 
{"exp", 150000000},
{22724, 3}, -- item forge

	},
},

{name = "Courage Leech", color = 40, total = 1000, type = "daily", storage = 190036, storagecount = 190037, 
rewards = { 
{"exp", 150000000},
{22724, 5}, -- item forge
	},
},

{name = "Brachiodemon", color = 40, total = 1000, type = "daily", storage = 190038, storagecount = 190039, 
rewards = { 
{"exp", 150000000},
{22724, 5}, -- item forge
	},
},

{name = "Infernal Demon", color = 40, total = 50000, type = "once", storage = 190040, storagecount = 190041, 
rewards = { 
{34109, 2}, -- bag you desire
{22724, 20}, -- item forge

	},
},

{name = "Infernal Phantom", color = 40, total = 1000, type = "daily", storage = 190042, storagecount = 190043, 
rewards = { 
{"exp", 150000000},
{22724, 3}, -- item forge
	},
},

{name = "Juggernaut", color = 40, total = 5000, type = "once", storage = 190044, storagecount = 190045, 
rewards = { 
{3422, 1}, -- great shield
{22724, 5}, -- item forge
	},
},

{name = "Dawnfire Asura", color = 40, total = 1000, type = "daily", storage = 190046, storagecount = 190047, 
rewards = { 
{"exp", 20000000},
	},
},

{name = "Dark Carnisylvan", color = 40, total = 5000, type = "once", storage = 190062, storagecount = 190063, 
rewards = { 
{5913, 100}, -- 100 brown Piece of Cloth
{"exp", 100000000},
	},
},

{name = "Deathling Spellsinger", color = 40, total = 2000, type = "once", storage = 190062, storagecount = 190063, 
rewards = { 
{5958, 1},	-- Winning Lottery Ticket
{"exp", 100000000},
	},
},

{name = "Elder Bonelord", color = 40, total = 1000, type = "once", storage = 190064, storagecount = 190065, 
rewards = {   
{5898, 30},	-- 30 Bonelord Eye
{"exp", 15000000},
	},
},

{name = "Tortoise", color = 40, total = 2000, type = "once", storage = 190066, storagecount = 190067, 
rewards = {   
{5899, 100},	-- 100 turtle shell
{"exp", 15000000},
	},
},

{name = "Blue Djinn", color = 40, total = 1000, type = "once", storage = 190068, storagecount = 190069, 
rewards = {   
{5912, 100},	-- 100 blue piece of cloth
{"exp", 15000000},
	},
},

{name = "Green Djinn", color = 40, total = 1000, type = "once", storage = 190070, storagecount = 190071, 
rewards = {   
{5910, 100},	--100 green piece of cloth
{"exp", 15000000},
	},
},

{name = "Wailing Widow", color = 40, total = 1000, type = "once", storage = 190072, storagecount = 190073, 
rewards = {   
{5886, 10},	-- 10 spool of yarn
{"exp", 15000000},
	},
},

{name = "Pirate Marauder", color = 40, total = 3000, type = "daily", storage = 190074, storagecount = 190075, 
rewards = {   
{6097, 50},	-- 50 hook
{6126, 50},	-- 50 peg leg
{6098, 50},	-- 50 Eye Patchs
{"exp", 15000000},
	},
},

{name = "Lizard High Guard", color = 40, total = 2000, type = "once", storage = 190076, storagecount = 190077, 
rewards = {   
{5881, 90},	-- 90 Lizard Scale
{"exp", 25000000},
	},
},

{name = "Lizard Dragon Priest", color = 40, total = 1000, type = "once", storage = 190076, storagecount = 190077, 
rewards = {   
{5876, 100},	-- 100 Lizard Leather
{"exp", 25000000},
	},
},

{name = "Lizard Legionnaire", color = 40, total = 1000, type = "once", storage = 190076, storagecount = 190077, 
rewards = {   
{5876, 50},	-- 50 Lizard Leather
{"exp", 25000000},
	},
},

{name = "Draken Spellweaver", color = 40, total = 2000, type = "once", storage = 190078, storagecount = 190079, 
rewards = {   
{11701, 1},--1 Old Cape
{"exp", 35000000},
	},
},

{name = "Draken Warmaster", color = 40, total = 2000, type = "once", storage = 190080, storagecount = 190081, 
rewards = {   
{11700, 1},	-- 1 Sedge Hat
{"exp", 35000000},
	},
},

{name = "Vampire Viscount ", color = 40, total = 1500, type = "once", storage = 190082, storagecount = 190083, 
rewards = {   
{5894, 70},	--70 bat wing
{"exp", 15000000},
	},
},

{name = "Vampire Bridge", color = 40, total = 1500, type = "once", storage = 190084, storagecount = 190085, 
rewards = {   
{5905, 50},	--50 vamp dust
{"exp", 15000000},
	},
},

{name = "Sibang", color = 40, total = 2500, type = "once", storage = 190086, storagecount = 190087, 
rewards = {   
{5883, 100},	-- 100 ape fur
{3348, 2},	-- 2 banana staf
{"exp", 15000000},
	},
},

{name = "Rhindeer", color = 40, total = 1500, type = "once", storage = 190088, storagecount = 190089, 
rewards = {   
{5883, 100},	-- 100 ape fur
{3348, 3},	-- 3 banana staff
{"exp", 35000000},
	},
},

{name = "Werebadger", color = 40, total = 1000, type = "once", storage = 190090, storagecount = 190091, 
rewards = {   
{5896, 50},	-- 50 bear paw
{"exp", 15000000},
	},
},

{name = "Wereboar", color = 40, total = 1000, type = "once", storage = 190092, storagecount = 190093, 
rewards = {   
{5897, 50},	-- 50 wolf paw
{"exp", 15000000},
	},
},

{name = "Cave Spider", color = 40, total = 1000, type = "once", storage = 190094, storagecount = 190095, 
rewards = {   
{5879, 100},	-- 100 spider silk
{"exp", 15000000},
	},
},


{name = "Giant Spider", color = 40, total = 1500, type = "once", storage = 190094, storagecount = 190095, 
rewards = {   
{5879, 100},	-- 100 spider silk
{"exp", 15000000},
	},
},

{name = "Barbarian Bloodwalker", color = 40, total = 2000, type = "once", storage = 190096, storagecount = 190097, 
rewards = {
{5911, 100},	--100 red piece of cloth
{"exp", 15000000},
	},
},

{name = "Crazed Winter Rearguard", color = 40, total = 5000, type = "once", storage = 190098, storagecount = 190099, 
rewards = {
{7290, 15},	-- 15 shard
{"exp", 55000000},
	},
},

{name = "Smuggler", color = 40, total = 500, type = "once", storage = 190100, storagecount = 190101, 
rewards = {
{5909, 50},	-- 50 White Piece of Cloth
{"exp", 15000000},
	},
},

{name = "Naga Warrior", color = 40, total = 2000, type = "once", storage = 190102, storagecount = 190103, 
rewards = {
{5914, 50},	-- 50 Yellow Piece of Cloth
{"exp", 35000000},
	},
},

{name = "Bashmu", color = 40, total = 1500, type = "once", storage = 190104, storagecount = 190105, 
rewards = {
{5890, 100},	-- 100 Chicken Feather
{"exp", 45000000},
	},
},

{name = "Crape Man", color = 40, total = 3000, type = "once", storage = 190106, storagecount = 190107, 
rewards = {
{3002, 5},	-- 5 Voodoo Doll
{"exp", 110000000},
	},
},

{name = "Dark Torturer", color = 40, total = 5000, type = "once", storage = 190108, storagecount = 190109, 
rewards = {
{5906, 100},	-- 100 Demon Dust
{"exp", 150000000},
	},
},

{name = "Spiky Carnivor", color = 40, total = 3000, type = "once", storage = 190110, storagecount = 190111, 
rewards = {
{5893, 150},	-- 150 Perfect Behemoth Fang
{"exp", 35000000},
	},
},

{name = "Crawler", color = 40, total = 1000, type = "once", storage = 190112, storagecount = 190113, 
rewards = {
{5902, 50},	-- 50 honey comb
{"exp", 15000000},
	},
},

{name = "Ripper Spectre", color = 40, total = 2000, type = "once", storage = 190114, storagecount = 190115, 
rewards = {
{6499, 1000},	-- 1000 demonic essence
{"exp", 50000000},
	},
},

{name = "Gazer Spectre", color = 40, total = 2000, type = "once", storage = 190116, storagecount = 190117, 
rewards = {
{6499, 1000},	-- 1000 demonic essence
{"exp", 50000000},
	},
},

{name = "Burster Spectre", color = 40, total = 2000, type = "once", storage = 190118, storagecount = 190119, 
rewards = {
{6499, 1000},	-- 1000 demonic essence
{"exp", 50000000},
	},
},



-- BOSSES ------------------------
-- BOSSES ------------------------
-- BOSSES ------------------------
-- BOSSES ------------------------
-- BOSSES ------------------------
-- BOSSES ------------------------
-- BOSSES ------------------------
{name = "LLoyd", color = 40, total = 10, type = "once", storage = 190120, storagecount = 190121, 
rewards = {
{24393, 1},	-- pillow backpack
{22724, 10}, -- item forge
{"exp", 15000000},
	},
},


{name = "The Enraged Thorn Knight", color = 40, total = 10, type = "repeatable", storage = 190122, storagecount = 190123, 
rewards = {
{24966, 1},	-- forbidden fruit
{22724, 10}, -- item forge
{"exp", 150000000},
	},
},

{name = "Shulgrax", color = 40, total = 15, type = "once", storage = 190124, storagecount = 190125, 
rewards = {
{22756, 1},	-- treader of torment
{22724, 5}, -- item forge
{"exp", 150000000},
	},
},

{name = "Ragiaz", color = 40, total = 15, type = "once", storage = 190126, storagecount = 190127, 
rewards = {
{22758, 1},	-- death gaze
{22724, 5}, -- item forge
{"exp", 150000000},
	},
},

{name = "Razzagorn", color = 40, total = 15, type = "once", storage = 190128, storagecount = 190129, 
rewards = {
{22754, 1},	-- visage of the end days
{22724, 5}, -- item forge
{"exp", 150000000},
	},
},

{name = "Mazoran", color = 40, total = 15, type = "once", storage = 190130, storagecount = 190131, 
rewards = {
{22760, 1},	-- impaler of the igniter
{22724, 5}, -- item forge
{"exp", 150000000},
	},
},

{name = "Ratmiral Blackwhiskers", color = 40, total = 10, type = "repeatable", storage = 190132, storagecount = 190133, 
rewards = {
{44106, 50},	-- Primos Seller Token
{22724, 5}, -- item forge
{"exp", 150000000},
	},
},


{name = "The Scourge Of Oblivion", color = 40, total = 10, type = "repeatable", storage = 190134, storagecount = 190135, 
rewards = {
{44106, 50},	-- Primos Seller Token
{22724, 5}, -- item forge
{"exp", 150000000},
	},
},

{name = "The Nightmare Beast", color = 40, total = 10, type = "repeatable", storage = 190136, storagecount = 190137, 
rewards = {
{44106, 50},	-- Primos Seller Token
{"exp", 150000000},
	},
},

{name = "Eradicator", color = 40, total = 10, type = "repeatable", storage = 190138, storagecount = 190139, 
rewards = {
{44106, 50},	-- Primos Seller Token
{22724, 5}, -- item forge
{"exp", 150000000},
	},
},

{name = "The Unarmored Voidborn", color = 40, total = 10, type = "repeatable", storage = 190140, storagecount = 190141, 
rewards = {
{44106, 20},	-- Primos Seller Token
{"exp", 150000000},
	},
},

{name = "The False God", color = 40, total = 30, type = "repeatable", storage = 190142, storagecount = 190143, 
rewards = {
{44106, 20},	-- Primos Seller Token
{22724, 5}, -- item forge
{"exp", 150000000},
	},
},

{name = "Outburst", color = 40, total = 10, type = "repeatable", storage = 190144, storagecount = 190145, 
rewards = {
{44106, 50},	-- Primos Seller Token
{22724, 5}, -- item forge
{"exp", 150000000},
	},
},

{name = "Grand Master Oberon", color = 40, total = 30, type = "once", storage = 190146, storagecount = 190147, 
rewards = {
{44106, 100},	-- Primos Seller Token
{"exp", 150000000},
	},
},

{name = "Drume", color = 40, total = 30, type = "once", storage = 190148, storagecount = 190149, 
rewards = {
{44106, 50},	-- Primos Seller Token
{"exp", 150000000},
	},
},


{name = "Ancient Spawn Of Morgathla", color = 40, total = 100, type = "once", storage = 190150, storagecount = 190151, 
rewards = {
{3553, 1},	-- Bunnyslippers
{22724, 30}, -- item forge
{"exp", 150000000},
	},
},

{name = "Eradicator", color = 40, total = 30, type = "once", storage = 190152, storagecount = 190153, 
rewards = {
{19391, 1},	-- Furious Frock
{22724, 15}, -- item forge
{"exp", 150000000},
	},
},

{name = "Timira The Many-Headed", color = 40, total = 30, type = "once", storage = 190154, storagecount = 190155, 
rewards = {
{8191, 1},	-- Vampire Doll
{"exp", 150000000},
	},
},


}

squareWaitTime = 5000
taskQuestLog = 65000 -- A storage so you get the quest log
dailyTaskWaitTime = 20 * 60 * 60 

function Player.getCustomActiveTasksName(self)
local player = self
	if not player then
		return false
	end
local tasks = {}
	for i, data in pairs(taskConfiguration) do
		if player:getStorageValue(data.storagecount) ~= -1 then
		tasks[#tasks + 1] = data.name
		end
	end
	return #tasks > 0 and tasks or false
end


function getTaskByStorage(storage)
	for i, data in pairs(taskConfiguration) do
		if data.storage == tonumber(storage) then
			return data
		end
	end
	return false
end

function getTaskByMonsterName(name)
	for i, data in pairs(taskConfiguration) do
		if data.name:lower() == name:lower() then
			return data
		end
	end
	return false
end

function Player.startTask(self, storage)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	if player:getStorageValue(taskQuestLog) == -1 then
		player:setStorageValue(taskQuestLog, 1)
	end
	player:setStorageValue(storage, player:getStorageValue(storage) + 1)
	player:setStorageValue(data.storagecount, 0)
	return true
end

function Player.canStartCustomTask(self, storage)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	if data.type == "daily" then
		return os.time() >= player:getStorageValue(storage)
	elseif data.type == "once" then
		return player:getStorageValue(storage) == -1
	elseif data.type[1] == "repeatable" and data.type[2] ~= -1 then
		return player:getStorageValue(storage) < (data.type[2] - 1)
	else
		return true
	end
end

function Player.endTask(self, storage, prematurely)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
end
	if prematurely then
		if data.type == "daily" then
			player:setStorageValue(storage, -1)
		else
			player:setStorageValue(storage, player:getStorageValue(storage) - 1)
	end
	else
		if data.type == "daily" then
			player:setStorageValue(storage, os.time() + dailyTaskWaitTime)
		end
	end
	player:setStorageValue(data.storagecount, -1)
	return true
end

function Player.hasStartedTask(self, storage)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	return player:getStorageValue(data.storagecount) ~= -1
end


function Player.getTaskKills(self, storage)
local player = self
	if not player then
		return false
	end
	return player:getStorageValue(storage)
end

function Player.addTaskKill(self, storage, count)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	local kills = player:getTaskKills(data.storagecount)
	if kills >= data.total then
		return false
	end
	if kills + count >= data.total then
		if taskOptions.selectLanguage == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, task_pt_br.messageCompleteTask)
		else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Task System] You have finished this task! To claim your rewards, return to the quest board and claim your reward.")
		end
		return player:setStorageValue(data.storagecount, data.total)
	end
		player:say('Task: '..data.name ..' - ['.. kills + count .. '/'.. data.total ..']', TALKTYPE_MONSTER_SAY)
		return player:setStorageValue(data.storagecount, kills + count)
end