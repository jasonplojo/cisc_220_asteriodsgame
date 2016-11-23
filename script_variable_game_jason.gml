// array for instance ids
laser[] = 0;
asteroidBig[] = 0;
asteroidMedium[] = 0;
asteroidSmall[] = 0;
fireball[] = 0;

// timers
stageCompleteTimer = 240;

// indexes
textIndex = 0;

// create gameloop particle system
gameParticle = part_system_create();
part_system_depth(gameParticle, -100);
part_system_position(gameParticle, 0 , 0);

// Create explosion particle
particleExplosion = part_type_create();
part_type_life(particleExplosion, 15, 15);
part_type_shape(particleExplosion, pt_shape_explosion);

// Create smoke particle
particleSmoke = part_type_create();
part_type_life(particleSmoke, 20, 20);
part_type_shape(particleSmoke, pt_shape_smoke);
part_type_size(particleSmoke, 1, 1, 0.1, 0);

// set player health
health = PLAYER_HEALTH;

randomize();
