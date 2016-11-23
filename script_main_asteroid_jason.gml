/*
argument0: instance id
*/

with(argument0)
{  
    // collision logic with another asteroid, reverse direction and increase speed
    colAsteroid = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, object_asteroid_big_jason, false, true);
    if (colAsteroid != noone)
            colAsteroid.speed *= -ASTEROID_SPEED_MULTIPLIER;
}
