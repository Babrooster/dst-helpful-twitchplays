name = "Meatstorm"
description = "Add-on actions for Twitch Plays Together - Meatstorm"
author = "Babrooster"
version = "0.0.1"

forumthread = ""

api_version = 10

all_clients_require_mod = true
client_only_mod = false
dst_compatible = true

server_filter_tags = {"twitchplays"}

--------------------------------------------------------------------------

local vote_options =
{
    { description = "On", data = 0 },
}
for i = 1, 5 do
    vote_options[#vote_options + 1] = { description = ""..i..(i > 1 and " votes" or " vote"), data = i }
end
for i = 10, 100, 5 do
    vote_options[#vote_options + 1] = { description = ""..i.." votes", data = i }
end

--------------------------------------------------------------------------

local cooldown_options =
{
    { description = "Instant", data = 0 },
}
for i = 10, 300, 10 do
    cooldown_options[#cooldown_options + 1] = { description = ""..i.." seconds", data = i }
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