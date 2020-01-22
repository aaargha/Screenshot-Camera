require "util"

--[[
take_screenshot{player=…, by_player=…, position=…, resolution=…, zoom=…, path=…, show_gui=…, show_entity_info=…, anti_alias=…}

Take a screenshot and save it to a file.

Parameters
Table with the following fields:

    player :: string or LuaPlayer or uint (optional)
    by_player :: string or LuaPlayer or uint (optional): If defined, the screenshot will only be taken for this player.
    position :: Position (optional)
    resolution :: Position (optional): Maximum allowed resolution is 16384x16384 (resp. 8196x8196 when anti_alias is true), but maximum recommended resolution is 4096x4096 (resp. 2048x2048).
    zoom :: double (optional)
    path :: string (optional): Path to save the screenshot in
    show_gui :: boolean (optional): Include game GUI in the screenshot?
    show_entity_info :: boolean (optional): Include entity info (alt-mode)?
    anti_alias :: boolean (optional): Render in double resolution and scale down (including GUI)?

--]]

local function handle_screenshot(event, alt_info)
	local p = game.players[event.player_index]
	local opt = settings.get_player_settings(p)
	local _zoom = opt["SC_camera_zoom"].value
	local _aa = opt["SC_camera_aa"].value
	local _gui = opt["SC_camera_gui"].value
	local _path
	if alt_info then
		_path = opt["SC_camera_alt_path"].value
	else
		_path = opt["SC_camera_regular_path"].value
	end

	local pix_per_tile = 32 * _zoom

	local max_dist = 512 / _zoom
	if _aa then
		max_dist = 256 / _zoom
	end

	local area = event.area
	local diffx = area.right_bottom.x - area.left_top.x
	local diffy = area.right_bottom.y - area.left_top.y
	local res = {x = diffx * pix_per_tile, y = diffy * pix_per_tile}
	local pos = {x = area.left_top.x + diffx / 2, y = area.left_top.y + diffy / 2}

	if res.x < 1 or res.y < 1 then
		return
	end

	if diffx > max_dist then
		p.print("Area too wide, max is " .. max_dist .. " tiles")
		return
	end

	if diffy > max_dist then
		p.print("Area too tall, max is " .. max_dist .. " tiles")
		return
	end
	p.print("Taking screenshot from (" .. area.left_top.x .. "," .. area.left_top.y .. ") to (" .. area.right_bottom.x .. "," .. area.right_bottom.y .. ")")

	game.take_screenshot{player = p, by_player = p, position = pos, resolution = res, zoom=_zoom, path=_path, show_gui=_gui, show_entity_info=alt_info,anti_alias=_aa}

	p.print("Saved file as: " .. _path)
end

script.on_event(defines.events.on_player_selected_area, function (event)
	if event.item == "ScreenshotCamera" then
		handle_screenshot(event, false)
	end
end)

script.on_event(defines.events.on_player_alt_selected_area, function (event)
	if event.item == "ScreenshotCamera" then
		handle_screenshot(event, true)
	end
end)