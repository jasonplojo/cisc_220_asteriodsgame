/*
argument0: instance id
*/

with(argument0)
{
    if (collisionPrevious == false && collisionCurrent == false)
    {
        // fireball collision logic, reverse speed when colliding
        collisionId = collision_ellipse(bbox_left, bbox_top, bbox_right, bbox_bottom, object_fireball_jason, false, true);
        if (collisionId != noone)
        {
            collisionId.speed *= FIREBALL_SPEED_MULTIPLIER;
            collisionId.direction -= 180;
            
            collisionCurrent = true;
        }
        
        // Big asteroid collision logic, destroy the instance of the colliding asteroid and fireball
        collisionId = collision_ellipse(bbox_left, bbox_top, bbox_right, bbox_bottom, object_asteroid_big_jason, false, true);
        if (collisionId != noone)
        {
            collisionId.asteroidHealth = 0;
            audio_play_sound(sound_asteroid_hit_jason, 0, false);
            
            fireballHealth = 0;
            
            collisionCurrent = true;
        }
        
        // Medium asteroid collision logic, destroy the instance of the colliding asteroid and fireball
        collisionId = collision_ellipse(bbox_left, bbox_top, bbox_right, bbox_bottom, object_asteroid_medium_jason, false, true);
        if (collisionId != noone)
        {
            collisionId.asteroidHealth = 0;
            audio_play_sound(sound_asteroid_hit_jason, 0, false);
            
            fireballHealth = 0;
            
            collisionCurrent = true;
        }
        
        // Small asteroid collision logic, destroy the instance of the colliding asteroid and fireball
        collisionId = collision_ellipse(bbox_left, bbox_top, bbox_right, bbox_bottom, object_asteroid_small_jason, false, true);
        if (collisionId != noone)
        {
            collisionId.asteroidHealth = 0;
            audio_play_sound(sound_asteroid_hit_jason, 0, false);
            
            fireballHealth = 0;
            
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
        y = room_height + (sprite_height / 2);
        
    // audio system
    if (!audio_is_playing(fireFlyingSound))
        fireFlyingSound = audio_play_sound_on(fireSound, sound_fireball_flying_jason, true, 0);
        
        audio_emitter_position(fireSound, x, y, 0);
        audio_emitter_falloff(fireSound, 50, 200, 1);
    
    // fireball destroy logic
    if (fireballHealth <= 0)
    {
        // create smoke particle effect
        part_particles_create_color(object_gameloop_jason.gameParticle, x, y, object_gameloop_jason.particleSmoke, c_dkgray, 1);
        
        // play sound and destroy instance
        audio_play_sound(sound_fireball_destroy_jason, 0, false);
        audio_stop_sound(fireFlyingSound);
        audio_emitter_free(fireSound);
        instance_destroy();
    }
    
    // animation logic
    image_angle = direction;
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, c_white, 0);
}
