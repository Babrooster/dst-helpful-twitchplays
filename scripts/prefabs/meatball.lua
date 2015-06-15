require "tuning"

local Assets =
{
	Asset("ANIM", "anim/meatball.zip"),
	Asset("ANIM", "anim/swap_meatball.zip"),
    Asset("ATLAS", "images/inventoryimages/meatball.xml"),
}

local prefabs =
{
	"spoiled_food",
}
 
-- this function will be called when our tool breaks
local function onfinished(inst) 
    inst:Remove()
end
 
local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
    MakeInventoryPhysics(inst)
    
    inst.AnimState:SetBank("meatball")
    inst.AnimState:SetBuild("meatball")
    inst.AnimState:PlayAnimation("idle")
    
    if not TheWorld.ismastersim then
        return inst
    end
    
    inst:AddTag("food")
    inst:AddTag("meat")
	
	inst:AddComponent("inspectable")
	
    inst:AddComponent("edible") -- can be eaten
    inst.components.edible.foodtype = FOODTYPE.MEAT
    inst.components.edible.ismeat = true
    inst.components.edible.healthvalue = TUNING.HEALING_MED 
    inst.components.edible.hungervalue = TUNING.CALORIES_MED
	
	-- inst.AddComponent("bait")
	
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("tradable")
	inst.components.tradable.goldvalue = TUNING.GOLD_VALUES.MEAT
 
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_TWO_DAY)
	inst.components.perishable.onperishreplacement = "spoiled_food"
	inst.components.perishable:StartPerishing()
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/meatball.xml"
	
    return inst
end

STRINGS.NAMES.MEATBALL= "Meatball"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MEATBALL = "It's a ball of meat!"
STRINGS.CHARACTERS.WENDY.DESCRIBE.MEATBALL = "What type of meat is this?"
--strings.CHARACTERS.TOVATH.DESCRIBE.MEATBALL = "Meat from the sky?"
--STRINGS.CHARACTERS.FELICIA.DESCRIBE.MEATBALL = "A meatball!? Put it in my mouth!"
--STRINGS.CHARACTERS.RYON.DESCRIBE.MEATBALL = "You want to know what it takes to not starve? It takes MEAT BALLS to not starve."

return Prefab( "common/inventory/meatball", fn, Assets)