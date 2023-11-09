local forgeBag = Action()

function forgeBag.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:openForge()
	return true
end

forgeBag:id(44111)
forgeBag:register()
