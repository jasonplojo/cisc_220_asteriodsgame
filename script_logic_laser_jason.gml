/*
argument0: instance id
argument1: direction of ship at moment of shooting
*/

with(argument0)
{
    speed = LASER_SPEED;
    direction = argument1;
    
    if (x > room_width || x < 0 || y > room_height || y < 0)
        instance_destroy();
} 
