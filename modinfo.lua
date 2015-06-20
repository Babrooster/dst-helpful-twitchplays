name = "Meatstorm"
description = "Add-on actions for Twitch Plays Together - Meatstorm"
author = "Babrooster"
version = "1.0.1"

forumthread = ""

api_version = 10

icon_atlas = "mod_icon.xml"
icon = "mod_icon.tex"

all_clients_require_mod = true
client_only_mod = false
dst_compatible = true

server_filter_tags = {"twitchplays"}

--------------------------------------------------------------------------

local vote_options =
{
	{ description = "1 vote", data = 1 },
}
for i = 10, 90, 10 do
    vote_options[#vote_options + 1] = { description = ""..i.." votes", data = i }
end
for i = 100, 280, 20 do
    vote_options[#vote_options + 1] = { description = ""..i.." votes", data = i }
end
for i = 300, 500, 50 do
    vote_options[#vote_options + 1] = { description = ""..i.." votes", data = i }
end

--------------------------------------------------------------------------

local cooldown_options =
{
    { description = "Instant", data = 0 },
}
for i = 12, 24, 12 do
	cooldown_options[#cooldown_options + 1] = { description = ""..(i % 24 == 0 and (i/24).." day" or i.." hours"), data = i*20 }
end
for i = 36, 120, 12 do
    cooldown_options[#cooldown_options + 1] = { description = ""..(i % 24 == 0 and (i/24).." days" or i.." hours"), data = i*20 }
end

--------------------------------------------------------------------------

configuration_options = {}

local function AddAction(name, votes, cooldown)
    configuration_options[#configuration_options + 1] =
    {
        name = name.."_votes",
        label = "!"..name,
        options = vote_options,
        default = votes,
    }
    configuration_options[#configuration_options + 1] =
    {
        name = name.."_cooldown",
        label = "!"..name.." Cooldown",
        options = cooldown_options,
        default = cooldown,
    }
end

AddAction("meatstorm", 5, 30)