local config = {
	boss = {
		name = "Camus",
		position = Position(32400, 33178, 7),
	},
	requiredLevel = 8,

	playerPositions = {
		{ pos = Position(32502, 33229, 7), teleport = Position(32397, 33176, 7), effect = CONST_ME_TELEPORT },
        { pos = Position(32502, 33230, 7), teleport = Position(32402, 33176, 7), effect = CONST_ME_TELEPORT },
        { pos = Position(32502, 33231, 7), teleport = Position(32400, 33180, 7), effect = CONST_ME_TELEPORT },
        { pos = Position(32502, 33232, 7), teleport = Position(32397, 33180, 7), effect = CONST_ME_TELEPORT },
        { pos = Position(32502, 33233, 7), teleport = Position(32399, 33181, 7), effect = CONST_ME_TELEPORT }
    },
	specPos = {
		from = Position(32393, 33173, 7),
        to = Position(32407, 33183, 7)
	},
	exit = Position(33659, 32897, 14),
    storage = Storage.Quest.U12_90.PrimalOrdeal.Bosses.CamusTimer,
}

local lever = BossLever(config)
lever:position({x = 32502, y = 33228, z = 7})
lever:register()