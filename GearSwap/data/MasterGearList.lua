res = include('resources')
include('MasterGearFunctions.lua')

MasterGearList = {
	main = {
		{ name = "Solstice", 			setList = { { job = "GEO", sets = { "CombatIdleDT", "Fastcast", "ConserveMP", "Geomancy" } } } },
		{ name = "Daybreak", 			setList = { { job = "GEO", sets = { "IdleRefresh", "Healing", "Elemental", "MACC" } } } },
		{ name = "Tauret", 				setList = { { job = "THF", sets = { } } } },
		{ name = "Epeolatry", 			setList = { { job = "RUN", sets = { } } } },
		{ name = "Naegling", 			setList = { { job = "NIN", sets = { } } } },
		{ name = "Perun", 				setList = { { job = "RNG", sets = { } } } },
	},
	sub = {
		{ name = "Elan Strap +1", 		setList = { { job = "SMN", sets = { } } } },
		{ name = "Culminus", 			setList = { { job = "GEO", sets = { "CombatIdleDT", "Elemental" } } } },
		{ name = "Sors Shield", 		setList = { { job = "GEO", sets = { "HealingFastcast", "Healing" } } } },
		{ name = "Shijo", 				setList = { { job = "THF", sets = { } } } },
		{ name = "Utu Grip",			setList = { { job = "RUN", sets = { } } } },
		{ name = "Ternion Dagger +1",	setList = { { job = "RNG", sets = { } } } },
	},
	range = {
		{ name = "Dunna", 				setList = { { job = "GEO", sets = { "CombatIdleDT", "Geomancy", "MACC" } } } },
		{ name = "Wingcutter +1", 		setList = { { job = "THF", sets = { "Throwing" } } } },
		{ name = "Fomalhaut", 			setList = { { job = "RNG", sets = { } } } },
	},
	ammo = {
		{ name = "Epitaph", 			setList = { { job = "SMN", sets = { "Idle", "BPDmg", "PrecastBP" } } } },
		{ name = "Per. Lucky Egg", 		setList = { { job = "SMN", sets = { "Dia", "Dia II", "Diaga" } },
													{ job = "GEO", sets = { "Dia", "Dia II", "Diaga", "Bio" } },
													{ job = "RUN", sets = { "TH" } },
													{ job = "THF", sets = { "TH" } },
													{ job = "NIN", sets = { "TH" } },
													} },
		{ name = "Staunch Tathlum", 	setList = { { job = "RUN", sets = { "DT" } } } },
		{ name = "Aurgelmir Orb", 		setList = { { job = "RUN", sets = { "Hybrid" } },
													{ job = "THF", sets = { "Hybrid", "Rudra's Storm" } },
													{ job = "NIN", sets = { "Hybrid" } },
													} },
		{ name = "Knobkierrie", 		setList = { { job = "RUN", sets = { "Dimidiation" } } } },
		{ name = "Seeth. Bomblet +1", 	setList = { { job = "RUN", sets = { "Resolution", "Requiescat", "Savage Blade" } },
													{ job = "THF", sets = { "Requiescat", "Savage Blade" } },
													{ job = "NIN", sets = { "STR_WS", "MagicAtk" } },
													} },
		{ name = "Yetshila", 			setList = { { job = "THF", sets = { "Evisceration" } } } },
		{ name = "Ghastly Tathlum +1",	setList = { { job = "THF", sets = { "Aeolian Edge" } },
													{ job = "RUN", sets = { "Lunge" } },
													{ job = "GEO", sets = { "Elemental" } },
													} },
	},
	head = {
		{ name = "Beckoner's Horn +1",	setList = { { job = "SMN", sets = { "Idle", "PrecastBP", "SmnSkill" } } },
			priority = 31 },
		{ name = "Apogee Crown +1",		setList = { { job = "SMN", sets = { "BPDmg" } } },
			priorty = -110 },
		{ name = "Glyphic Horn +1",		setList = { { job = "SMN", sets = { "Astral Flow" } } },
			priority = 31 },
		{ name = "Azimuth Hood +1",		setList = { { job = "GEO", sets = { "IdleRefresh", "CombatIdleDT", "Geomancy", "Full Circle" } } } },
		{ name = "Vanya Hood",			setList = { { job = "GEO", sets = { "Fastcast", "ConserveMP", "Healing" } },
													{ job = "SMN", sets = { "Fastcast" } },
													} },
		{ name = "Aya. Zucchetto +2",	setList = { { job = "RUN", sets = { "DT", "Hybrid" } } }, 
			priority = 45 },
		{ name = "Erilaz Galea +1",		setList = { { job = "RUN", sets = { "Vivacious Pulse", "EnhancingAny" } } }, 
			priority = 91 },
		{ name = "Fu. Bandeau +2",		setList = { { job = "RUN", sets = { "PDT", "Battuta", "EnhancingPhalanx", "Requiescat" } } }, 
			priority = 46 },
		{ name = "Despair Helm",		setList = { { job = "RUN", sets = { "Emnity" } } }, 
			priority = 46 },
		{ name = "Herculean Helm",		setList = { { job = "RUN", sets = { "Dimidiation", "Resolution", "Savage Blade" } },
													{ job = "THF", sets = { "Fastcast", "Aeolian Edge" } },
													{ job = "NIN", sets = { "STR_WS", "MagicAtk" } },
													}, 
			priority = 38 },
		{ name = "Rune. Bandeau +2",	setList = { { job = "RUN", sets = { "Fastcast", "EnhancingRegen" } } }, 
			priority = 99 },
		{ name = "Malignance Chapeau",	setList = { { job = "THF", sets = { "Hybrid" } },
													{ job = "NIN", sets = { "Hybrid" } },
													{ job = "RNG", sets = { "Hybrid" } },
													} },
		{ name = "Pill. Bonnet +2",		setList = { { job = "THF", sets = { "Rudra's Storm", "Evisceration", "Savage Blade", "Requiescat" } } } },
		{ name = "Arcadian Beret +1",	setList = { { job = "RNG", sets = { "Midshot" } } } },
		{ name = "Orion Beret +1",		setList = { { job = "RNG", sets = { "Flurry2" } } } },
	},
	neck = {
		{ name = "Caller's Pendant",	setList = { { job = "SMN", sets = { "Idle" } } } },
		{ name = "Summoner's Collar",	setList = { { job =	"SMN", sets = { "BPDmg" } } } },
		{ name = "Incanter's Torque",	setList = { { job =	"SMN", sets = { "PrecastBP", "SmnSkill" } }, 
													{ job = "GEO", sets = { "ConserveMP", "Geomancy", "Healing" } },
													{ job = "RUN", sets = { "EnhancingAny" } },
													} },
		{ name = "Loricate Torque +1",	setList = { { job = "GEO", sets = { "CombatIdleDT" } },
													{ job = "SMN", sets = { "IdleDT" } },
													} },
		{ name = "Lissome Necklace",	setList = { { job = "GEO", sets = { "IdleRefresh" } },
													{ job = "THF", sets = { "IdleRegen" } },
													{ job = "RUN", sets = { "Idle" } },
													{ job = "NIN", sets = { "IdleRegen" } },
													{ job = "RNG", sets = { "IdleRegen" } },
													} },
		{ name = "Voltsurge Torque",	setList = { { job = "RUN", sets = { "Fastcast" } },
													{ job = "THF", sets = { "Fastcast" } },
													{ job = "GEO", sets = { "Fastcast", "MACC" } },
													{ job = "SMN", sets = { "Fastcast", "MACC" } },
													{ job = "NIN", sets = { "Fastcast" } },
													} },
		{ name = "Futhark Torque +1",	setList = { { job = "RUN", sets = { "DT", "Hybrid", "Emnity" } } },
			priority = 30 },
		{ name = "Fotia Gorget",		setList = { { job = "RUN", sets = { "Resolution", "Requiescat" } },
													{ job = "THF", sets = { "Evisceration", "Requiescat" } },
													} },
		{ name = "Erudit. Necklace",	setList = { { job = "THF", sets = { "Hybrid" } },
													{ job = "NIN", sets = { "Hybrid" } },
													{ job = "RNG", sets = { "Hybrid" } },
													} },
		{ name = "Satlada Necklace",	setList = { { job = "THF", sets = { "Aeolian Edge" } },
													{ job = "GEO", sets = { "Elemental" } },
													{ job = "RUN", sets = { "Lunge" } },
													{ job = "NIN", sets = { "MagicAtk" } },
													{ job = "RNG", sets = { "MagicAtk" } },
													} },
		{ name = "Caro Necklace",		setList = { { job = "THF", sets = { "Rudra's Storm", "Savage Blade" } },
													{ job = "RUN", sets = { "Dimidiation", "Savage Blade" } },
													{ job = "NIN", sets = { "STR_WS", "DEX_WS" } },
													{ job = "RNG", sets = { "STR_Melee_WS" } },
													} },
	},
	ear1 = {
		-- { name = "Andoaa Earring", 		setList = { { job = "RUN", sets = { "EnhancingAny" } } } },
		{ name = "Evans Earring", 		setList = { { job = "SMN", sets = { "Idle" } } } },
		{ name = "Lodurr Earring", 		setList = { { job = "SMN", sets = { "PrecastBP", "SmnSkill" } } } },
		{ name = "Handler's Earring +1",setList = { { job = "GEO", sets = { "CombatIdleDT" } } } },
		{ name = "Loquac. Earring",		setList = { { job = "RUN", sets = { "Fastcast" } },
													{ job = "THF", sets = { "Fastcast" } },
													{ job = "GEO", sets = { "Fastcast" } },
													{ job = "SMN", sets = { "Fastcast" } },
													} },
		{ name = "Mendi. Earring",		setList = { { job = "GEO", sets = { "HealingFastcast", "Healing" } } } },
		{ name = "Barkaro. Earring",	setList = { { job = "GEO", sets = { "Elemental", "MACC" } } } },
		{ name = "Moonshade Earring",	setList = { { job = "RUN", sets = { "TPBonus" } },
													{ job = "THF", sets = { "TPBonus" } },
													{ job = "GEO", sets = { "TPBonus" } },
													{ job = "SMN", sets = { "TPBonus" } },
													{ job = "NIN", sets = { "TPBonus" } },
													} },
		{ name = "Ethereal Earring",	setList = { { job = "RUN", sets = { "DT" } } },
			priority = 15 },
		{ name = "Telos Earring",		setList = { { job = "RUN", sets = { "Hybrid" } },
													{ job = "THF", sets = { "Hybrid" } },
													{ job = "NIN", sets = { "Hybrid" } },
													{ job = "RNG", sets = { "Hybrid", "Midshot" } },
													} },
		{ name = "Ishvara Earring",		setList = { { job = "RUN", sets = { "Dimidiation", "Resolution", "Requiescat", "Savage Blade" } },
													{ job = "THF", sets = { "Requiescat", "Savage Blade" } },
													{ job = "NIN", sets = { "STR_WS", "DEX_WS" } },
													{ job = "RNG", sets = { "AGI_Ranged_WS" } },
													} },
		{ name = "Sherida Earring",		setList = { { job = "THF", sets = { "Rudra's Storm", "Evisceration" } } } },
		{ name = "Friomisi Earring",	setList = { { job = "RUN", sets = { "Emnity", "Lunge" } },
													{ job = "THF", sets = { "Aeolian Edge" } },
													{ job = "NIN", sets = { "MagicAtk" } },
													{ job = "RNG", sets = { "MagicAtk" } },
													} },
	},
	ear2 = {
		-- { name = "C. Palug Earring",	setList = { { job = "SMN", sets = { "BPDmg", "PrecastBP", "SmnSkill" } } } },
		-- { name = "Mimir Earring", 		setList = { { job = "RUN", sets = { "EnhancingAny" } } } },
		{ name = "Gelos Earring",		setList = { { job = "SMN", sets = { "BPDmg" } } } },
		{ name = "Malignance Earring",	setList = { { job = "GEO", sets = { "Fastcast", "Elemental", "MACC" } },
													{ job = "SMN", sets = { "Fastcast", "MACC" } },
													} },
		{ name = "Odnowa Earring +1",	setList = { { job = "GEO", sets = { "CombatIdleDT" } },
													{ job = "SMN", sets = { "IdleDT" } },
													{ job = "RUN", sets = { "DT", } }
													},
			priority = 110 },
		{ name = "Etiolation Earring",	setList = { { job = "RUN", sets = { "MDT", "Fastcast" } },
													{ job = "THF", sets = { "Fastcast" } },
													{ job = "NIN", sets = { "Fastcast" } }
													},
			priority = 110 },
		{ name = "Sherida Earring",		setList = { { job = "RUN", sets = { "Hybrid", "Dimidiation", "Resolution", "Requiescat", "Savage Blade" } },
													{ job = "THF", sets = { "Hybrid", "Requiescat", "Savage Blade" } },
													{ job = "RNG", sets = { "Hybrid" } },
													} },
		{ name = "Hecate's Earring",	setList = { { job = "RUN", sets = { "Lunge" } },
													{ job = "THF", sets = { "Aeolian Edge" } },
													{ job = "RNG", sets = { "MagicAtk" } },
													} },
		{ name = "Odr Earring",			setList = { { job = "THF", sets = { "Rudra's Storm", "Evisceration" } },
													} },
		{ name = "Lugra Earring +1",	setList = { { job = "NIN", sets = { "STR_WS", "DEX_WS" } },
													} },
		{ name = "Neritic Earring",		setList = { { job = "RNG", sets = { "Midshot" } }, } },
	},
	body = {
		{ name = "Apo. Dalmatica +1",	setList = { { job = "SMN", sets = { "BPDmg" } } },
			priority = -160 },
		{ name = "Con. Doublet +3",		setList = { { job = "SMN", sets = { "PrecastBP" } } },
			priority = 85 },
		{ name = "Vrikodara Jupon",		setList = { { job = "GEO", sets = { "IdleRefresh", "CombatIdleDT", "Fastcast" } },
													{ job = "SMN", sets = { "Idle", "Fastcast" } },
													},
			priority = 54},
		{ name = "Bagua Tunic +2", 		setList = { { job = "GEO", sets = { "Geomancy", "Bolster" } } } },
		{ name = "Councilor's Garb", 	setList = { { job = "RUN", sets = { "Adoulin" } },
													{ job = "THF", sets = { "Adoulin" } },
													{ job = "GEO", sets = { "Adoulin" } },
													{ job = "SMN", sets = { "Adoulin" } },
													{ job = "NIN", sets = { "Adoulin" } },
													} },
		{ name = "Futhark Coat +3", 	setList = { { job = "RUN", sets = { "DT", "Elemental Sforzo", "Liement", "IdleRegen", "Dimidiation", "Savage Blade", "Resolution", 																	  "Requiescat" } } },
			priority = 119 },
		{ name = "Runeist's Coat +2", 	setList = { { job = "RUN", sets = { "Valiance" } } },
			priority = 208 },
		{ name = "Ayanmo Corazza +2", 	setList = { { job = "RUN", sets = { "Hybrid" } } },
			priority = 57 },
		{ name = "Emet Harness +1", 	setList = { { job = "RUN", sets = { "Emnity" } } },
			priority = 61 },
		{ name = "Samnuha Coat", 		setList = { { job = "RUN", sets = { "Fastcast", "Lunge" } },
													{ job = "THF", sets = { "Fastcast", "Aeolian Edge" } },
													{ job = "NIN", sets = { "Fastcast", "MagicAtk" } },
													},
			priority = 63 },
		{ name = "Malignance Tabard", 	setList = { { job = "THF", sets = { "Hybrid" } },
													{ job = "NIN", sets = { "Hybrid" } },
													{ job = "RNG", sets = { "Hybrid", "Midshot" } },
													} },
		{ name = "Plunderer's Vest +3", setList = { { job = "THF", sets = { "TrickAttack", "Evisceration", "Rudra's Storm", "Savage Blade", "Requiescat" } } } },
		{ name = "Cohort Cloak +1", 	setList = { { job = "GEO", sets = { "MACC", "Elemental" } },
													{ job = "SMN", sets = { "MACC" } },
													{ job = "RNG", sets = { "MagicAtk" } },
													}, },
		{ name = "Meg. Cuirie +2", 		setList = { { job = "RNG", sets = { "AGI_Ranged_WS" } } } },
		{ name = "Amini Caban +1", 		setList = { { job = "RNG", sets = { "Flurry2" } } } },
	},
	hands = {
		{ name = "Asteria Mitts +1", 	setList = { { job = "SMN", sets = { "Idle" } } } },
		{ name = "Merlinic Dastanas", 	setList = { { job = "SMN", sets = { "BPDmg" } } } },
		{ name = "Lamassu Mitts +1", 	setList = {	{ job = "SMN", sets = { "PrecastBP", "SmnSkill" } } } },
		{ name = "Geo. Mitaines +2", 	setList = {	{ job = "GEO", sets = { "CombatIdleDT", "Geomancy", "MACC" } } } },
		{ name = "Bagua Mitaines +1", 	setList = {	{ job = "GEO", sets = { "ElementalFastcast", "Curative Recantation" } } } },
		{ name = "Jhakri Cuffs +1", 	setList = {	{ job = "GEO", sets = { "Elemental" } } } },
		{ name = "Leyline Gloves", 		setList = { { job = "RUN", sets = { "Fastcast", "Lunge" } },
													{ job = "THF", sets = { "Fastcast", "Aeolian Edge" } },
													{ job = "NIN", sets = { "Fastcast", "MagicAtk" } },
													},
			priorty = 25 },
		{ name = "Meg. Gloves +2", 		setList = { { job = "RUN", sets = { "Dimidiation", "Resolution", "Requiescat", "Savage Blade" } },
													{ job = "THF", sets = { "Hybrid", "Rudra's Storm", "Requiescat", "Savage Blade" } },
													{ job = "RNG", sets = { "Hybrid" } },
													},
			priorty = 30 },
		{ name = "Runeist's Mitons +2",	setList = { { job = "RUN", sets = { "Gambit", "EnhancingAny" } } },
			priorty = 75 },
		{ name = "Taeon Gloves", 		setList = { { job = "RUN", sets = { "EnhancingPhalanx" } } },
			priorty = 25 },
		{ name = "Turms Mittens +1", 	setList = { { job = "RUN", sets = { "Hybrid", "DT", "PDT" } } },
			priorty = 25 },
		{ name = "Plun. Armlets +1", 	setList = {	{ job = "THF", sets = { "TH" } } } },
		{ name = "Pill. Armlets +2", 	setList = {	{ job = "THF", sets = { "TrickAttack" } } } },
		{ name = "Mummu Wrists +2", 	setList = {	{ job = "THF", sets = { "Evisceration" } },
													{ job = "NIN", sets = { "Hybrid" } },
													} },
		{ name = "Carmine Fin. Ga. +1",	setList = {	{ job = "RNG", sets = { "MagicAtk", "Midshot", "Flurry2" } },
													} },									
	},
	ring1 = {
		{ name = "Vocane Ring +1",		setList = {	{ job = "SMN", sets = { "IdleDT" } },
													{ job = "GEO", sets = { "CombatIdleDT" } },
													{ job = "RUN", sets = { "DT" } },
													{ job = "THF", sets = { "Hybrid", "Knockback" } },
													{ job = "NIN", sets = { "Hybrid" } },
													{ job = "RNG", sets = { "Hybrid" } },
													} },
		{ name = "Varar Ring +1", 		setList = { { job = "SMN", sets = { "BPDmg" } } } },
		{ name = "Evoker's Ring",		setList = { { job = "SMN", sets = { "PrecastBP", "SmnSkill" } } } },
		
		{ name = "Vertigo Ring",		setList = { { job = "GEO", sets = { "Elemental", "MACC" } },
													{ job = "SMN", sets = { "MACC" } },
													{ job = "RUN", sets = { "Requiescat" } },
													{ job = "THF", sets = { "Requiescat" } }
													} },
		{ name = "Locus Ring",			setList = { { job = "RUN", sets = { "Lunge" } },
													} },
		{ name = "Rajas Ring",			setList = { { job = "RUN", sets = { "Dimidiation", "Resolution", "Savage Blade" } },
													{ job = "THF", sets = { "Rudra's Storm", "Savage Blade" } },
													{ job = "NIN", sets = { "STR_WS", "DEX_WS" } },
													} },
		{ name = "Mummu Ring",			setList = { { job = "THF", sets = { "Evisceration" } } } },
		{ name = "Dingir Ring",			setList = { { job = "RNG", sets = { "MagicAtk", "Midshot", "AGI_Ranged_WS" } },
													} },
	},
	ring2 = {
		-- { name = "Stikini Ring +1", 	setList = { { job =	"SMN", sets = { "Idle", "PrecastBP", "SmnSkill" } } } }, -- 30 mil gil :(
		-- { name = "Globidonta Ring", 	setList = { { job =	"SMN", sets = { "PrecastBP", "SmnSkill" } } } }, -- +5 skill from incursion
		{ name = "Varar Ring +1",		setList = { { job = "SMN", sets = { "BPDmg" } } } },
		{ name = "Resonance Ring",		setList = { { job = "GEO", sets = { "Elemental" } } } },
		{ name = "Chirich Ring",		setList = { { job = "GEO", sets = { "IdleRefresh" } },
													{ job = "RUN", sets = { "IdleRegen" } },
													{ job = "THF", sets = { "IdleRegen" } },
													{ job = "NIN", sets = { "IdleRegen" } },
													{ job = "RNG", sets = { "IdleRegen" } }
													} },
		{ name = "Gelatinous Ring +1",	setList = { { job = "RUN", sets = { "PDT" } },
													{ job = "THF", sets = { "Hybrid" } },
													{ job = "SMN", sets = { "IdleDT" } },
													{ job = "GEO", sets = { "CombatIdleDT" } },
													{ job = "NIN", sets = { "Hybrid" } },
													{ job = "RNG", sets = { "Hybrid" } },
													},
			priority = 135 },
		{ name = "Supershear Ring",		setList = { { job = "RUN", sets = { "Emnity" } } },
			priority = 30 },
		{ name = "Ramuh Ring",			setList = { { job = "RUN", sets = { "Dimidiation" } },
													{ job = "THF", sets = { "Rudra's Storm", "Evisceration" } },
													{ job = "NIN", sets = { "DEX_WS" } },
													} },
		{ name = "Rufescent Ring",		setList = { { job = "RUN", sets = { "Resolution", "Requiescat", "Savage Blade" } },
													{ job = "THF", sets = { "Requiescat", "Savage Blade" } },
													{ job = "NIN", sets = { "STR_WS" } }
													} },
		{ name = "Kishar Ring",			setList = { { job = "RUN", sets = { "Fastcast" } },
													{ job = "GEO", sets = { "Fastcast", "MACC" } },
													{ job = "SMN", sets = { "Fastcast", "MACC" } },
													{ job = "NIN", sets = { "Fastcast" } },
													} },
		{ name = "Nekhen Ring",			setList = { { job = "RNG", sets = { "Midshot" } } } },
		-- { name = "Arvina Ringlet +1",	setList = { { job = "RNG", sets = { "MagicAtk" } } } },
				 
	},
	back = {
		{ name = "Campestres's Cape",	setList = { { job = "SMN", sets = { "Idle", "BPDmg" } } } },
		{ name = "Mecisto. Mantle",		setList = { { job = "GEO", sets = { "CP" } },
													{ job = "SMN", sets = { "CP" } },
													{ job = "NIN", sets = { "CP" } },
													{ job = "RNG", sets = { "CP" } },
													} },
		{ name = "Conveyance Cape",		setList = { { job = "SMN", sets = { "PrecastBP", "SmnSkill" } } } },
		{ name = "Lifestream Cape",		setList = { { job = "GEO", sets = { "CombatIdleDT", "Fastcast", "Geomancy", } } } },
		{ name = "Solemnity Cape",		setList = { { job = "GEO", sets = { "ConserveMP", "Healing" } } } },
		{ name = "Nantosuelta's Cape",	setList = { { job = "GEO", sets = { "Elemental", "MACC", "Life Cycle" } } } },
		{ name = "Ogma's Cape", 		setList = { { job = "RUN", sets = { "Hybrid", "Valiance" } } }, 
			augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',} },
		{ name="Ogma's Cape", 			setList = { { job = "RUN", sets = { "Dimidiation" } } }, 
			augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',} },
		{ name = "Ogma's Cape", 		setList = { { job = "RUN", sets = { "Resolution", "Requiescat", "Savage Blade" } } }, 
			augments = {'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10'} },
		{ name = "Evasionist's Cape",	setList = { { job = "RUN", sets = { "DT", "Emnity" } } } },
		{ name = "Izdubar Mantle",		setList = { { job = "SMN", sets = { "MACC" } },
													{ job = "RUN", sets = { "Lunge" } },
													{ job = "THF", sets = { "Aeolian Edge" } },
													{ job = "NIN", sets = { "MagicAtk" } },
													} },
		{ name = "Toutatis's Cape",		setList = { { job = "THF", sets = { "Hybrid", "SneakAttack" } } },
			augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',} },
		{ name = "Repulse Mantle",		setList = { { job = "THF", sets = { "Knockback" } },
													{ job = "RNG", sets = { "Hybrid" } },
													} },
		{ name = "Sacro Mantle",		setList = { { job = "THF", sets = { "Rudra's Storm", "Evisceration", "Savage Blade", "Requiescat" } },
													{ job = "NIN", sets = { "STR_WS", "DEX_WS" } }
													} },
		{ name = "Belenus's Cape",		setList = { { job = "RNG", sets = { "Flurry2" } } },
			augments={'"Snapshot"+10',} },
		{ name = "Belenus's Cape",		setList = { { job = "RNG", sets = { "Midshot", "Doubleshot", "IdleRegen", "AGI_Ranged_WS", "MagicAtk" } } },
			augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','"Regen"+5',} },
	},
	waist = {
		{ name = "Lucidity Sash", 		setList = { { job = "SMN", sets = { "PrecastBP", "SmnSkill" } } } },
		{ name = "Chaac Belt", 			setList = { { job = "SMN", sets = { "Dia", "Dia II", "Diaga" } },
													{ job = "GEO", sets = { "Dia", "Dia II", "Diaga", "Bio" } },
													{ job = "RUN", sets = { "TH" } },
													{ job = "THF", sets = { "TH" } },
													{ job = "NIN", sets = { "TH" } },
													} },
		{ name = "Isa Belt", 			setList = { { job = "GEO", sets = { "CombatIdleDT" } },
													{ job = "SMN", sets = { "Idle" } },
													} },
		{ name = "Witful Belt", 		setList = { { job = "GEO", sets = { "Fastcast" } },
													{ job = "SMN", sets = { "Fastcast" } },
													} },
		{ name = "Hachirin-no-Obi",		setList = {	{ job = "GEO", sets = { "WeatherObi" } },
													} },
		{ name = "Eschan Stone",		setList = { { job = "RUN", sets = { "Lunge" } },
													{ job = "SMN", sets = { "MACC" } },
													{ job = "GEO", sets = { "Elemental", "MACC" } },
													{ job = "THF", sets = { "Aeolian Edge" } },
													{ job = "NIN", sets = { "MagicAtk" } },
													{ job = "RNG", sets = { "MagicAtk" } },
													} },
		{ name = "Engraved Belt",		setList = { { job = "RUN", sets = { "DT" } } } },
		{ name = "Fotia Belt",			setList = { { job = "RUN", sets = { "Resolution", "Requiescat" } },
													{ job = "THF", sets = { "Evisceration", "Requiescat" } },
													} },
		{ name = "Sailfi Belt +1",		setList = { { job = "RUN", sets = { "Hybrid", "Savage Blade" } },
													{ job = "THF", sets = { "Hybrid", "Savage Blade" } },
													{ job = "NIN", sets = { "Hybrid" } },
													{ job = "RNG", sets = { "Hybrid", "STR_Melee_WS" } },
													} },
		{ name = "Grunfeld Rope",		setList = { { job = "RUN", sets = { "Dimidiation" } },
													{ job = "THF", sets = { "Rudra's Storm" } },
													{ job = "NIN", sets = { "STR_WS", "DEX_WS" } },
													} },
	},
	legs = {
		{ name = "Assid. Pants +1", 	setList = { { job = "SMN", sets = { "Idle" } },
													{ job = "GEO", sets = { "IdleRefresh" } },
													} },
		{ name = "Enticer's Pants", 	setList = {	{ job = "SMN", sets = { "BPDmg" } } } },
		{ name = "Beck. Spats +1",		setList = { { job = "SMN", sets = { "PrecastBP", "SmnSkill" } } } },
		{ name = "Psycloth Lappas",		setList = { { job = "GEO", sets = { "CombatIdleDT" } },
													{ job = "SMN", sets = { "MACC" } }
													} },
		{ name = "Geomancy Pants +2",	setList = { { job = "GEO", sets = { "Fastcast", "MACC" } } } },
		{ name = "Bagua Pants +2",		setList = { { job = "GEO", sets = { "Geomancy", "Elemental" } } } },
		{ name = "Aya. Cosciales +2",	setList = { { job = "RUN", sets = { "DT", "Fastcast" } } },
			priority = 45 },
		{ name = "Carmine Cuisses +1",	setList = { { job = "RUN", sets = { "Requiescat", "Movement", "EnhancingAny" } } },
			priority = 50 },
		{ name = "Eri. Leg Guards +1",	setList = { { job = "RUN", sets = { "PDT", "Emnity" } } },
			priority = 80 },
		{ name = "Futhark Trousers +1",	setList = { { job = "RUN", sets = { "Valiance", "FastcastEnhancing" } } },
			priority = 87 },
		{ name = "Herculean Trousers",	setList = { { job = "RUN", sets = { "Dimidiation", "Savage Blade" } },
													{ job = "THF", sets = { "Rudra's Storm", "Savage Blade", "Requiescat" } },
													{ job = "NIN", sets = { "Hybrid" } },
													},
			priority = 38 },
		{ name = "Meg. Chausses +2",	setList = { { job = "RUN", sets = { "Hybrid", "Resolution" } },
													{ job = "THF", sets = { "Hybrid" } },
													{ job = "RNG", sets = { "Hybrid", "Midshot" } },
													},
			priority = 35 },
		{ name = "Pill. Culottes +2",	setList = { { job = "THF", sets = { "Evisceration" } } } },
		{ name = "Arc. Braccae +1",	 	setList = { { job = "RNG", sets = { "Flurry2" } } } },
		-- { name = "Plunderer Culottes +2",	setList = { { job = "THF", sets = { "Rudra's Storm", "Savage Blade", "Requeiescat" } } } },
	},
	feet = {
		{ name = "Apogee Pumps +1",		setList = { { job = "SMN", sets = { "Idle", "BPDmg" } } },
			priority = -90 },
		{ name = "Herald's Gaiters",	setList = { { job = "SMN", sets = { "Movement" } } } },
		{ name = "Glyph. Pigaches +1", 	setList = { { job = "SMN", sets = { "PrecastBP" } } },
			priority = 9 },
		-- { name = "Baayami Sabots +1", 	setList = { { job = "SMN", sets = { "PrecastBP", "SmnSkill" } } } }, -- 30mil gil :(
		{ name = "Azimuth Gaiters +1", 	setList = { { job = "GEO", sets = { "CombatIdleDT", "Geomancy" } } } },
		{ name = "Geo. Sandals +3", 	setList = { { job = "GEO", sets = { "IdleRefresh", "MACC" } } } },
		{ name = "Regal Pumps +1", 		setList = { { job = "GEO", sets = { "Fastcast", "Healing" } },
													{ job = "SMN", sets = { "Fastcast" } },
													},
			priority = 13 },
		{ name = "Jhakri Pigaches +1", 	setList = { { job = "GEO", sets = { "Elemental" } } } },
		{ name = "Bagua Sandals +1", 	setList = { { job = "GEO", sets = { "Radial Arcana" } } } },
		{ name = "Aya. Gambieras +1",	setList = { { job = "RUN", sets = { "DT" } } },
			priority = 11 },
		{ name = "Carmine Greaves +1",	setList = { { job = "RUN", sets = { "Fastcast" } } },
			priority = 15 },
		{ name = "Erilaz Greaves +1",	setList = { { job = "RUN", sets = { "PDT", "Emnity" } } },
			priority = 18 },
		{ name = "Herculean Boots",		setList = { { job = "RUN", sets = { "Hybrid", "Lunge", "Requiescat" } },
													{ job = "THF", sets = { "Aeolian Edge", "Requiescat" } },
													{ job = "NIN", sets = { "MagicAtk", "STR_WS", "DEX_WS" } },
													{ job = "RNG", sets = { "MagicAtk" } },
													},
			priority = 9 },
		{ name = "Lustra. Leggings +1",	setList = { { job = "RUN", sets = { "Dimidiation", "Resolution", "Savage Blade" } },
													{ job = "THF", sets = { "Rudra's Storm", "Savage Blade",  } }
													},
			priority = 12 },
		{ name = "Skulk. Poulaines +1", setList = { { job = "THF", sets = { "TH" } } } },
		{ name = "Malignance Boots", 	setList = { { job = "THF", sets = { "Hybrid" } },
													{ job = "NIN", sets = { "Hybrid" } },
													{ job = "RNG", sets = { "Hybrid", "Midshot" } },
													} },
		{ name = "Mummu Gamash. +2", 	setList = { { job = "THF", sets = { "Evisceration" } } } },
		{ name = "Jute Boots +1", 		setList = { { job = "THF", sets = { "Movement" } },
													{ job = "RNG", sets = { "Movement" } }
													} },
		{ name = "Hachi. Kyahan +1", 	setList = { { job = "NIN", sets = { "Movement" } } } },
		{ name = "Meg. Jam. +2", 		setList = { { job = "RNG", sets = { "Flurry2" } } } },
	}
}