local config = {
	boss = {
		name = "Milo",
		position = Position(32399, 33148, 7)
	},
	requiredLevel = 8,
	playerPositions = {
		{pos = Position(32480, 33228, 7), teleport = Position(32397, 33147, 7), effect = CONST_ME_TELEPORT},
		{pos = Position(32480, 33229, 7), teleport = Position(32403, 33147, 7), effect = CONST_ME_TELEPORT},
		{pos = Position(32480, 33230, 7), teleport = Position(32403, 33152, 7), effect = CONST_ME_TELEPORT},
		{pos = Position(32480, 33231, 7), teleport = Position(32399, 33148, 7), effect = CONST_ME_TELEPORT},
		{pos = Position(32480, 33232, 7), teleport = Position(32400, 33154, 7), effect = CONST_ME_TELEPORT}
	},
	specPos = {
		from = Position(32392, 33143, 7),
		to = Position(32406, 33153, 7)
	},
	exit = Position(33659, 32897, 14),
	storage = Storage.Quest.U12_90.PrimalOrdeal.Bosses.MiloTimer,
}

local lever = BossLever(config)
lever:position({x = 32480, y = 33227, z = 7})
lever:register()
