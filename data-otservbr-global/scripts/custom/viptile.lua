local positions = {
    {position = {x = 32361, y = 32219, z = 7}, destination = {x = 32537, y = 30935, z = 7}}, --PRIMEIRA COORDENADA DO TP/ SEGUNDA COORDENADA PARA ONDE VAI LEVAR
    {position = {x = 32373, y = 32236, z = 7}, destination = {x = 32537, y = 30935, z = 7}}, --PRIMEIRA COORDENADA DO TP/ SEGUNDA COORDENADA PARA ONDE VAI LEVAR
}

local VipAccess = MoveEvent()
function VipAccess.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end
    if not player:isVip() then
        player:teleportTo(fromPosition, true)
        player:sendTextMessage(MESSAGE_INFO_DESCR, 'Voce deve ser VIP!')
        fromPosition:sendMagicEffect(CONST_ME_POFF)
      return true
    end
    for index, value in pairs(positions) do
        if Tile(position) == Tile(value.position) then
            player:teleportTo(value.destination)
            player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
        end
    end
    return true
end
for index, value in pairs(positions) do
    VipAccess:position(value.position)
end

VipAccess:register()