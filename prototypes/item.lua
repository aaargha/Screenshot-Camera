data:extend({

 {
    type = "selection-tool",
    name = "ScreenshotCamera",
    icon = "__SC_camera__/graphics/icon_camera.png",
	icon_size = 32,
    flags = { "goes-to-quickbar" },
    subgroup = "tool",
    stack_size= 1,
	selection_mode = {"tiles"},
	selection_cursor_box_type = "pair",
	selection_color = {r = 0.7, g = 0, b = 0.7},
	alt_selection_mode = {"tiles"},
	alt_selection_color = {r = 0.7, g = 7, b = 0},
	alt_selection_cursor_box_type = "pair"
  }

})