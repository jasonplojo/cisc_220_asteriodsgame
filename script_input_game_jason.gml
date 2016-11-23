// Player input logic
if (instance_exists(object_ship_jason))
{
    if (keyboard_check(vk_up))
        object_ship_jason.speed += PLAYER_ACCELERATION_SPEED;
    else if (keyboard_check(vk_down))
        object_ship_jason.speed -= PLAYER_DECELERATION_SPEED;
    else
    {
        if (object_ship_jason.speed < PLAYER_CRUISING_SPEED)
            object_ship_jason.speed += PLAYER_ACCELERATION_SPEED;
        else if (object_ship_jason.speed > PLAYER_CRUISING_SPEED)
            object_ship_jason.speed -= PLAYER_DECELERATION_SPEED;
    }
        
     if (keyboard_check(vk_down))
        object_ship_jason.speed -= PLAYER_DECELERATION_SPEED * 2;   
        
    if (keyboard_check(vk_left))
        object_ship_jason.direction += PLAYER_TURN_SPEED;
    
    if (keyboard_check(vk_right))
        object_ship_jason.direction -= PLAYER_TURN_SPEED;
        
    if (keyboard_check_pressed(vk_space))
    {
        if (object_ship_jason.laserCoolDown <= 0)
        {
            instance_create(object_ship_jason.x + object_ship_jason.xLaserOffset, object_ship_jason.y + object_ship_jason.yLaserOffset, object_laser_jason);
            object_ship_jason.laserCoolDown = LASER_FIRE_RATE;
        }
    }
}

// global game input logic
if (keyboard_check(ord('R')))
{
    part_system_destroy(object_gameloop_jason.gameParticle);
    audio_stop_all();
    game_restart();
}

if (keyboard_check(ord('N')))
{
    part_system_destroy(object_gameloop_jason.gameParticle);
    audio_stop_all();
    if (room_next(room) == -1)
        room_goto(room_first);
    else
        room_goto_next();
}

if (keyboard_check(vk_escape))
    game_end();
