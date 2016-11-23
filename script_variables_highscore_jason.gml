lowestScore = 0;
highScoreName = "";
menuIndex = 0;

// text for menu items
menuClear = "Clear";
menuMain = "Main Menu";
menuQuit = "Quit Game";

// set up font
draw_set_font(font_menu_verdana_jason);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// size for menu items
menuClearx1 = 450 - (string_width(menuClear) / 2);
menuClearx2 = 450 + (string_width(menuClear) / 2);
menuCleary1 = 480 - (string_height(menuClear) / 2);
menuCleary2 = 480 + (string_height(menuClear) / 2);

menuMainx1 = 610 - (string_width(menuMain) / 2);
menuMainx2 = 610 + (string_width(menuMain) / 2);
menuMainy1 = 480 - (string_height(menuMain) / 2);
menuMainy2 = 480 + (string_height(menuMain) / 2);

menuQuitx1 = 800 - (string_width(menuQuit) / 2);
menuQuitx2 = 800 + (string_width(menuQuit) / 2);
menuQuity1 = 480 - (string_height(menuQuit) / 2);
menuQuity2 = 480 + (string_height(menuQuit) / 2);

// check to see if score made it to leaderboards
lowestScore = highscore_value(1);

for (i = 1; i <= 10; i++)
{
    if (lowestScore > highscore_value(i))
        lowestScore = highscore_value(i);
}

if (lowestScore < score)
        highScoreName = get_string("Congratulations! You made it to the leaderboards!", "Enter your name.");
        
highscore_add(highScoreName, score);
