// keyboard menu selection logic
if (keyboard_check_pressed(vk_up))
{
    audio_play_sound(sound_menu_select_jason, 0, false);
    
    if(object_menuloop_jason.menuIndex <= 0)
        object_menuloop_jason.menuIndex = 0;
    else
        object_menuloop_jason.menuIndex -= 1;
}

if (keyboard_check_pressed(vk_down))
{
    audio_play_sound(sound_menu_select_jason, 0, false);
    
    if(object_menuloop_jason.menuIndex >= 3)
        object_menuloop_jason.menuIndex = 3;
    else
        object_menuloop_jason.menuIndex += 1;
}

if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
{
    switch(object_menuloop_jason.menuIndex)
    {
        case 0:
            audio_stop_all();
            room_goto_next();
            break;
        case 1:
            room_goto(room_last);
            break;
        case 2:
            show_message(object_menuloop_jason.gameInfo);
            break;
        case 3:
            game_end();
            break;
    }
}

// mouse menu selection logic
// collision logic with menu items
if (collisionPrevious == false && collisionCurrent == false)
{
    collisionId = collision_rectangle(object_menuloop_jason.menuStartx1, object_menuloop_jason.menuStarty1, object_menuloop_jason.menuStartx2, object_menuloop_jason.menuStarty2, object_mouse_selection_jason, false, true);
    if (collisionId != noone)
    {
        //audio_play_sound(sound_menu_select_jason, 0, false);
        object_menuloop_jason.menuIndex = 0;
        collisionCurrent = true;
        
        if (mouse_check_button(mb_left))
        {
            audio_stop_all();
            room_goto_next();
        }
    }
    
    collisionId = collision_rectangle(object_menuloop_jason.menuHighScorex1, object_menuloop_jason.menuHighScorey1, object_menuloop_jason.menuHighScorex2, object_menuloop_jason.menuHighScorey2, object_mouse_selection_jason, false, true);
    if (collisionId != noone)
    {
        //audio_play_sound(sound_menu_select_jason, 0, false);
        object_menuloop_jason.menuIndex = 1;
        collisionCurrent = true;
        
        if (mouse_check_button(mb_left))
            room_goto(room_last);
    }
    
    collisionId = collision_rectangle(object_menuloop_jason.menuInfox1, object_menuloop_jason.menuInfoy1, object_menuloop_jason.menuInfox2, object_menuloop_jason.menuInfoy2, object_mouse_selection_jason, false, true);
    if (collisionId != noone)
    {
        //audio_play_sound(sound_menu_select_jason, 0, false);
        object_menuloop_jason.menuIndex = 2;
        collisionCurrent = true;
        
        if (mouse_check_button(mb_left))
            show_message(object_menuloop_jason.gameInfo);
    }
    
    collisionId = collision_rectangle(object_menuloop_jason.menuQuitx1, object_menuloop_jason.menuQuity1, object_menuloop_jason.menuQuitx2, object_menuloop_jason.menuQuity2, object_mouse_selection_jason, false, true);
    if (collisionId != noone)
    {
        //audio_play_sound(sound_menu_select_jason, 0, false);
        object_menuloop_jason.menuIndex = 3;
        collisionCurrent = true;
        
            if (mouse_check_button(mb_left))
                game_end();
    }
}

collisionPrevious = collisionCurrent;
collisionCurrent = false;
