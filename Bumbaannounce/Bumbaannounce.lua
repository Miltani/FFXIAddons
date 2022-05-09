_addon.name     = 'Bumbannounce'
_addon.author   = 'Kenshi, Dabidobido'
_addon.version  = '1.1.3'
_addon.command  = 'bumba'

require('logger')
require('chat')
require('tables')
packets = require('packets')
local chat_helper = require('ChatHelper')
local Debug = false
local party_chat = true

local animation_map = {
    [2618] = {element = 'Fire':color(39), icon = string.char(0xEF, 0x1F), Param = 4281},
    [2619] = {element = 'Water':color(219), icon = string.char(0xEF, 0x24), Param = 4286},
    [2620] = {element = 'Wind':color(158), icon = string.char(0xEF, 0x21), Param = 4283},
    [2621] = {element = 'Earth':color(63), icon = string.char(0xEF, 0x22), Param = 4284},
    [2622] = {element = 'Thunder':color(15), icon = string.char(0xEF, 0x23), Param = 4285},
    [2623] = {element = 'Ice':color(5), icon = string.char(0xEF, 0x20), Param = 4282},
    [2624] = {element = 'Light':color(1), icon = string.char(0xEF, 0x25), Param = 4287},
    [2625] = {element = 'Dark':color(160), icon = string.char(0xEF, 0x26), Param = 4288},
}

local proc_map = {
    [1806] = 'Red':color(38)..' proc',
    [1807] = 'Green':color(258)..' proc',
    [1808] = 'Blue':color(219)..' proc',
    [1946] = 'White':color(1).. ' proc'
}

local models = S{2501,2506,2511,2516,2581,2586,2636}
local zone

windower.register_event('load', 'login', function()
    if not windower.ffxi.get_player() then return end
    zone = windower.ffxi.get_info().zone
end)

local chest_glow = false
windower.register_event('incoming chunk', function(id, data)
    if id == 0x028 then
        if zone == 298 or zone == 279 then
            local packet = packets.parse('incoming', data)
            local Bumba = windower.ffxi.get_mob_by_name('Bumba')
            if Bumba and Bumba.id == packet.Actor and packet.Category == 11 and packet['Target 1 Action 1 Message'] == 0 then
                local animation = packet['Target 1 Action 1 Animation']
                if animation_map[animation] then
                    if animation_map[animation].Param == packet.Param then
						if party_chat then
							chat_helper.add_line("/p Bumba is now absorbing: " ..animation_map[animation].element)
						else
							windower.add_to_chat(200, 'Bumba is now absorbing: '..animation_map[animation].element..' '..animation_map[animation].icon)
						end
                    elseif Debug then
                        windower.add_to_chat(200, 'Param: '..packet['Param']..', Animnation: '..packet['Target 1 Action 1 Animation'])
                    end
                end
            end
        end
    elseif id == 0x00E then
        if zone == 298 or zone == 279 then
            local packet = packets.parse('incoming', data)
            --local Bumba = windower.ffxi.get_mob_by_name('Bumba')
            if bit.band(packet.Mask, 4) == 4 and models:contains(packet.Model) then
                if bit.band(packet._unknown4, 65536) == 65536 and not chest_glow then
                    chest_glow = true
                    if packet.Model == 2636 then
						if party_chat then
						else
							windower.add_to_chat(200, 'Bumba chest is glowing.')
						end
                    else
						if party_chat then
						else
							windower.add_to_chat(200, windower.ffxi.get_mob_by_index(packet.Index).name..' aura is up. Proc it!')
						end
                    end
                elseif bit.band(packet._unknown4, 65536) == 0 and chest_glow then
                    chest_glow = false
                    if packet.Model == 2636 then
						if party_chat then
						else
							windower.add_to_chat(200, 'Bumba chest glow faded away: Proc it!')
						end
                    else
						if party_chat then
						else
							windower.add_to_chat(200, windower.ffxi.get_mob_by_index(packet.Index).name..' aura is off.')
						end
                    end
                end
            end
        end
    elseif id == 0x03A then
        if zone == 298 or zone == 279 then
            local packet = packets.parse('incoming', data)
            local Actor = windower.ffxi.get_mob_by_index(packet['Actor Index'])
            if packet['Animation type'] == 9 and proc_map[packet['Animation ID']] then
				if party_chat then
				else
					windower.add_to_chat(200, proc_map[packet['Animation ID']]..' done on '..Actor.name..'!')
				end
            end
        end
    elseif id == 0x00A then
        local packet = packets.parse('incoming', data)
        zone = packet.Zone
        chest_glow = false
    end
end)

windower.register_event('addon command', function(command)
    if command:lower() == 'debug' then
        Debug = not Debug
        log('Debug mode set to '..tostring(Debug))
	elseif command:lower() == "partychat" then
		party_chat = not party_chat
		if party_chat then chat_helper.PrintMode = 4
		else chat_helper.PrintMode = -1
		end
		log('Party Chat set to '..tostring(party_chat))
    end
end)

windower.register_event('prerender', function()
	chat_helper.print_lines()
end)