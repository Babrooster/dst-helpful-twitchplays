
local require = GLOBAL.require

PrefabFiles = {
	"meatball",
}

GLOBAL.STRINGS.NAMES.MEATBALL= "Meatball"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.MEATBALL = "It's a ball of meat!"
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.MEATBALL = "What type of meat is this?"
--strings.CHARACTERS.TOVATH.DESCRIBE.MEATBALL = "Meat from the sky?"
GLOBAL.STRINGS.CHARACTERS.FELICIA.DESCRIBE.MEATBALL = "A meatball!? Put it in my mouth!"
GLOBAL.STRINGS.CHARACTERS.RYON.DESCRIBE.MEATBALL = "You want to know what it takes to not starve? It takes MEAT BALLS to not starve."

function gamepostinit()
end
--add a post init to the game starting up
AddGamePostInit(gamepostinit)