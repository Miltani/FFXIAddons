_addon.name = 'Mandragora Mania Madness Bot'
_addon.author = 'Dabidobido'
_addon.version = '1.0.0'
_addon.commands = {'mmmbot'}

packets = require('packets')
require('logger')
socket = require('socket')

debugging = false

npc_ids = 
{
	[235] = { npc_id = 17740023, menu_id = 690, game_menu_id = 692 } -- Bastok Mines
}

delay_between_keypress = 0.5
delay_between_key_down_and_up = 0.1

option_indexes =
{
	[1] = 3,
	[2] = 515,
	[3] = 1027,
	[4] = 1539,
	[5] = 2051,
	[6] = 2563,
	[7] = 3075,
	[8] = 3587,
	[9] = 4099,
	[10] = 4611,
	[11] = 5123,
	[12] = 5635,
	[13] = 6147,
	[14] = 6659,
	[15] = 7171,
	[16] = 7683,
}

quit_option_index = 5

zone = nil -- get zone from the incoming and use it for outgoing

game_state = 0 -- 0 = init, 1 = started, 2 = finished
player_turn = false -- it's random who goes first
game_board = { -- 0 = empty, 1 = player, 10 = enemy
	[1] = 0,
	[2] = 0,
	[3] = 0,
	[4] = 0,
	[5] = 0,
	[6] = 0,
	[7] = 0,
	[8] = 0,
	[9] = 0,
	[10] = 0,
	[11] = 0,
	[12] = 0,
	[13] = 0,
	[14] = 0,
	[15] = 0,
	[16] = 0,
}
coroutines = {}
current_zone_id = 0
navigation_finished = false
started = false
game_started_time = 0
go_first = nil
rounds = 1
last_board_update = 0
opponent_move_time = 0
player_action_started = false

