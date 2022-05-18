function navigation_helper()
	local self = {
		target_menu_option = 0,
		delay_between_keypress = 0.5,
		delay_between_key_down_and_up = 0.1,
	}
	
	local current_menu_option = 1
	local last_action_time = nil
	local next_action_type = ""
	local next_action_time = 0
	local next_action = ""
	
	function self.navigate_to_menu_option(option, override_delay, starting_position)
		current_menu_option = starting_position or 1
		self.target_menu_option = option
		local delay = override_delay or 0
		last_action_time = os.time() + delay
		self.set_next_action()
	end
	
	function self.set_next_action()
		if current_menu_option < self.target_menu_option then
			if next_action_type == "" or next_action_type == "up" then
				next_action_type = "down"
				next_action_time = last_action_time + self.delay_between_keypress
				if self.target_menu_option - current_menu_option >= 3 then
					next_action = 'right'
				else
					next_action = 'down'
				end
			else
				next_action_type = 'up'
				next_action_time = last_action_time + self.delay_between_key_down_and_up
			end
		elseif current_menu_option == self.target_menu_option then
			if next_action_type == "" or next_action_type == "up" then 
				next_action = 'enter'
				next_action_type = 'down'
				next_action_time = last_action_time + self.delay_between_key_down_and_up
			else
				next_action_type = 'up'
				next_action_time = last_action_time + self.delay_between_key_down_and_up
			end
		end
	end
	
	function self.update(time_now)
		if next_action_time <= time_now then
			local command = "setkey " .. next_action .. " " .. next_action_type
			if next_action_type == 'up' then
				if next_action == 'enter' then self.target_menu_option = 0
				elseif next_action == 'right' then current_menu_option = current_menu_option + 3
				elseif next_action == 'down' then current_menu_option = current_menu_option + 1
				end
			end
			windower.send_command(command)
			if self.target_menu_option > 0 then self.set_next_action() end
		end
	end
	
	return self
end