VORP = exports.vorp_inventory:vorp_inventoryApi()

Citizen.CreateThread(function()
	Citizen.Wait(2000)

	VORP.RegisterUsableItem("cannabisseed", function(data)
		VORP.subItem(data.source, "cannabisseed", 1)
		local item = "cannabisseed"
		TriggerClientEvent('poke_planting:planto1', data.source, "prop_weed_02", "prop_weed_02", "prop_weed_01", item)
		
	end)

	VORP.RegisterUsableItem("cocaineseed", function(data)
		VORP.subItem(data.source, "cocaineseed", 1)
		local item = "cocaineseed"
		TriggerClientEvent('poke_planting:planto1', data.source, "rdr_bush_arec_aa_sim", "rdr_bush_arec_aa_sim", "rdr_bush_arec_aa_sim", item)
		
	end)


	VORP.RegisterUsableItem("opiumpoppyseed", function(data)
		VORP.subItem(data.source, "opiumpoppyseed", 1)
		local item = "opiumpoppyseed"
		TriggerClientEvent('poke_planting:planto1', data.source, "prariepoppy_p", "prariepoppy_p", "prariepoppy_p", item)
		
	end)

	VORP.RegisterUsableItem("wateringcan", function(data)
		TriggerClientEvent('poke_planting:regar1', data.source)
	end)
	
end)

RegisterServerEvent('giveback')
AddEventHandler('giveback', function(item)
	VORP.addItem(source, item, 1)
	TriggerClientEvent("seed:used")
end)

RegisterServerEvent('poke_planting:giveitem')
AddEventHandler('poke_planting:giveitem', function(tipo)
    local _source = source
	local count = math.random(2, 5)
	if tipo == "prop_weed_01" then
        TriggerClientEvent("vorp:TipRight", _source, 'You have collected [X'..count..'] Weed', 3000)
        VORP.addItem(_source, "weedbuds", count)
	end
	
	if tipo == "rdr_bush_arec_aa_sim" then
        TriggerClientEvent("vorp:TipRight", _source, 'You have collected [X'..count..'] Cocaine', 3000)
        VORP.addItem(_source, "cocaineleaf", count)
	end

	if tipo == "prariepoppy_p" then
        TriggerClientEvent("vorp:TipRight", _source, 'You have collected [X'..count..'] Opium', 3000)
        VORP.addItem(_source, "opiumpoppy", count)
	end

end)
