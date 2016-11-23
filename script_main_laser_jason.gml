/*
argument0: instance id
*/

with(argument0)
{
    // Big asteroid collision logic, destroy the instance of the colliding asteroid if health is 0 and the laser
    collisionId = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, object_asteroid_big_jason, false, true);
    if (collisionId != noone)
    {
        with(collisionId)
        {
            asteroidHealth -= 1;
            
            if (asteroidHealth <= 0)
                score += 100;
            else
                audio_play_sound(sound_asteroid_hit_jason, 0, false);
        }
        
        instance_destroy();
    }
    
    // Medium asteroid collision logic, destory the instance of colliding asteroid if health is 0 and the laser
    collisionId = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, object_asteroid_medium_jason, false, true);
    if (collisionId != noone)
    {
        with(collisionId)
        {
            if (noDamageCoolDown <= 0)
                asteroidHealth -= 1;
                
            if (asteroidHealth <= 0)
                score += 100;
            else
                audio_play_sound(sound_asteroid_hit_jason, 0, false);
        }
        
        instance_destroy();
    }
    
    // Small asteroid collision logic, destory the instance of colliding asteroid if health is 0 and the laser
    collisionId = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, object_asteroid_small_jason, false, true);
    if (collisionId != noone)
    {
        with(collisionId)
        {
            if (noDamageCoolDown <= 0)
                asteroidHealth -= 1;
                
            if (asteroidHealth <= 0)
                score += 100;
            else
                audio_play_sound(sound_asteroid_hit_jason, 0, false);
        }
        
        instance_destroy();
    }
    
    // fireball collision logic, destroy the instance of colliding fireball if health 0 and the laser
    collisionId = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, object_fireball_jason, false, true);
    if (collisionId != noone)
    {
        with(collisionId)
        {
            fireballHealth -= 1;
            
            if (fireballHealth <= 0)
                score += 200;
            else
                audio_play_sound(sound_fireball_hit_jason, 0, false);
        }
        
        instance_destroy();
    }
        
    // destory instance once it leaves the room
    if (x > room_width || x < 0 || y > room_height || y < 0)
        instance_destroy();
}