windower.register_event('addon command', function(...)
	local args = {...}
	if args[1] == "debug" then
		if debugging then 
			debugging = false
			notice("Debug output off")
		else
			debugging = true
			notice("Debug output on")
		end
	elseif args[1] == "start" then
		started = true
		math.randomseed(os.time())
		notice("Started")
	elseif args[1] == "stop" then
		started = false
		game_state = 2
		reset_state()
		notice("Stopping.")
		reset_key_coroutine_and_state()
	elseif args[1] == "setdelay" and args[2] and args[3] then
		local number = tonumber(args[3])
		if number then
			if args[2] == "keypress" then
				delay_between_keypress = number
				notice("Delay Between Keypress:" .. delay_between_keypress)
			elseif args[2] == "keydownup" then
				delay_between_key_down_and_up = number
				notice("Delay Between Key Down and Up:" .. delay_between_key_down_and_up)
			end
		end
	elseif args[1] == "debugprint" then
		notice(tostring(started) .. "," .. tostring(game_state) .. "," .. tostring(#coroutines) .. "," .. tostring(player_turn) .. "," .. tostring(os.time()) .. "," .. tostring(last_board_update) .. "," .. tostring(opponent_move_time) )
	elseif args[1] == "help" then
		notice("//mmmbot start <number_of_jingly_to_get>: Starts automating until you get the amount of jingly specified. 300 is default. Set to 0 automate until you tell it to stop.")
		notice("//mmmbot stop: Stops automation")
		notice("//mmmbot setdelay <keypress / keydownup / ack / waitforack> <number>: Configures the delay for the various events")
		notice("//mmmbot debug: Toggles debug output")
	end
end)

windower.register_event('incoming chunk', function(id, data)
	if id == 0x34 then
		local p = packets.parse('incoming',data)
		if p then
			current_zone_id = p['Zone']
			if npc_ids[current_zone_id] then 
				if p['NPC'] == npc_ids[current_zone_id].npc_id then
					if debugging then notice("Got menu packet menu id " .. p['Menu ID']) end
					if game_state == 1 then game_state = 2 end
					if game_state == 0 or game_state == 2 then
						if p['Menu ID'] == npc_ids[current_zone_id].game_menu_id then
							if debugging then notice("Game State Start") end
							game_state = 1
							reset_state()
							game_started_time = os.time()
						elseif p['Menu ID'] == npc_ids[current_zone_id].menu_id and started and game_state == 2 then
							go_first = nil
							reset_key_coroutine_and_state()
							navigate_to_menu_option(1, 3, true)
						end
					end
				end
			elseif debugging then
				notice("Couldn't find zone_id defined in npc_ids " .. current_zone_id)
			end
		end
	elseif id == 0x02A then
		if npc_ids[current_zone_id] then
			local p = packets.parse('incoming',data)
			if p then
				if p["Player"] == npc_ids[current_zone_id].npc_id then
					if p["Param 2"] > 0 then -- round ended
						reset_state()
						game_started_time = os.time()
					end
				end
			end
		end
	end
end)

function reset_state()
	if debugging then notice("reset_state") end
	player_turn = false
	game_board = {
	[1] = 0,
	[2] = 0,
	[3] = 0,
	[4] = 0,
	[5] = 0,
	[6] = 0,
	[7] = 0,
	[8] = 0,
	[9] = 0,
	[10] = 0,
	[11] = 0,
	[12] = 0,
	[13] = 0,
	[14] = 0,
	[15] = 0,
	[16] = 0,
	}
	navigation_finished = false
	last_board_update = 0
	opponent_move_time = 0
end

windower.register_event('outgoing chunk', function(id, original, modified, injected, blocked)
	if injected or blocked then return end
	if id == 0x5b then
		local p = packets.parse("outgoing", original)
		if p then
			if npc_ids[current_zone_id] then
				if p['Menu ID'] == npc_ids[current_zone_id].game_menu_id and started then
					navigation_finished = false
					if p['Option Index'] == 5 then -- quit
						reset_state()
						game_state = 0
					else
						for k,v in pairs(option_indexes) do
							if v == p['Option Index'] then
								update_game_board(k)
							end
						end
					end
				end
			end
		end
	end
end)

function do_player_turn()
	if game_state ~= 1 or not player_turn then return end
	player_action_started = true
	local row_1 = game_board[1] + game_board[2] + game_board[3] + game_board[4]
	local row_2 = game_board[5] + game_board[6] + game_board[7] + game_board[8]
	local row_3 = game_board[9] + game_board[10] + game_board[11] + game_board[12]
	local row_4 = game_board[13] + game_board[14] + game_board[15] + game_board[16]
	local column_1 = game_board[1] + game_board[5] + game_board[9] + game_board[13]
	local column_2 = game_board[2] + game_board[6] + game_board[10] + game_board[14]
	local column_3 = game_board[3] + game_board[7] + game_board[11] + game_board[15]
	local column_4 = game_board[4] + game_board[8] + game_board[12] + game_board[16]
	local row_4 = game_board[13] + game_board[14] + game_board[15] + game_board[16]
	local right_diag = game_board[1] + game_board[6] + game_board[11] + game_board[16]
	local left_diag = game_board[4] + game_board[7] + game_board[10] + game_board[13]
	local selected_option = false
	-- win simple 
	if row_1 == 3 or row_1 == 12 then
		fill_empty(1,2,3,4)
		selected_option = true
	elseif column_1 == 3 or column_1 == 12 then
		fill_empty(1,5,9,13)
		selected_option = true
	elseif column_4 == 3 or column_4 == 12 then
		fill_empty(4,8,12,16)
		selected_option = true
	elseif row_4 == 3 or row_4 == 12 then
		fill_empty(13,14,15,16)
		selected_option = true
	elseif right_diag == 3 or right_diag == 12 then
		fill_empty(1,6,11,16)
		selected_option = true
	elseif left_diag == 3 or left_diag == 12 then
		fill_empty(4,7,10,13)
		selected_option = true
	end
	if not selected_option then
		-- block enemy
		if row_1 == 30 then
			fill_empty(1,2,3,4)
			selected_option = true
		elseif row_2 == 30 then
			fill_empty(5,6,7,8)
			selected_option = true
		elseif row_3 == 30 then
			fill_empty(9,10,11,12)
			selected_option = true
		elseif row_4 == 30 then
			fill_empty(13,14,15,16)
			selected_option = true
		elseif column_1 == 30 then
			fill_empty(1,5,9,13)
			selected_option = true
		elseif column_2 == 30 then
			fill_empty(2,6,10,14)
			selected_option = true
		elseif column_3 == 30 then
			fill_empty(3,7,11,15)
			selected_option = true
		elseif column_4 == 30 then
			fill_empty(4,8,12,16)
			selected_option = true
		elseif right_diag == 30 then
			fill_empty(1,6,11,16)
			selected_option = true
		elseif left_diag == 30 then
			fill_empty(4,7,10,13)
			selected_option = true
		end
		if not selected_option then 
			-- get corners
			if game_board[1] == 0 then 
				navigate_to_menu_option(1)
				selected_option = true
			elseif game_board[4] == 0 then 
				navigate_to_menu_option(4)
				selected_option = true
			elseif game_board[13] == 0 then 
				navigate_to_menu_option(13)
				selected_option = true
			elseif game_board[16] == 0 then 
				navigate_to_menu_option(16)
				selected_option = true
			end
		end
		if not selected_option then
			-- fill up row or diagonal
			if not selected_option and right_diag == 2 then selected_option = set_line_to_3(1,6,11,16) end
			if not selected_option and left_diag == 2 then selected_option = set_line_to_3(4,7,10,13) end
			if not selected_option and row_1 == 2 then selected_option = set_line_to_3(1,2,3,4) end
			if not selected_option and column_1 == 2 then selected_option = set_line_to_3(1,5,9,13) end
			if not selected_option and column_4 == 2 then selected_option = set_line_to_3(4,8,12,16) end
			if not selected_option and row_4 == 2 then selected_option = set_line_to_3(13,14,15,16) end
			
			-- just get random
			if not selected_option then
				local free_areas = {}
				for k,v in pairs(game_board) do
					if v == 0 then 
						table.insert(free_areas, #free_areas+1, k)
					end
				end
				for i = #free_areas, 2, -1 do
					local j = math.random(i)
					free_areas[i], free_areas[j] = free_areas[j], free_areas[i]
				end
				for k,v in pairs(free_areas) do
					selected_option = fill_without_bust(v)
					if selected_option then break end
				end
				if not selected_option then
					-- probably lose now
					navigate_to_menu_option(free_areas[math.random(#free_areas)])
				end
			end
		end
	end
end

function fill_empty(area1, area2, area3, area4)
	if game_board[area1] == 0 then navigate_to_menu_option(area1)
	elseif game_board[area2] == 0 then navigate_to_menu_option(area2)
	elseif game_board[area3] == 0 then navigate_to_menu_option(area3)
	elseif game_board[area4] == 0 then navigate_to_menu_option(area4)
	end
end

-- 4 areas should be in a line
function set_line_to_3(area1, area2, area3, area4)
	if game_board[area1] == 1 and game_board[area4] == 1 then 
		if game_board[area2] == 0 then 
			navigate_to_menu_option(area2)
			return true
		elseif game_board[area3] == 0 then 
			navigate_to_menu_option(area3)
			return true
		end
	end
end

function fill_without_bust(area)
	local no_bust = false
	if area == 2 then 
		if (game_board[1] ~= 1 or game_board[3] ~= 1)
		and (game_board[6] ~= 1 or game_board[10] ~= 1)
		and (game_board[7] ~= 1 or game_board[12] ~= 1)
		then no_bust = true end
	elseif area == 3 then
		if (game_board[2] ~= 1 or game_board[4] ~= 1)
		and (game_board[7] ~= 1 or game_board[11] ~= 1)
		and (game_board[6] ~= 1 or game_board[9] ~= 1)
		then no_bust = true end
	elseif area == 5 then
		if (game_board[1] ~= 1 or game_board[9] ~= 1)
		and (game_board[6] ~= 1 or game_board[7] ~= 1)
		and (game_board[10] ~= 1 or game_board[15] ~= 1)
		then no_bust = true end
	elseif area == 9 then
		if (game_board[5] ~= 1 or game_board[13] ~= 1)
		and (game_board[10] ~= 1 or game_board[11] ~= 1)
		and (game_board[6] ~= 1 or game_board[3] ~= 1)
		then no_bust = true end
	elseif area == 8 then
		if (game_board[4] ~= 1 or game_board[12] ~= 1)
		and (game_board[6] ~= 1 or game_board[7] ~= 1)
		and (game_board[11] ~= 1 or game_board[14] ~= 1)
		then no_bust = true end
	elseif area == 12 then
		if (game_board[12] ~= 1 or game_board[16] ~= 1)
		and (game_board[10] ~= 1 or game_board[11] ~= 1)
		and (game_board[7] ~= 1 or game_board[2] ~= 1)
		then no_bust = true end
	elseif area == 14 then
		if (game_board[13] ~= 1 or game_board[15] ~= 1)
		and (game_board[10] ~= 1 or game_board[6] ~= 1)
		and (game_board[11] ~= 1 or game_board[8] ~= 1)
		then no_bust = true end
	elseif area == 15 then
		if (game_board[14] ~= 1 or game_board[16] ~= 1)
		and (game_board[11] ~= 1 or game_board[7] ~= 1)
		and (game_board[10] ~= 1 or game_board[5] ~= 1)
		then no_bust = true end
	elseif area == 6 then
		if (game_board[2] ~= 1 or game_board[10] ~= 1)
		and (game_board[5] ~= 1 or game_board[7] ~= 1)
		and (game_board[1] ~= 1 or game_board[11] ~= 1)
		and (game_board[3] ~= 1 or game_board[9] ~= 1)
		and (game_board[10] ~= 1 or game_board[14] ~= 1)
		and (game_board[7] ~= 1 or game_board[8] ~= 1)
		then no_bust = true end
	elseif area == 11 then
		if (game_board[7] ~= 1 or game_board[15] ~= 1)
		and (game_board[10] ~= 1 or game_board[11] ~= 1)
		and (game_board[6] ~= 1 or game_board[16] ~= 1)
		and (game_board[14] ~= 1 or game_board[8] ~= 1)
		and (game_board[3] ~= 1 or game_board[7] ~= 1)
		and (game_board[9] ~= 1 or game_board[10] ~= 1)
		then no_bust = true end
	elseif area == 7 then
		if (game_board[3] ~= 1 or game_board[11] ~= 1)
		and (game_board[6] ~= 1 or game_board[8] ~= 1)
		and (game_board[4] ~= 1 or game_board[10] ~= 1)
		and (game_board[2] ~= 1 or game_board[12] ~= 1)
		and (game_board[11] ~= 1 or game_board[15] ~= 1)
		and (game_board[5] ~= 1 or game_board[6] ~= 1)
		then no_bust = true end
	elseif area == 10 then
		if (game_board[6] ~= 1 or game_board[14] ~= 1)
		and (game_board[9] ~= 1 or game_board[11] ~= 1)
		and (game_board[5] ~= 1 or game_board[15] ~= 1)
		and (game_board[7] ~= 1 or game_board[13] ~= 1)
		and (game_board[2] ~= 1 or game_board[6] ~= 1)
		and (game_board[11] ~= 1 or game_board[12] ~= 1)
		then no_bust = true end
	end
	if no_bust then navigate_to_menu_option(area) end
	return no_bust
end

function update_game_board(area_selected)
	last_board_update = os.time()
	if not player_turn then
		game_board[area_selected] = 10
		player_turn = true
		if debugging then notice("Opponent selected Area " .. area_selected) end
		if go_first == nil then go_first = "Opp" end
		opponent_move_time = last_board_update
		game_started_time = 0
	else 
		game_board[area_selected] = 1
		player_turn = false
		if debugging then notice("Player selected Area " .. area_selected) end
		player_action_started = false
	end
end

function set_key_down_down()
	windower.send_command('setkey down down')
end

function set_key_down_up()
	windower.send_command('setkey down up')
end

function set_key_enter_down()
	windower.send_command('setkey enter down')
end

function set_key_enter_up(from_reset)
	windower.send_command('setkey enter up')
	if not from_reset then
		navigation_finished = true
	end
end

function set_key_left_down()
	windower.send_command('setkey left down')
end

function set_key_left_up()
	windower.send_command('setkey left up')
end

function navigate_to_menu_option(option_index, override_delay, from_main_menu)
	reset_key_coroutine_and_state()
	if debugging then notice("Navigate to " .. option_index) end
	if not from_main_menu then navigation_finished = false end
	local next_delay = 1
	if override_delay then next_delay = override_delay end
	local times_to_press_down = option_index - 1
	if times_to_press_down >= 1 then 
		for i = 1, times_to_press_down, 1 do
			table.insert(coroutines, coroutine.schedule(set_key_down_down, next_delay))
			table.insert(coroutines, coroutine.schedule(set_key_down_up, next_delay + delay_between_key_down_and_up))
			next_delay = next_delay + delay_between_keypress 
		end	
	end
	table.insert(coroutines, coroutine.schedule(set_key_enter_down, next_delay))
	table.insert(coroutines, coroutine.schedule(set_key_enter_up, next_delay + delay_between_key_down_and_up))	
end

function reset_key_coroutine_and_state()
	for k, v in pairs(coroutines) do
		coroutine.close(v)
	end
	coroutines = {}
	set_key_enter_up(true)
	set_key_down_up()
	navigation_finished = false
end

function update_loop()
	if started and game_state == 1 and not player_action_started then
		local time_now = os.time()
		if game_started_time > 0 and time_now - game_started_time > 20 then
			game_started_time = 0
			player_turn = true
			go_first = "Player"
			do_player_turn()
		elseif game_started_time == 0 and time_now - last_board_update > 20 then
			player_turn = true
			do_player_turn()
		elseif game_started_time == 0 and player_turn and opponent_move_time > 0 and time_now - opponent_move_time > 2 then
			do_player_turn()
		end
	end
end

windower.register_event('prerender', update_loop)

windower.register_event('logout', function()
	reset_key_coroutine_and_state()
	reset_state()
end)