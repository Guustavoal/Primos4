local bossreset = Action()
function bossreset.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	player:setStorageValue(Storage.FerumbrasAscension.FerumbrasTimer, os.time() + 10) --last ferumbras
	player:setStorageValue(14333, os.time() + 10) -- last gt
	player:setStorageValue(Storage.ForgottenKnowledge.LastLoreTimer, os.time() + 10) -- last lore keeper
	player:setStorageValue(Storage.Quest.U12_90.PrimalOrdeal.Bosses.MagmaBubbleTimer, os.time() + 10) -- magma bubble
	player:setStorageValue(Storage.Quest.U12_90.PrimalOrdeal.Bosses.ThePrimalMenaceTimer, os.time() + 10) -- primal




	return true
end

bossreset:id(9389)
bossreset:register()
