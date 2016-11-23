// Display heading
draw_set_halign(fa_center);
script_execute(script_tool_text_outline_jason, 640, 60, 2, c_white, "Highscore");

// Display high score
for (i = 1; i <= 10; i++)
{
    draw_set_halign(fa_left);
    script_execute(script_tool_text_outline_jason, 400, 100 + (35 * (i - 1)), 2, c_white, highscore_name(i));
    
    draw_set_halign(fa_right);
    script_execute(script_tool_text_outline_jason, 880, 100 + (35 * (i - 1)), 2, c_white, highscore_value(i));
}

// Display menu items
draw_set_halign(fa_center);
script_execute(script_tool_text_outline_jason, 450, 480, 2, c_white, menuClear);
script_execute(script_tool_text_outline_jason, 610, 480, 2, c_white, menuMain);
script_execute(script_tool_text_outline_jason, 800, 480, 2, c_white, menuQuit);

// 
switch (object_highscoreloop_jason.menuIndex)
{
    case 0:
        script_execute(script_tool_text_outline_jason, 450, 480, 2, c_teal, object_highscoreloop_jason.menuClear);
        break;
    case 1:
        script_execute(script_tool_text_outline_jason, 610, 480, 2, c_teal, object_highscoreloop_jason.menuMain);
        break;
    case 2:
        script_execute(script_tool_text_outline_jason, 800, 480, 2, c_teal, object_highscoreloop_jason.menuQuit);
        break;
}
