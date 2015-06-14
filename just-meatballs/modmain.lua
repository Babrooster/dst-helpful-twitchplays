
local action = GLOBAL.Action
local handler = GLOBAL.ActionHandler
local strings = GLOBAL.STRINGS

PrefabFiles = {
	"meatball",
}

function gamepostinit()
end
--add a post init to the game starting up
AddGamePostInit(gamepostinit)