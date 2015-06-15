-- meatstorm is a modified version of frograin from the Twitch Plays Together mod by KleiFish
-- ... it's just meats 8^D

local easing = require("easing")

local RUNTIME = 10

local function RandomizeSpawnDirection(count)
    return math.random() * 2 * PI
end

local function RandomizeSpawnRadius(count)
    local k = math.clamp(count / 15, 0, 1)
    local min = Lerp(2, 1, k * k)
    local max = Lerp(4, 7, k * k)
    return GetRandomMinMax(min, max)
end

local function RandomizeSpawnDelay(count)
    if count == 0 then
        return 0
    elseif count == 1 then
        return GetRandomMinMax(2.5, 3)
    elseif count == 2 then
        return GetRandomMinMax(.25, .3)
    elseif count == 3 then
        return GetRandomMinMax(2, 2.5)
    else
        local k = math.clamp((14 - count) / 10, 0, 1)
        k = Lerp(.1, .4, k * k)
        return GetRandomMinMax(k, 2 * k)
    end
end

local function SpawnMeat(player, runtime_end, count)
local x, y, z = player.Transform:GetWorldPosition()
    if player.sg:HasStateTag("moving") then
        --Lead the player's position if he's moving
        local speed = player.components.locomotor:GetRunSpeed()
        local lead = speed * easing.outQuad(math.min(4, count), .75, .5, 4)
        local theta = player.Transform:GetRotation() * DEGREES
        x = x + lead * math.cos(theta)
        z = z - lead * math.sin(theta)
    end

    local theta = RandomizeSpawnDirection(count)
    local radius = RandomizeSpawnRadius(count)
    local resultoffset = FindValidPositionByFan(theta, radius, 12,
        function(offset)
            return TheWorld.Map:IsPassableAtPoint(x + offset.x, 0, z + offset.z)
        end)

    if resultoffset ~= nil then
        local datmeat = SpawnPrefab("meatball")
        datmeat.persists = false
        datmeat.Transform:SetRotation(math.random(360))
        datmeat.sg:GoToState("fall")
        datmeat.Physics:Teleport(x + resultoffset.x, 35, z + resultoffset.z)
        count = count + 1
        -- frog:ListenForEvent("entitysleep", OnSleep)
    end

    if GetTime() < runtime_end then
        local delay = resultoffset ~= nil and RandomizeSpawnDelay(count) or math.random(2) * FRAMES
        player:DoTaskInTime(delay, SpawnMeat, runtime_end, count, death_rate)
    end
end

local function fn(player)
    player:DoTaskInTime(RandomizeSpawnDelay(0), SpawnMeat, GetTime() + RUNTIME - 3, 0, 9)
end

return
{
    name = "!meatstorm",
    atlas = "images/icons/meatball_icon.xml",
    icon = "meatball_icon.tex",
    fn = fn,
    runtime = RUNTIME,
}