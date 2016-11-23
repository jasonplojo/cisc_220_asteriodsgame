// Set random direction and speed
direction = random(360);
speed = random_range(2, 3);

// life value
fireballHealth = FIREBALL_HEALTH;

// collision check
collisionCurrent = false;
collisionPrevious = false;

// create audio system
fireSound = audio_emitter_create();
fireFlyingSound = audio_play_sound_on(fireSound, sound_fireball_flying_jason, true, 0);
audio_stop_sound(fireFlyingSound);
