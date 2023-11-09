local config = {
    pos = Position(32350, 32224, 7),
    topos = Position(33763, 32220, 7),
    creatureName = "Primos boss", -- Nome da criatura a ser invocada
    _time = 10, -- tempo que o teleport irá sumir em minutos
    msg_open = "O Portal esta aberto e vai fechar em 10 minutos.",
    msg_close = "O Portal se fechou.",
    portal_id = 1949,
}

local function doRemoveTeleportEvent()
    local tile = Tile(config.pos)
    if tile then
        local portal = tile:getItemById(config.portal_id)
        if portal then
            portal:remove()
        end
    end
    Game.broadcastMessage(config.msg_close, MESSAGE_EVENT_ADVANCE)
    
    -- Aqui, invocamos a criatura após o portal se fechar
    local creature = Game.createMonster(config.creatureName, config.topos)
    if creature then
        creature:registerEvent("creatureDeath") -- Registra um evento de morte para a criatura, se necessário
    end
end

local function doCreateTeleportEvent()
    local tile = Tile(config.pos)
    if tile then
        local portal
        if tile:getItemById(config.portal_id) then
            portal = tile:getItemById(config.portal_id)
        else
            portal = Game.createItem(config.portal_id, 1, config.pos)
        end
        if portal then
            portal:setDestination(config.topos)
            addEvent(doRemoveTeleportEvent, config._time * 60 * 1000)
        end
    end
end

local event_tp_daily = GlobalEvent("event_tp_daily")
function event_tp_daily.onTime(interval)
    doCreateTeleportEvent()
    Game.broadcastMessage(config.msg_open, MESSAGE_EVENT_ADVANCE) 
    return true
end
event_tp_daily:time("20:30:00")
event_tp_daily:register()

-- Adiciona a contagem regressiva a cada minuto
local countdownMinutes = config._time
local countdownInterval = 60 * 1000 -- 1 minuto em milissegundos

local function doCountdown()
    if countdownMinutes > 0 then
        Game.broadcastMessage("O Portal fechara em " .. countdownMinutes .. " minutos.", MESSAGE_EVENT_ADVANCE)
        countdownMinutes = countdownMinutes - 1
        addEvent(doCountdown, countdownInterval)
    end
end

-- Inicia a contagem regressiva
addEvent(doCountdown, countdownInterval)
