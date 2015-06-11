Assets =
{
    Asset("IMAGE", "images/icons/tw_icon_frogstorm.tex"),
    Asset("ATLAS", "images/icons/tw_icon_frogstorm.xml")
}

local function AddCommand(name)
	if GLOBAL.rawget( GLOBAL, "TwitchPlays" ) ~= nil then
		local command = GLOBAL.require("twitchplays/"..name)
		command.required_votes = GetModConfigData(name.."_votes", true)
		command.cooldown = GetModConfigData(name.."_cooldown", true)
		GLOBAL.TwitchPlays:AddCommand(command)
	end
end

AddCommand("meatstorm")