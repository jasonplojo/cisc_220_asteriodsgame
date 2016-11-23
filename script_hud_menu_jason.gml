draw_set_font(font_menu_verdana_jason);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

script_execute(script_tool_text_outline_jason, room_width / 2, room_height / 2, 2, c_white, object_menuloop_jason.menuStart);
script_execute(script_tool_text_outline_jason, room_width / 2, room_height / 2 + 35, 2, c_white, object_menuloop_jason.menuHighScore);
script_execute(script_tool_text_outline_jason, room_width / 2, (room_height / 2) + 70, 2, c_white, object_menuloop_jason.menuInfo);
script_execute(script_tool_text_outline_jason, room_width / 2, (room_height / 2) + 105, 2, c_white, object_menuloop_jason.menuQuit);

switch (object_menuloop_jason.menuIndex)
{
    case 0:
        script_execute(script_tool_text_outline_jason, room_width / 2, room_height / 2, 2, c_teal, object_menuloop_jason.menuStart);
        break;
    case 1:
        script_execute(script_tool_text_outline_jason, room_width / 2, (room_height / 2) + 35, 2, c_teal, object_menuloop_jason.menuHighScore);
        break;
    case 2:
        script_execute(script_tool_text_outline_jason, room_width / 2, (room_height / 2) + 70, 2, c_teal, object_menuloop_jason.menuInfo);
        break;
    case 3:
        script_execute(script_tool_text_outline_jason, room_width / 2, (room_height / 2) + 105, 2, c_teal, object_menuloop_jason.menuQuit);
        break;
}

draw_set_font(font_stage_verdana_jason);
script_execute(script_tool_text_outline_jason, room_width / 2, 200, 2, c_ltgray, object_menuloop_jason.menuTitle);
