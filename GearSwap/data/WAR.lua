include("MasterGear/MasterGearLua.lua")

function custom_get_sets()
	cancel_haste = 1
	
	ws = {}
	ws["Impulse Drive"] = { set = sets["Steel Cyclone"], tp_bonus = true }
	ws["Sonic Thrust"] = { set = sets["Steel Cyclone"], tp_bonus = true }
	ws["Stardiver"] = { set = sets["Upheaval"], tp_bonus = false }
	ws["SO_Impulse Drive"] = { set = sets["Ukko's Fury"], tp_bonus = true }
	ws["SO_Sonic Thrust"] = { set = sets["Ukko's Fury"], tp_bonus = true }
	ws["SO_Stardiver"] = { set = sets["Ukko's Fury"], tp_bonus = true }
	
	ws["Steel Cyclone"] = { set = sets["Steel Cyclone"], tp_bonus = true }
	ws["Sturmwind"] = { set = sets["Steel Cyclone"], tp_bonus = true }
	ws["Iron Tempest"] = { set = sets["Steel Cyclone"], tp_bonus = true }
	ws["Fell Cleave"] = { set = sets["Steel Cyclone"], tp_bonus = false }
	ws["Upheaval"] = { set = sets["Upheaval"], tp_bonus = true }
	ws["King's Justice"] = { set = sets["Upheaval"], tp_bonus = true }
	ws["Ukko's Fury"] = { set = sets["Ukko's Fury"], tp_bonus = true }
	ws["Keen Edge"] = { set = sets["Ukko's Fury"], tp_bonus = true }
	ws["Raging Rush"] = { set = sets["Ukko's Fury"], tp_bonus = true }
	ws["Armor Break"] = { set = sets["Armor Break"], tp_bonus = false }
	ws["Shield Break"] = { set = sets["Armor Break"], tp_bonus = false }
	ws["Weapon Break"] = { set = sets["Armor Break"], tp_bonus = false }
	ws["Full Break"] = { set = sets["Armor Break"], tp_bonus = false }
	
	send_command('@input /macro book 19')
end

function custom_precast(spell)
	if spell.type == "Weaponskill" then
		local equipment = windower.ffxi.get_items().equipment
		local main = windower.ffxi.get_items(equipment.main_bag, equipment.main)	
		if res.items[main.id].name == "Shining One" then
			if ws["SO_" .. spell.english] then equip(ws["SO_" .. spell.english].set)
			elseif ws[spell.english] then equip(ws[spell.english].set) end
			if player.tp < 3000 then
				equip(sets["TPBonus"])
			end
			return true
		end
	end
end