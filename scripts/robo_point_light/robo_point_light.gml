function robo_point_light(){

var turnSpeed = 30
var accuracy = .95    // Don't want perfect accuracy or perfect inaccuracy

// Test if parameters are valid

// Reverse nomalize accuracy for calculations
accuracy = abs(accuracy - 1.0)

// Get the obj_cursor direction and facing direction
var cursor_dir = point_direction(x, y, input.mx, input.my)
var facingDir = light.dir

// Calculate the difference between obj_cursor direction and facing direction
var facingMinusobj_cursor = facingDir - cursor_dir
var angleDiff = facingMinusobj_cursor
if(abs(facingMinusobj_cursor) > 180)
{
    if(facingDir > cursor_dir)
    {
        angleDiff = -1 * ((360 - facingDir) + cursor_dir)
    }
    else
    {
        angleDiff = (360 - cursor_dir) + facingDir
    }
}

// Gradually rotate object
var prev_dir = direction
direction = light.dir

var dot = abs(angleDiff)/360*turnSpeed

var leastAccurateAim = 30
if(angleDiff > leastAccurateAim * accuracy)
{
    direction -= dot
}
else if(angleDiff < leastAccurateAim * accuracy)
{
    direction += dot
}

light.x = x+lengthdir_x(7, direction)
light.y = y+lengthdir_y(7, direction)
light.dir = direction
direction = prev_dir
}