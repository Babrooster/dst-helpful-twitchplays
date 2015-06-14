
local action = GLOBAL.Action
local handler = GLOBAL.ActionHandler
local strings = GLOBAL.STRINGS

PrefabFiles = {
	"meatball",
}

Assets =
{
    Asset("IMAGE", "images/icons/meatball_icon.tex"),
    Asset("ATLAS", "images/icons/meatball_icon.xml"),
}

function gamepostinit()
end

local function AddCommand(name)
	if GLOBAL.rawget( GLOBAL, "TwitchPlays" ) ~= nil then
		local command = GLOBAL.require("twitchplays/"..name)
		command.required_votes = GetModConfigData(name.."_votes", true)
		command.cooldown = GetModConfigData(name.."_cooldown", true)
		GLOBAL.TwitchPlays:AddCommand(command)
	end
end

AddCommand("meatstorm")

--add a post init to the game starting up
AddGamePostInit(gamepostinit)