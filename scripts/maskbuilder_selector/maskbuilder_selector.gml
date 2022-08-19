
function maskbuilder(){

add_console_element(new_console_dock("Mask builder", [
	new_text_box("Sprite", "obj_maskbuilder.sprite_name"),
	new_cd_button("Clear surface", function(){obj_maskbuilder.clear_surface = true})
]))
}