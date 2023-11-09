local config = {
	boss = {
		name = "Aldebaran",
		position = Position(32359, 33177, 7)
	},
	requiredLevel = 8,
	playerPositions = {
		{pos = Position(32451, 33228, 7), teleport = Position(32357, 33175, 7), effect = CONST_ME_TELEPORT},
		{pos = Position(32451, 33229, 7), teleport = Position(32362, 33175, 7), effect = CONST_ME_TELEPORT},
		{pos = Position(32451, 33230, 7), teleport = Position(32359, 33180, 7), effect = CONST_ME_TELEPORT},
		{pos = Position(32451, 33231, 7), teleport = Position(32364, 33179, 7), effect = CONST_ME_TELEPORT},
		{pos = Position(32451, 33232, 7), teleport = Position(32355, 33177, 7), effect = CONST_ME_TELEPORT}
	},
	specPos = {
		from = Position(32352, 33172, 7),
		to = Position(32366, 33182, 7)
	},
	exit = Position(33659, 32897, 14),
	storage = Storage.Quest.U12_90.PrimalOrdeal.Bosses.AldebaranTimer,
}

local lever = BossLever(config)
lever:position({x = 32451, y = 33227, z = 7})
lever:register()
