menuIndex = 0;
lowestScore = 0;
score = 0;

// text for menu items
menuTitle = "Jason's Asteroid Game";
menuStart = "Start Game";
menuHighScore = "Highscore";
menuInfo = "Game Information";
menuQuit = "Quit Game";
gameInfo = "Game Information

Game Instructions

Asteroids Game
Destroy all of the asteroids and fireballs using the spacecraft's laser to proceed to the next stage while avoiding getting hit by them.

Controls
Up Key: Accelerate spacecraft
Down Key: Decelerate spacecraft
Left Key: Veer spacecraft left
Right Key: veer spacecraft right
Space Bar: Fire lasers

ID Information

Game Consultant: Jason Plojo
Assignment: PROJECT 3
Course and Title: CISC 220 - Fun & Games
Class Meeting Time: T/TH 9:35 - 12:45 PM
Instructor: Professor Forman
Hours: 29.5
Difficulty: 8
Completion Date: 3/20/2014
File Name: JasonAsteroids

Project Description

The objective is to destroy all of the asteroids and fireballs. The spacecraft has 3 different cruising speeds: slow, normal, and fast. The spacecraft operates at normal cruising speeds by default and will return to this speed when the accelerator and the decelerator is not pressed. To decelerate to slow cruising speeds press the down arrow key, and to accelerate to fast cruising speeds press the up arrow key. To change the direction of the spacecraft, press the left arrow key to veer the spacecraft left, and press the right arrow key to veer the spacecraft right. To fire the lasers, press the space bar. The spacecraft has armor plating to protect the pilot from asteroids and fireballs colliding with it. This armor plating's endurance is represented in a life bar in the lower right.
Credits

Thanks for the assistance:
Peter Lorenzana

Thanks for the opportunity to assist:
Alex Cervantes
Peter Lorenzana

Media

Background
Space Backgrounds | http://opengameart.org/content/space-backgrounds-3

Music
Nebulous | http://opengameart.org/content/nebulous
Orbital Colussus | http://opengameart.org/content/space-boss-battle-theme
Planetrise | http://opengameart.org/content/planetrise
RailJet / Long Seamless Loop | http://opengameart.org/content/railjet-long-seamless-loop

Sound
Animated Fireball | http://opengameart.org/content/animated-fireball
Boom Pack 1 | http://opengameart.org/content/boom-pack-1
Fire Loop | http://opengameart.org/content/fire-loop
Laser Fire | http://opengameart.org/content/laser-fire
Menu Rollover | http://opengameart.org/content/menu-rollover
Space Ship Floating | http://opengameart.org/content/space-ship-floating-sounds2
Various Alerts | http://opengameart.org/content/various-alerts

Sprites
Asteroids | http://opengameart.org/content/asteroids
Laser | http://xboxforums.create.msdn.com/forums/t/37989.aspx
Night Raider | http://opengameart.org/content/night-raider

Stars

(1*) Display all scoring with “pizzazz” using big, bold, beautiful and very legible fonts
(1*) When an asteroid is destroyed, display animated gif of an explosion [Used particle system instead]
(1*) Have the asteroids destroyed only after they have been hit 3 times
(1*) Expand previous one to have asteroid first break into 2 smaller ones
(2*) The spacecraft does not explode until it has been hit 3 times by an asteroid or else 2 times by a fire-ball. Subtract 50 points when the asteroid hits the spacecraft and 100 when a fire-ball does.
(2*) Use the “H” key to activate a high score display, where the player can enter the player's name by the score. [High score can be accessed at the end of the game and through the main menu.]
(1*) Use the “C” key to clear the high score table. [Can be cleared by selecting the “Clear” menu item at the high score screen.]
(2*) Give user option to display all the information appearing in the Game Information window during the playing of the game! [Can be accessed at the main menu.]
(4*) Add extra pizzazz and describe what you did
Implemented health bar system using sub intervals to display remaining health.
Added collision logic to all asteroids and fireballs.
Used GameMaker audio engine to change pitch of spacecraft engine in respect to it's speed.
Used GameMaker audio engine for positional sound from small asteroids.
TOTAL STARS ATTEMPTED: 15*";

// set up font
draw_set_font(font_menu_verdana_jason);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// size for menu items
menuStartx1 = (room_width - string_width(menuStart)) / 2;
menuStartx2 = (room_width + string_width(menuStart)) / 2;
menuStarty1 = (room_height - string_height(menuStart)) / 2;
menuStarty2 = (room_height + string_height(menuStart)) / 2;

menuHighScorex1 = (room_width  - string_width(menuHighScore)) / 2;
menuHighScorex2 = (room_width + string_width(menuHighScore)) / 2;
menuHighScorey1 = ((room_height - string_height(menuHighScore)) / 2) + 35;
menuHighScorey2 = ((room_height + string_height(menuHighScore)) / 2) + 35;

menuInfox1 = (room_width  - string_width(menuInfo)) / 2;
menuInfox2 = (room_width + string_width(menuInfo)) / 2;
menuInfoy1 = ((room_height - string_height(menuInfo)) / 2) + 75;
menuInfoy2 = ((room_height + string_height(menuInfo)) / 2) + 75;

menuQuitx1 = (room_width - string_width(menuQuit)) / 2;
menuQuitx2 = (room_width + string_width(menuQuit)) / 2;
menuQuity1 = ((room_height - string_height(menuQuit)) / 2) + 103;
menuQuity2 = ((room_height + string_height(menuQuit)) / 2) + 103;

// collision check
collisionPrevious = false;
collisionCurrent = false;

// global variables
globalvar musicLevel;
musicLevel = 0.3;
