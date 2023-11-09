local config = {
    portals = {
        {
            pos = Position(32548, 33136, 7), -- Posição do primeiro portal - BOSS FIRE
            destination = Position(32626, 33261, 7), -- Destino do primeiro portal
        },
        {
            pos = Position(32526, 33136, 7), -- Posição do segundo portal - portal ice
            destination = Position(32774, 33307, 6), -- Destino do segundo portal
        },
        {
            pos = Position(32504, 33136, 7), -- Posição do terceiro portal - earth
            destination = Position(32866, 33237, 7), -- Destino do terceiro portal
        },
    },
    portalItemID = 19243, -- Identificador do item do portal
    portalResetHour = 22, -- Hora para recriar os portais (24 horas) após 24 horas
    portalResetMinute = 15, -- Minuto para recriar os portais após 24 horas
}

local function createPortal()
    local portalInfo = config.portals[math.random(1, #config.portals)]
    local tile = Tile(portalInfo.pos)
    if tile then
        local portal
        if tile:getItemById(config.portalItemID) then
            portal = tile:getItemById(config.portalItemID)
        else
            portal = Game.createItem(config.portalItemID, 1, portalInfo.pos)
        end
        if portal then
            portal:setDestination(portalInfo.destination)
        end
    end
end

local function schedulePortalReset()
    local currentTime = os.time()
    local resetTime = os.time({ year = os.date("%Y"), month = os.date("%m"), day = os.date("%d"), hour = config.portalResetHour, min = config.portalResetMinute, sec = 0 })

    if currentTime >= resetTime then
        resetTime = resetTime + 24 * 60 * 60 -- Agendar para o mesmo horário no dia seguinte
    end

    local delay = resetTime - currentTime
    addEvent(function()
        createPortal()
        schedulePortalReset()
    end, delay * 1000) -- Converte o atraso em milissegundos
end

-- Inicia o agendamento para criar o primeiro portal
createPortal()
-- Inicia o agendamento para recriar os portais diariamente
schedulePortalReset()
