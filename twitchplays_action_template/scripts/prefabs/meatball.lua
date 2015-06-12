local assets = { 
	Asset("ATLAS", "images/item/meatball.xml"),
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
	--inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    
    --inst.AnimState:SetBank("meatball")
    --inst.AnimState:SetBuild("meatball")
    --inst.AnimState:PlayAnimation("idle")
    
    inst:AddTag("food")
    inst:AddTag("meat")
    
    inst:AddComponent("edible") -- can be eaten
    inst.components.edible.foodtype = FOODTYPE.MEAT
    inst.components.edible.healthvalue = TUNING.HEALING.MED 
    inst.components.edible.hungervalue = TUNING.CALORIES_MED
	
	inst.AddComponent("bait")
	
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("tradable")
	inst.components.tradable.goldvalue = TUNING.GOLD_VALUES.MEAT
 
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_TWO_DAY)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "spoiled_food"
    
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	
    return inst
end
 
return Prefab( "common/inventory/meatball", fn, assets, prefabs)