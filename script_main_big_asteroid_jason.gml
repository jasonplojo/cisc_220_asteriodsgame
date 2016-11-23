/*
argument0: instance id
*/

with(argument0)
{
    if (collisionPrevious == false && collisionCurrent == false)
    {  
        // collision logic with big asteroid, reverse direction and increase speed
        collisionId = collision_ellipse(bbox_left, bbox_top, bbox_right, bbox_bottom, object_asteroid_big_jason, false, true);
        if (collisionId != noone)
        {
                speed *= ASTEROID_SPEED_MULTIPLIER;
                direction -= 180;
                
                audio_play_sound(sound_asteroid_collision_jason, 0, false);
                collisionCurrent = true;
        }
                
        // collision logic with medium asteroid, reverse direction and increase speed
        collisionId = collision_ellipse(bbox_left, bbox_top, bbox_right, bbox_bottom, object_asteroid_medium_jason, false, true);
        if (collisionId != noone)
        {
                speed *= ASTEROID_SPEED_MULTIPLIER;
                direction -= 180;
                
                audio_play_sound(sound_asteroid_collision_jason, 0, false);
                collisionCurrent = true;
        }
           
        // collision logic with small asteroid, reverse direction and increase speed
        collisionId = collision_ellipse(bbox_left, bbox_top, bbox_right, bbox_bottom, object_asteroid_small_jason, false, true);
        if (collisionId != noone)
        {
                speed *= ASTEROID_SPEED_MULTIPLIER;
                direction -= 180;
                
                audio_play_sound(sound_asteroid_collision_jason, 0, false);
                collisionCurrent = true;
        }
    }
        
    collisionPrevious = collisionCurrent;
    collisionCurrent = false;
    
    // screen wrap logic
    if (x > room_width + (sprite_width / 2))
        x = -(sprite_width / 2);
    if (x < -(sprite_width / 2))
        x = room_width + (sprite_width / 2);
    if (y > room_height + (sprite_height / 2))
        y = -(sprite_height / 2);
    if (y < -(sprite_height / 2))
        y = room_height + (sprite_height / 2)
    
    // asteroid destroy logic
    if (asteroidHealth <= 0)
        {
            // create medium asteroids
            instance_create(x - ASTEROID_MEDIUM_SPAWN_OFFSET_X, y - ASTEROID_MEDIUM_SPAWN_OFFSET_Y, object_asteroid_medium_jason);
            instance_create(x + ASTEROID_MEDIUM_SPAWN_OFFSET_X, y + ASTEROID_MEDIUM_SPAWN_OFFSET_Y, object_asteroid_medium_jason);
            
            // create explosion particle effects
            part_type_size(object_gameloop_jason.particleExplosion, 1, 1, 0.1, 0);
            part_particles_create_color(object_gameloop_jason.gameParticle, x, y, object_gameloop_jason.particleExplosion, c_red, 1);
            
            part_type_size(object_gameloop_jason.particleExplosion, 1 / 2, 1 / 2, 0.1, 0);
            part_particles_create_color(object_gameloop_jason.gameParticle, x, y, object_gameloop_jason.particleExplosion, c_yellow, 1);
            
            // play sound, destroy instance
            audio_play_sound(sound_asteroid_destroy_jason, 0, false);
            instance_destroy();
        }
}
