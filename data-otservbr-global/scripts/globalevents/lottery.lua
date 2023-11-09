local lottery = GlobalEvent("lottery")

local config = {
    interval = "1 Hora",
    rewards = {[28484] = 1, [9079] = 1, [9086] = 1, [9596] = 1, [37536] = 1, [28495] = 1, [36726] = 1, [36724] = 1, [36723] = 1, [36737] = 1, [36727] = 1, [36728] = 1}, -- Random Reward
    website = true
}

function lottery.onThink(interval)
    local players = {}
    for _, player in ipairs(Game.getPlayers()) do
        if not player:getGroup():getAccess() then
            table.insert(players, player)
        end
    end

    local c = #players
    if c <= 0 then
        return true
    end

    local winner  = players[math.random(#players)]

    local items = {}
    for itemid, count in pairs(config.rewards) do
        items[#items + 1] = itemid
    end

    local itemid = items[math.random(1, #items)]
    local amount = config.rewards[itemid]
    winner:addItem(itemid, amount)

    local it   = ItemType(itemid)
    local name = ""
    if amount == 1 then
        name = it:getArticle() .. " " .. it:getName()
    else
        name = amount .. " " .. it:getPluralName()
    end

    broadcastMessage("[LOTTERY SYSTEM] " .. winner:getName() .. " won " .. name .. "! Congratulations! (Next lottery in " .. config.interval .. ")")

    return true
end

lottery:interval(3200000) --- 1 minute
lottery:register()
