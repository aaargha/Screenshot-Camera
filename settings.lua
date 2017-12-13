data:extend({
   {
      type = "bool-setting",
      name = "SC_camera_gui",
      setting_type = "runtime-per-user",
      default_value = false,
      per_user = true,
   },
   {
      type = "bool-setting",
      name = "SC_camera_aa",
      setting_type = "runtime-per-user",
      default_value = false,
      per_user = true,
   },
   {
      type = "double-setting",
      name = "SC_camera_zoom",
      setting_type = "runtime-per-user",
      default_value = 1,
	  minimum_value = 0,
      per_user = true,
   },
   {
      type = "string-setting",
      name = "SC_camera_regular_path",
      setting_type = "runtime-per-user",
      default_value = "Screenshot-camera/regular.png",
      per_user = true,
   },
   {
      type = "string-setting",
      name = "SC_camera_alt_path",
      setting_type = "runtime-per-user",
      default_value = "Screenshot-camera/alt.png",
      per_user = true,
   }
})