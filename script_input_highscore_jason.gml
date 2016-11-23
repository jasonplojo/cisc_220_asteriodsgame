script_execute(script_mouse_menu_jason);

// keyboard menu selection logic
if (keyboard_check_pressed(vk_left))
{
    audio_play_sound(sound_menu_select_jason, 0, false);
    
    if(object_highscoreloop_jason.menuIndex <= 0)
        object_highscoreloop_jason.menuIndex = 0;
    else
        object_highscoreloop_jason.menuIndex -= 1;
}

if (keyboard_check_pressed(vk_right))
{
    audio_play_sound(sound_menu_select_jason, 0, false);
    
    if(object_highscoreloop_jason.menuIndex >= 2)
        object_highscoreloop_jason.menuIndex = 2;
    else
        object_highscoreloop_jason.menuIndex += 1;
}

if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
{
    switch(object_highscoreloop_jason.menuIndex)
    {
        case 0:
            highscore_clear();
            break;
        case 1:
            room_goto(room_first);
            break;
        case 2:
            game_end();
            break;
    }
}

// mouse menu selection logic
// collision logic with menu items
collisionId = collision_rectangle(object_highscoreloop_jason.menuClearx1, object_highscoreloop_jason.menuCleary1, object_highscoreloop_jason.menuClearx2, object_highscoreloop_jason.menuCleary2, object_mouse_selection_jason, false, true);
if (collisionId != noone)
{
    object_highscoreloop_jason.menuIndex = 0;
    if(mouse_check_button(mb_left))
        highscore_clear();
}

collisionId = collision_rectangle(object_highscoreloop_jason.menuMainx1, object_highscoreloop_jason.menuMainy1, object_highscoreloop_jason.menuMainx2, object_highscoreloop_jason.menuMainy2, object_mouse_selection_jason, false, true);
if (collisionId != noone)
{
    object_highscoreloop_jason.menuIndex = 1;
    if(mouse_check_button(mb_left))
        room_goto(room_first);
}

collisionId = collision_rectangle(object_highscoreloop_jason.menuQuitx1, object_highscoreloop_jason.menuQuity1, object_highscoreloop_jason.menuQuitx2, object_highscoreloop_jason.menuQuity2, object_mouse_selection_jason, false, true);
if (collisionId != noone)
{
    object_highscoreloop_jason.menuIndex = 2;
        if(mouse_check_button(mb_left))
            game_end();
}
