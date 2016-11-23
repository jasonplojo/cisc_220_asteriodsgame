with(object_ship_jason)
{
    // Max Speed cap
    if (speed >= PLAYER_MAX_SPEED)
        speed = PLAYER_MAX_SPEED;
    
    // Min speed cap
    if (speed <= PLAYER_MIN_SPEED)
        speed = PLAYER_MIN_SPEED;
    
    // Prevent cool down timer going to negative
    if (laserCoolDown <= 0)
        laserCoolDown = 0;
    else
        laserCoolDown -= 1;
        
    // Prevent no damage cool down timer going to negative
    if (noDamageCoolDown <= 0)
        noDamageCoolDown = 0;
    else
        noDamageCoolDown -= 1;
        
    // get offset in terms of x and y
    xLaserOffset = lengthdir_x(LASER_OFFSET, direction);
    yLaserOffset = lengthdir_y(LASER_OFFSET, direction);

    // Collision logic with big asteroid
    collisionId = collision_ellipse(bbox_left, bbox_top, bbox_right, bbox_bottom, object_asteroid_big_jason, false, true);
    if (collisionId != noone)
    {
        if (noDamageCoolDown <= 0)
        {
            collisionId.speed *= -ASTEROID_SPEED_MULTIPLIER;  
            
            health -= 1;
            score -= 50;
            noDamageCoolDown = NO_DAMAGE_COOL_DOWN;
            
            audio_play_sound(sound_asteroid_collision_jason, 0, false);
        }
    }
    
    // Collision logic with medium asteroid
    collisionId = collision_ellipse(bbox_left, bbox_top, bbox_right, bbox_bottom, object_asteroid_medium_jason, false, true);
    if (collisionId != noone)
    {
        if (noDamageCoolDown <= 0)
        {
            collisionId.speed *= -ASTEROID_SPEED_MULTIPLIER;  
            
            health -= 0.50;
            score -= 50;
            noDamageCoolDown = NO_DAMAGE_COOL_DOWN;
            
            audio_play_sound(sound_asteroid_collision_jason, 0, false);
        }
    }
    
    // Collision logic with small asteroid
    collisionId = collision_ellipse(bbox_left, bbox_top, bbox_right, bbox_bottom, object_asteroid_small_jason, false, true);
    if (collisionId != noone)
    {
        if (noDamageCoolDown <= 0)
        {
            collisionId.speed *= -ASTEROID_SPEED_MULTIPLIER;  
            
            health -= 0.25;
            score -= 50;
            
            noDamageCoolDown = NO_DAMAGE_COOL_DOWN;
            
            audio_play_sound(sound_asteroid_collision_jason, 0, false);
        }
    }
    
    // Collision logic with fireball
    collisionId = collision_ellipse(bbox_left, bbox_top, bbox_right, bbox_bottom, object_fireball_jason, false, true);
    if (collisionId != noone)
    {
        if (noDamageCoolDown <= 0)
        {
            health -= 2;
            score -= 100;
            
            noDamageCoolDown = NO_DAMAGE_COOL_DOWN;
            
            collisionId.fireballHealth = 0;
            
            audio_play_sound(sound_fireball_destroy_jason, 0, false);
        }
    }
    
    // screen wrap logic
    if (x > room_width + (sprite_width / 2))
        x = -(sprite_width / 2);
    if (x < -(sprite_width / 2))
        x = room_width + (sprite_width / 2);
    if (y > room_height + (sprite_height / 2))
        y = -(sprite_height / 2);
    if (y < -(sprite_height / 2))
        y = room_height + (sprite_height / 2)
    
    if (!audio_is_playing(sound_ship_engine_jason))
        shipEngineSound = audio_play_sound(sound_ship_engine_jason, 0, true);
    
    audio_sound_pitch(shipEngineSound, speed / PLAYER_MAX_SPEED);
    
    // audio system
    audio_listener_position(x, y, 1);
    
    // health logic
    if (health <= 0)
    {
        // create explosion particle effects
        part_type_size(object_gameloop_jason.particleExplosion, 1, 1, 0.1, 0);
        part_particles_create_color(object_gameloop_jason.gameParticle, x, y, object_gameloop_jason.particleExplosion, c_blue, 1);
            
        part_type_size(object_gameloop_jason.particleExplosion, 1 / 2, 1 / 2, 0.1, 0);
        part_particles_create_color(object_gameloop_jason.gameParticle, x, y, object_gameloop_jason.particleExplosion, c_aqua, 1);
                
    
        // stop engine sound, play explosion
        audio_play_sound(sound_ship_destroy_jason, 0, false);
        audio_stop_sound(sound_ship_engine_jason);
        
        instance_destroy();
    }
}
