local action = GLOBAL.Action
local handler = GLOBAL.ActionHandler
local strings = GLOBAL.STRINGS

Assets =
{
    Asset("IMAGE", "images/icons/meatball_icon.tex"),
    Asset("ATLAS", "images/icons/meatball_icon.xml"),
}

PrefabFiles = {
	"meatball",
}

	-- people saying the things
	strings.NAMES.MEATBALL = "Meatball"
	strings.CHARACTERS.GENERIC.DESCRIBE.MEATBALL = "It's a ball of meat!"
	-- strings.CHARACTERS.WENDY.DESCRIBE.MEATBALL = "What type of meat is this?"
	strings.CHARACTERS.TOVATH.DESCRIBE.MEATBALL = "Meat from the sky?"
	strings.CHARACTERS.FELICIA.DESCRIBE.MEATBALL = "Put it in my mouth!"
	strings.CHARACTERS.RYON.DESCRIBE.MEATBALL = "Who told you you could BALL with MEAT??"


local function AddCommand(name)
	if GLOBAL.rawget( GLOBAL, "TwitchPlays" ) ~= nil then
		local command = GLOBAL.require("twitchplays/"..name)
		command.required_votes = GetModConfigData(name.."_votes", true)
		command.cooldown = GetModConfigData(name.."_cooldown", true)
		GLOBAL.TwitchPlays:AddCommand(command)
	end
end

AddCommand("meatstorm")