// Set random direction and speed
direction = random(360);
speed = random(1);

// Set random variation of asteroid
sprite_index = sprite_asteroid_small_jason;
image_index = random(3);
image_speed = 0;

// life value
asteroidHealth = ASTEROID_HEALTH;

// no damage timer
noDamageCoolDown = 30;

// collision check
collisionCurrent = false;
collisionPrevious = false;

// create audio system
warningSound = audio_emitter_create();
warningAsteroidSound = audio_play_sound_on(warningSound, sound_ship_warning_jason, true, 0);
audio_stop_sound(warningAsteroidSound);
audio_emitter_falloff(warningSound, 50, 100, 1);
