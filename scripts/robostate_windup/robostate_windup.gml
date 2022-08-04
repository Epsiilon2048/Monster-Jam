
function robostate_windup_initialize(robo){ with robo {

sprite_index = spr_robo_green_windup
image_index = 0

play_sound_for_player(player.player_id, snd_windup, 2, false)
}}


function robostate_windup_input(robo){ with robo {

robo_get_input()
}}


function robostate_windup_step(robo){ with robo {

var lp = image_index/image_number
emission = lp
light.color = merge_color(LIGHT_COLOR, EMISSION_COLOR, lp)
light.size = lerp(LIGHT_SIZE, 150, lp)
light.fov = lerp(LIGHT_FOV, 190, lp)
}}


function robostate_windup_anim_end(robo){ with robo {

robo_switch_state(state_punch)
}}