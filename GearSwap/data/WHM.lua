include("MasterGear/MasterGearLua.lua")

function custom_get_sets()
	cancel_haste = 1
	
	ws = {}
	ws["Flash Nova"] = { set = sets["Flash Nova"], tp_bonus = false }
	ws["Seraph Strike"] = { set = sets["Flash Nova"], tp_bonus = true }
	
	sets["Midcast_Holy"] = sets["MagicBurst"]
	sets["Midcast_Holy II"] = sets["MagicBurst"]
	sets["Midcast_Banish"] = sets["MagicBurst"]
	sets["Midcast_Banish II"] = sets["MagicBurst"]
	sets["Midcast_Banish III"] = sets["MagicBurst"]
	
	sets["Midcast_Boost-STR"] = sets["Enh500"]
	sets["Midcast_Boost-DEX"] = sets["Enh500"]
	sets["Midcast_Boost-VIT"] = sets["Enh500"]
	sets["Midcast_Boost-AGI"] = sets["Enh500"]
	sets["Midcast_Boost-INT"] = sets["Enh500"]
	sets["Midcast_Boost-MND"] = sets["Enh500"]
	sets["Midcast_Boost-CHR"] = sets["Enh500"]
	
	sets["Midcast_Protectra I"] = sets["EnhDur"]
	sets["Midcast_Protectra II"] = sets["EnhDur"]
	sets["Midcast_Protectra III"] = sets["EnhDur"]
	sets["Midcast_Protectra IV"] = sets["EnhDur"]
	sets["Midcast_Protectra V"] = sets["EnhDur"]
	sets["Midcast_Shellra"] = sets["EnhDur"]
	sets["Midcast_Shellra II"] = sets["EnhDur"]
	sets["Midcast_Shellra III"] = sets["EnhDur"]
	sets["Midcast_Shellra IV"] = sets["EnhDur"]
	sets["Midcast_Shellra V"] = sets["EnhDur"]
	sets["Midcast_Shell"] = sets["EnhDur"]
	sets["Midcast_Shell II"] = sets["EnhDur"]
	sets["Midcast_Shell III"] = sets["EnhDur"]
	sets["Midcast_Shell IV"] = sets["EnhDur"]
	sets["Midcast_Shell V"] = sets["EnhDur"]
	sets["Midcast_Protect"] = sets["EnhDur"]
	sets["Midcast_Protect II"] = sets["EnhDur"]
	sets["Midcast_Protect III"] = sets["EnhDur"]
	sets["Midcast_Protect IV"] = sets["EnhDur"]
	sets["Midcast_Protect V"] = sets["EnhDur"]
	sets["Midcast_Haste"] = sets["EnhDur"]
	sets["Midcast_Regen IV"] = sets["EnhDur"]
	
	sets["Midcast_Cure"] = sets["Cure"]
	sets["Midcast_Cure II"] = sets["Cure"]
	sets["Midcast_Cure III"] = sets["Cure"]
	sets["Midcast_Cure IV"] = sets["Cure"]
	sets["Midcast_Cure V"] = sets["Cure"]
	sets["Midcast_Cure V"] = sets["Cure"]
	sets["Midcast_Curaga"] = sets["Cure"]
	sets["Midcast_Curaga II"] = sets["Cure"]
	sets["Midcast_Curaga III"] = sets["Cure"]
	sets["Midcast_Curaga IV"] = sets["Cure"]
	sets["Midcast_Curaga V"] = sets["Cure"]
	sets["Midcast_Cura"] = sets["Cure"]
	sets["Midcast_Cura III"] = sets["Cure"]
	
	send_command('@input /macro book 8;wait 1;input /macro set 1')
end