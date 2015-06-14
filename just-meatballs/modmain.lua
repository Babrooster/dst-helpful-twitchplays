
local require = GLOBAL.require

PrefabFiles = {
	"meatball",
}

GLOBAL.STRINGS.NAMES.MEATBALL= "Meatball"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.MEATBALL = "It's a ball of meat!"
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.MEATBALL = "What type of meat is this?"
--strings.CHARACTERS.TOVATH.DESCRIBE.MEATBALL = "Meat from the sky?"
--strings.CHARACTERS.FELICIA.DESCRIBE.MEATBALL = "Put it in my mouth!"
--strings.CHARACTERS.RYON.DESCRIBE.MEATBALL = "Who told you you could BALL with MEAT??"

function gamepostinit()
end
--add a post init to the game starting up
AddGamePostInit(gamepostinit)