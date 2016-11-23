// instance logics
if (instance_exists(object_ship_jason))
    script_execute(script_main_ship_jason);

if (object_exists(object_laser_jason))
{
    with (object_laser_jason)
        script_execute(script_main_laser_jason, id);
    /*
    // update laser instance id array
    for ( i = 0; i < instance_number(object_laser_jason); i++)
        laser[i] = instance_find(object_laser_jason, i);
    
    // perform laser instance logic
    for ( i = 0; i < array_length_1d(laser); i++)
        script_execute(script_main_laser_jason, laser[i]);
    */
}

if (object_exists(object_asteroid_big_jason))
{
    // update big asteroid instance id array
    for ( i = 0; i < instance_number(object_asteroid_big_jason); i++)
        asteroidBig[i] = instance_find(object_asteroid_big_jason, i);
    
    // perform big asteroid instance logic
    for ( i = 0; i < array_length_1d(asteroidBig); i++)
        script_execute(script_main_big_asteroid_jason, asteroidBig[i]);
}

if (object_exists(object_asteroid_medium_jason))
{
    // update medium asteroid instance id array
    for ( i = 0; i < instance_number(object_asteroid_medium_jason); i++)
        asteroidMedium[i] = instance_find(object_asteroid_medium_jason, i);
    
    // perform medium asteroid instance logic
    for ( i = 0; i < array_length_1d(asteroidMedium); i++)
        script_execute(script_main_medium_asteroid_jason, asteroidMedium[i]);
}

if (object_exists(object_asteroid_small_jason))
{
    // update small asteroid instance id array
    for ( i = 0; i < instance_number(object_asteroid_small_jason); i++)
        asteroidSmall[i] = instance_find(object_asteroid_small_jason, i);
    
    // perform small asteroid instance logic
    for ( i = 0; i < array_length_1d(asteroidSmall); i++)
        script_execute(script_main_small_asteroid_jason, asteroidSmall[i]);
}

if (object_exists(object_fireball_jason))
{
    // update fireball instance id array
    for ( i = 0; i < instance_number(object_fireball_jason); i++)
        fireball[i] = instance_find(object_fireball_jason, i);
    
    // perform fireball animation and instance logic
    for ( i = 0; i < array_length_1d(fireball); i++)
        script_execute(script_main_fireball_jason, fireball[i]);
}

// Prevent score from going negative
if (score <= 0)
    score = 0;
    
// Prevent health from going negative
if (health <= 0)
    health = 0;
    
// next room logic
if (instance_number(object_asteroid_big_jason) <= 0 && instance_number(object_asteroid_medium_jason) <= 0 && instance_number(object_asteroid_small_jason) <= 0 && instance_number(object_fireball_jason) <= 0)
{
    // start timer, show stage complete text
    object_gameloop_jason.textIndex = 100;
    
    // end game logic, once timer expires continue to next room if it is not the last
    if (stageCompleteTimer < 0)
    {   
        // add 1000 points
        score += 1000;
        
        part_system_destroy(object_gameloop_jason.gameParticle);
        audio_stop_all();
        
        if (room_next(room) != room_last || room_next(room) != -1)
            room_goto_next();
        else
            room_goto(room_first);
    }
    else
        stageCompleteTimer -= 1;
}

// game over logic
if (instance_number(object_ship_jason) <= 0)
{
    // start timer, show game over
    object_gameloop_jason.textIndex = 101;
    
    if (stageCompleteTimer < 0)
    {
        part_system_destroy(object_gameloop_jason.gameParticle);
        audio_stop_all();
        
        room_goto(room_last);
    }
    else
        stageCompleteTimer -= 1;
}
