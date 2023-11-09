-- Instalacao automatica de tabelas se ainda nao as tivermos (primeira instalacao)
db.query([[
	CREATE TABLE IF NOT EXISTS `roleta_plays` (
		`id` int unsigned NOT NULL AUTO_INCREMENT,
		`player_id` int NOT NULL,
		`uuid` varchar(255) NOT NULL,
		`recompensa_id` smallint unsigned NOT NULL,
		`recompensa_quantidade` smallint unsigned NOT NULL,
		`status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0 = rolling | 1 = pending | 2 = delivered',
		`created_at` bigint unsigned NOT NULL,
		`updated_at` bigint unsigned NOT NULL,
		PRIMARY KEY (`id`),
		UNIQUE KEY (`uuid`),
		CONSTRAINT `roleta_plays_players_fk`
		FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
	) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;
]])

-- #######################################################################################################

local roletasConfig = {
	[18562] = {
		itemNecessario = {id = 44065, quantidade = 1},
		pisosPorRoleta = 9,
		posicaoDoCentro = Position(1118, 1041, 0),
		items = {
			{id = 16112, quantidade = 1, chance = 0.2, raro = true},
			{id = 16111, quantidade = 1, chance = 0.3, raro = true},
			{id = 9596, quantidade = 1, chance = 0.5, raro = true},
			{id = 16110, quantidade = 1, chance = 9, raro = true},
			{id = 20087, quantidade = 1, chance = 9, raro = true},
			{id = 20090, quantidade = 1, chance = 9, raro = true},
			{id = 44066, quantidade = 1, chance = 5, raro = true},
			{id = 39163, quantidade = 1, chance = 9, raro = true},
			{id = 5903, quantidade = 1, chance = 0.5, raro = true},
			{id = 20069, quantidade = 1, chance = 9, raro = true},
			{id = 39162, quantidade = 1, chance = 9, raro = true},
			{id = 6579, quantidade = 1, chance = 9, raro = true},
			{id = 20075, quantidade = 1, chance = 9, raro = true},
			{id = 44068, quantidade = 1, chance = 5, raro = true},
			{id = 44067, quantidade = 1, chance = 5, raro = true},
			{id = 8778, quantidade = 1, chance = 9, raro = true},
			{id = 3555, quantidade = 1, chance = 9, raro = true},
			{id = 31633, quantidade = 1, chance = 9, raro = true},
			{id = 39546, quantidade = 1, chance = 9, raro = true},
			{id = 20072, quantidade = 1, chance = 9, raro = true},
			{id = 39156, quantidade = 1, chance = 9, raro = true},
			{id = 39157, quantidade = 1, chance = 9, raro = true},
			{id = 28495, quantidade = 1, chance = 9, raro = true},
			{id = 44065, quantidade = 1, chance = 9, raro = true},
			{id = 44096, quantidade = 1, chance = 9, raro = true},
			{id = 44095, quantidade = 1, chance = 9, raro = true},
			{id = 34109, quantidade = 1, chance = 9, raro = true},
			{id = 44069, quantidade = 1, chance = 5, raro = true},
			{id = 44070, quantidade = 1, chance = 5, raro = true},
			{id = 39155, quantidade = 1, chance = 9, raro = true},
			{id = 39159, quantidade = 1, chance = 9, raro = true},
			{id = 3399, quantidade = 1, chance = 9, raro = true},
			{id = 31578, quantidade = 1, chance = 9, raro = true},
			{id = 43895, quantidade = 1, chance = 9, raro = true},
			{id = 29424, quantidade = 1, chance = 9, raro = true},
			{id = 31583, quantidade = 1, chance = 9, raro = true},
			{id = 30362, quantidade = 1, chance = 9, raro = true},
			{id = 29428, quantidade = 1, chance = 9, raro = true},
			{id = 30401, quantidade = 1, chance = 9, raro = true},
			{id = 39693, quantidade = 1, chance = 9, raro = true},
			{id = 39161, quantidade = 1, chance = 9, raro = true},
			{id = 28915, quantidade = 1, chance = 9, raro = true},
			{id = 36672, quantidade = 1, chance = 9, raro = true},
			{id = 39160, quantidade = 1, chance = 9, raro = true},
			{id = 31577, quantidade = 1, chance = 9, raro = true},
			{id = 30398, quantidade = 1, chance = 9, raro = true},
			{id = 30397, quantidade = 1, chance = 9, raro = true},
			{id = 30400, quantidade = 1, chance = 9, raro = true},
			{id = 30399, quantidade = 1, chance = 9, raro = true},
			{id = 30396, quantidade = 1, chance = 9, raro = true},
			{id = 30395, quantidade = 1, chance = 9, raro = true},
			{id = 22062, quantidade = 1, chance = 9, raro = true},
			{id = 32617, quantidade = 1, chance = 9, raro = true},
			{id = 32618, quantidade = 1, chance = 9, raro = true},
			{id = 30366, quantidade = 1, chance = 9, raro = true},
			{id = 31579, quantidade = 1, chance = 9, raro = true},
			{id = 29427, quantidade = 1, chance = 9, raro = true},
			{id = 22755, quantidade = 1, chance = 9, raro = true},
			{id = 36666, quantidade = 1, chance = 9, raro = true},
			{id = 37536, quantidade = 1, chance = 9, raro = true}
					
		}
	}

	--[[
	[17322] = {
		itemNecessario = {id = 8978, quantidade = 1},
		pisosPorRoleta = 11,
		posicaoDoCentro = Position(875, 928, 7),
		items = ...
	},
	]]--
}

-- #######################################################################################################

local Constantes = {
	roleta_DUMMY_NAME = "Roleta Dummy",

	PLAY_STATUS_ROLLING = 0,
	PLAY_STATUS_PENDING = 1,
	PLAY_STATUS_DELIVERED = 2,
}

-- #######################################################################################################

local random = math.random
local function generate_uuid()
    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return string.gsub(template, '[xy]', function (c)
        local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
        return string.format('%x', v)
    end)
end

local function inserirRecompensaDaRoletaNoBancoDeDados(uuid, playerId, recompensa)
	local tempoAgora = os.time()
	db.query("INSERT INTO `roleta_plays` (`player_id`, `uuid`, `recompensa_id`, `recompensa_quantidade`, `created_at`, `updated_at`) VALUES (" .. 
	playerId .. ", " .. db.escapeString(uuid) .. ", " .. recompensa.id .. ", " .. recompensa.quantidade .. ", " .. tempoAgora .. ", " .. tempoAgora .. ");")
end

local function atualizarStatusDaEntregaDaRecompensaDaRoletaNoBancoDeDados(uuid, status)
	db.query("UPDATE `roleta_plays` SET `status` = " .. status .. ", `updated_at` = " .. os.time() .. " WHERE `uuid` = " .. db.escapeString(uuid) .. ";")
end

local function retornarDadosDaRecompensaDaRoletaNoBancoDeDados(uuid)
	local retornoDaConsulta = db.storeQuery("SELECT `player_id`, `recompensa_id`, `recompensa_quantidade` FROM `roleta_plays` WHERE `uuid` = " .. db.escapeString(uuid) .. ";")
	if retornoDaConsulta then
		local guild = Result.getNumber(retornoDaConsulta, 'player_id')
		local recompensaId = Result.getNumber(retornoDaConsulta, 'recompensa_id')
		local recompensaQuantidade = Result.getNumber(retornoDaConsulta, 'recompensa_quantidade')
		Result.free(retornoDaConsulta)

		return {
			playerGuid = guild,
			uuid = uuid,
			id = recompensaId,
			quantidade = recompensaQuantidade
		}
	end
end

local function retornarDadosDaRecompensaDaRoletaNoBancoDeDadosDeJogadoresComStatusDePendencia(playerGuid)
	local recompensas = {}

	local retornoDaConsulta = db.storeQuery("SELECT `uuid`, `recompensa_id`, `recompensa_quantidade` FROM `roleta_plays` WHERE `player_id` = " .. playerGuid .. " AND `status` = 1;")
	if retornoDaConsulta then
		repeat
			local uuid = Result.getString(retornoDaConsulta, 'uuid')
			local recompensaId = Result.getNumber(retornoDaConsulta, 'recompensa_id')
			local recompensaQuantidade = Result.getNumber(retornoDaConsulta, 'recompensa_quantidade')

			recompensas[#recompensas + 1] = {
				uuid = uuid,
				id = recompensaId,
				quantidade = recompensaQuantidade
			}
		until not Result.next(retornoDaConsulta)
		Result.free(retornoDaConsulta)
	end

	return recompensas
end

local function atualizarJogadoresComRoletaEmUsoNoBancoDeDados()
	db.query("UPDATE `roleta_plays` SET `status` = 1 WHERE `status` = 0;")
end

-- #######################################################################################################

local function entregarRecompensaDaRoleta(player, recompensa)
	local item = Game.createItem(recompensa.id, recompensa.quantidade)
	if not item then
		return false
	end

	if player:addItemEx(item) ~= RETURNVALUE_NOERROR then
		player:sendTextMessage(MESSAGE_FAILURE, "The item could not be delivered. Check if your backpack has space and relogin.")
		atualizarStatusDaEntregaDaRecompensaDaRoletaNoBancoDeDados(recompensa.uuid, Constantes.PLAY_STATUS_PENDING)
		return false
	end

	atualizarStatusDaEntregaDaRecompensaDaRoletaNoBancoDeDados(recompensa.uuid, Constantes.PLAY_STATUS_DELIVERED)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Congratulations, you received %dx %s.",
		recompensa.quantidade,
		ItemType(recompensa.id):getName()
	))

	return true
end

-- #######################################################################################################

local MAX_DROPSET_RATE = 10000

local function gerarPosicoesDaRoleta(actionId)
	local roleta = roletasConfig[actionId]
	if not roleta then
		return
	end

	local posDoCentro = roleta.posicaoDoCentro
	roleta.posicoes = {}

	local half = math.floor(roleta.pisosPorRoleta / 2)
	roleta.startPosition = Position(posDoCentro.x - half, posDoCentro.y, posDoCentro.z)
	roleta.endPosition = Position(posDoCentro.x + half, posDoCentro.y, posDoCentro.z)

	for i = 0, roleta.pisosPorRoleta - 1 do
		local pos = roleta.startPosition + Position(i, 0, 0)
		local tile = Tile(pos)
		if tile then
			roleta.posicoes[#roleta.posicoes + 1] = pos
		end
	end
end

local function limparManequinsDaRoleta(posicoesDaRoleta)
	for _, posicao in ipairs(posicoesDaRoleta) do
		local tile = Tile(posicao)
		if tile then
			local manequim = tile:getTopCreature()
			if manequim then
				posicao:sendMagicEffect(CONST_ME_POFF)
				manequim:remove()
			end
		end
	end
end

local function slotRegistrarChanceItem(roleta, item)
	local rate = item.chance

	if rate < 0.01 or rate > 100 then
		print("Item with id %d cannot be less than 0.01% or greater than 100%.")
		return false
	end

	for i = 1, (rate / 100) * MAX_DROPSET_RATE do
		roleta.itemChances[#roleta.itemChances + 1] = item
	end
end

local function slotCarregarChances(actionId)
	local roleta = roletasConfig[actionId]
	if not roleta then
		return
	end

	roleta.itemChances = {}

	for _, item in pairs(roleta.items) do
		slotRegistrarChanceItem(roleta, item)
	end

	local itemChancesTotalTabela = #roleta.itemChances
	if itemChancesTotalTabela ~= MAX_DROPSET_RATE then
		print(string.format("%d is not precise drop, result: %s%%", actionId, (itemChancesTotalTabela / MAX_DROPSET_RATE) * 100))
	end
end

local function SlotConstruirAnimacaoItems(roleta, recompensaId)
	local list = {}

	local metadeDosTiles = math.floor(roleta.pisosPorRoleta / 2)
	local itemsQuantidade = 42

	for i = 1, itemsQuantidade do
		local itemId = roleta.itemChances[math.random(#roleta.itemChances)].id
		if i == (itemsQuantidade - metadeDosTiles) then
			itemId = recompensaId
		end

		list[#list + 1] = itemId
	end

	return list
end

local function preparacaoDaEntregaDaRecompensaDaRoleta(uuid)
	local recompensa = retornarDadosDaRecompensaDaRoletaNoBancoDeDados(uuid)
	if not recompensa then
		return false
	end

	local player = Player(recompensa.playerGuid)
	if not player then
		atualizarStatusDaEntregaDaRecompensaDaRoletaNoBancoDeDados(recompensa.uuid, Constantes.PLAY_STATUS_PENDING)
		return false
	end

	entregarRecompensaDaRoleta(player, recompensa)
end

-- #######################################################################################################

local mType = Game.createMonsterType(Constantes.roleta_DUMMY_NAME)
local monster = {}

monster.description = ''
monster.experience = 0
monster.outfit = {lookTypeEx = 1551}

monster.health = 100
monster.maxHealth = 100
monster.race = 'undead'
monster.speed = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0
}

monster.flags = {
	summonable = false,
	attackable = false,
	hostile = true,
	convinceable = false,
	pushable = false,
	recompensaBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 20,
	healthHidden = true,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.immunities = {
	{type = 'physical', condition = true},
	{type = 'energy', condition = true},
	{type = 'fire', condition = true},
	{type = 'earth', condition = true},
	{type = 'ice', condition = true},
	{type = 'holy', condition = true},
	{type = 'death', condition = true},
	{type = 'paralyze', condition = true},
	{type = 'drunk', condition = true},
	{type = 'outfit', condition = true},
	{type = 'invisible', condition = true}
}

mType:register(monster)

-- #######################################################################################################

local function animacaoDoMovimentoDoManaquimDaRoleta(roleta, velocidade)
	local posicao = Position(roleta.startPosition)
	for i = 1, roleta.pisosPorRoleta do
		local piso = Tile(posicao)
		if piso then
			local manequim = piso:getTopCreature()
			if manequim then
				if posicao.x == roleta.startPosition.x then
					manequim:remove()
				else
					manequim:setSpeed(velocidade)
					manequim:move(DIRECTION_WEST)
				end
			end
			posicao.x = posicao.x + 1
		end
	end
end

local function animacaoAoCriarUmManequim(roleta, velocidadePadrao, lookTypeEx)
	local manequim = Game.createMonster(Constantes.roleta_DUMMY_NAME, roleta.endPosition, false, true)
	if manequim then
		manequim:setSpeed(velocidadePadrao) -- setBaseSpeed
		manequim:setOutfit{lookTypeEx = lookTypeEx}
	end
	return manequim
end

local function animacaoDeJogarJogosDeArtificioNaRoleta(roleta)
	local quantidade = 0

	local function decrease()
		if roleta.emUso then
			return
		end

		local time = 20 - quantidade
		if time > 0 then
			quantidade = quantidade + 1
			for _, posicao in ipairs(roleta.posicoes) do
				posicao:sendMagicEffect(CONST_ME_PIXIE_EXPLOSION)
			end
			addEvent(decrease, 850)
		end
	end

	decrease()
end

local function AnimationDrawRecompensaHighlight(positionsTable, recompensaId)
	for _, posicao in ipairs(positionsTable) do
		local piso = Tile(posicao)
		if piso then
			local manequim = piso:getTopCreature()
			if manequim then
				manequim:setOutfit{lookTypeEx = recompensaId}
				manequim:getPosition():sendMagicEffect(CONST_ME_HEARTS)
				manequim:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
			end
		end
	end
end

local function AnimationStart(args)
	local speeds = {}
	local events = {}

	local initEvent = 12
	local initSpeed = 7000
	local formula = 1.1

	for i = 42, 1, -1 do
		initEvent = initEvent * formula
		initSpeed = initSpeed / formula

		events[#events + 1] = initEvent
		speeds[#speeds + 1] = initSpeed
	end

	-- little fix on animation middle
	for i, speed in ipairs(speeds) do
		if i > 13 and i < 28 then
			speeds[i] = speed * 1.65
		end
	end

	local roleta = args.roleta
	local recompensaId = args.recompensa.id
	local animationItems = SlotConstruirAnimacaoItems(roleta, recompensaId)
	local i = 1
	local function move()
		animacaoDoMovimentoDoManaquimDaRoleta(roleta, math.floor(speeds[i]))
		animacaoAoCriarUmManequim(roleta, math.floor(speeds[i]), animationItems[i])
		if i >= 42 then
			addEvent(function()
				roleta.startPosition:sendDistanceEffect(roleta.posicaoDoCentro, CONST_ANI_SMALLICE)
				roleta.endPosition:sendDistanceEffect(roleta.posicaoDoCentro, CONST_ANI_SMALLICE)
				roleta.posicaoDoCentro:sendMagicEffect(CONST_ME_PINK_VORTEX)

				addEvent(function()
					args.aoFinalizarJogada()
					if args.recompensa.raro then
						animacaoDeJogarJogosDeArtificioNaRoleta(roleta)
						AnimationDrawRecompensaHighlight(roleta.posicoes, recompensaId)
					end
				end, 500)
			end, 700)
		else
			addEvent(move, math.floor(events[i]))
		end

		i = i + 1
	end
	move()
end

-- #######################################################################################################

local function girarRoleta(player, roleta)
	if roleta.emUso then
		player:sendCancelMessage("Wait to spin.")
		return false
	end

	local recompensa = roleta.itemChances[math.random(#roleta.itemChances)]
	if not recompensa then
		player:sendTextMessage(MESSAGE_FAILURE, "Something is wrong, contact the administrator.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local itemNecessario = roleta.itemNecessario
	local itemNecessarioName = ItemType(itemNecessario.id):getName()

	if not player:removeItem(itemNecessario.id, itemNecessario.quantidade) then
		player:sendTextMessage(MESSAGE_FAILURE, string.format("You need %dx %s to spin.",
			itemNecessario.quantidade,
			itemNecessarioName
		))
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You need %dx %s to spin.",
			itemNecessario.quantidade,
			itemNecessarioName
		))
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	roleta.uuid = generate_uuid()
	inserirRecompensaDaRoletaNoBancoDeDados(roleta.uuid, player:getGuid(), recompensa)

	roleta.emUso = true
	limparManequinsDaRoleta(roleta.posicoes)

	local playerName = player:getName()
	local recompensaName = ItemType(recompensa.id):getName()

	local aoFinalizarJogada = function()
		preparacaoDaEntregaDaRecompensaDaRoleta(roleta.uuid)
		roleta.emUso = false

		if recompensa.raro then
			Game.broadcastMessage(string.format("[Roulette]: Player %s found %dx %s, amazing.",
				playerName,
				recompensa.quantidade,
				recompensaName
			), MESSAGE_EVENT_ADVANCE)
		end
	end

	AnimationStart({
		roleta = roleta,
		recompensa = recompensa,
		aoFinalizarJogada = aoFinalizarJogada
	})

	return true
end

local function roletaStartup()
	atualizarJogadoresComRoletaEmUsoNoBancoDeDados()

	for actionId, value in pairs(roletasConfig) do
		gerarPosicoesDaRoleta(actionId)
		slotCarregarChances(actionId)
	end
end

-- #######################################################################################################

local globalevent = GlobalEvent()

function globalevent.onStartup()
	roletaStartup()
end

globalevent:register()

-- #######################################################################################################

local action = Action()

function action.onUse(player, item)
	local roleta = roletasConfig[item.actionid]
	if not roleta then
		player:sendTextMessage(MESSAGE_FAILURE, "Slot not implemented yet.")
		item:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	girarRoleta(player, roleta)

	return true
end

for key in pairs(roletasConfig) do
	action:aid(key)
end

action:register()

-- #######################################################################################################

local creatureevent = CreatureEvent('Roleta_Login')

function creatureevent.onLogin(player)
	local pendingPlayrecompensas = retornarDadosDaRecompensaDaRoletaNoBancoDeDadosDeJogadoresComStatusDePendencia(player:getGuid())

	if #pendingPlayrecompensas > 0 then
		for _, recompensa in ipairs(pendingPlayrecompensas) do
			entregarRecompensaDaRoleta(player, recompensa)
		end
	end

	return true
end

creatureevent:register()

-- #######################################################################################################

--[[
local ec = EventCallback
ec.onLook = function(self, thing, position, distance, description)
	if thing:getName() == Constantes.roleta_DUMMY_NAME then
		local item = ItemType(thing:getOutfit().lookTypeEx)

		return ('You see %s.\n%s'):format(
			item:getName(),
			item:getDescription()
		)
	end
	return description
end
ec:register(1)
]]--
