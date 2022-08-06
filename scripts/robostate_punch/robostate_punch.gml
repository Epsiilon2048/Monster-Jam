
function robostate_punch_initialize(robo){ with robo {

sprite_index = spr_robo_green_punch
image_index = 0
emission_color = EMISSION_COLOR
robo_toggle_flashlight(true)

light_color = EMISSION_COLOR
light_size = 1000
light_fov = 80

play_sound_for_player(player.player_id, snd_punch, 2, false)
play_sound_for_player(player.player_id, snd_punch2, 2, false)

robo_punch_collision()
}}


function robostate_punch_input(robo){ with robo {

robo_get_input()
}}


function robostate_punch_step(robo){ with robo {

var lp = image_index/image_number
lp *= lp

emission = 1-lp
light_color = merge_color(EMISSION_COLOR, ROBO_LIGHT_COLOR, lp)
light_size = lerp(1000, ROBO_LIGHT_SIZE, lp)
light_fov = lerp(80, ROBO_LIGHT_FOV, lp)
}}


function robostate_punch_anim_end(robo){ with robo {

emission = 0
light_color = ROBO_LIGHT_COLOR
robo_switch_state(state_stand)
}}