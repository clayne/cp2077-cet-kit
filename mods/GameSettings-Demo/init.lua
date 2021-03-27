local GameSettings = require('GameSettings')

registerHotkey('ExportSettings', 'Export all settings', function()
	GameSettings.ExportTo('settings.lua')
end)

registerHotkey('SwitchFOV', 'Switch FOV', function()
	local fov = GameSettings.Var('/graphics/basic/FieldOfView')

	fov.value = fov.value + fov.step

	if fov.value > fov.max then
		fov.value = fov.min
	end

	GameSettings.Set('/graphics/basic/FieldOfView', fov.value)
	
	print(('Current FOV: %.1f'):format(GameSettings.Get('/graphics/basic/FieldOfView')))
end)

registerHotkey('SwitchResolution', 'Switch resolution', function()
	-- You can get available options and current selection for lists
	local options, current = GameSettings.Options('/video/display/Resolution')
	local next = current + 1

	if next > #options then
		next = 1
	end

	GameSettings.Set('/video/display/Resolution', options[next])

	if GameSettings.NeedsConfirmation() then
		GameSettings.Confirm()
	end

	print(('Switched resolution from %s to %s'):format(options[current], options[next]))
end)

registerHotkey('ToggleHUD', 'Toggle HUD', function()
	GameSettings.Toggle('/interface/hud/action_buttons')
	GameSettings.Toggle('/interface/hud/activity_log')
	GameSettings.Toggle('/interface/hud/ammo_counter')
	GameSettings.Toggle('/interface/hud/chatters')
	GameSettings.Toggle('/interface/hud/healthbar')
	GameSettings.Toggle('/interface/hud/input_hints')
	GameSettings.Toggle('/interface/hud/johnny_hud')
	GameSettings.Toggle('/interface/hud/minimap')
	GameSettings.Toggle('/interface/hud/npc_healthbar')
	GameSettings.Toggle('/interface/hud/quest_tracker')
	GameSettings.Toggle('/interface/hud/stamina_oxygen')
end)