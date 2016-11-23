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
        
    // audio system
    if (!audio_is_playing(warningAsteroidSound))
        warningAsteroidSound = audio_play_sound_on(warningSound, sound_ship_warning_jason, true, 0);
        
    audio_emitter_position(warningSound, x, y, 0);
    
    // asteroid destroy logic
    if (asteroidHealth <= 0)
    {    
            // create explosion particle effects
        part_type_size(object_gameloop_jason.particleExplosion, 1 / 4, 1 / 4, 0.1, 0);
        part_particles_create_color(object_gameloop_jason.gameParticle, x, y, object_gameloop_jason.particleExplosion, c_red, 1);
        
        part_type_size(object_gameloop_jason.particleExplosion, 0.025 , 0.025, 0.05, 0);
        part_particles_create_color(object_gameloop_jason.gameParticle, x, y, object_gameloop_jason.particleExplosion, c_yellow, 1);
        
        // play sound, destroy instance
        audio_play_sound(sound_asteroid_destroy_jason, 0, false);
        audio_stop_sound(warningAsteroidSound);
        audio_emitter_free(warningSound);
        instance_destroy();
    }
            
    // no damage cooldown logic
    if (noDamageCoolDown <= 0)
        noDamageCoolDown = 0;
    else
        noDamageCoolDown -= 1;
}
