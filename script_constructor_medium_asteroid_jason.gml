// Set random direction and speed
direction = random(360);
speed = random(1);

// Set random variation of asteroid
sprite_index = sprite_asteroid_medium_jason;
image_index = random(3);
image_speed = 0;

// life value
asteroidHealth = ASTEROID_HEALTH;

// No damage cool down
noDamageCoolDown = 30;

// collision check
collisionCurrent = false;
collisionPrevious = false;
