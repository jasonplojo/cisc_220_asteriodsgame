//draw_set_font(font_score_verdana_jason);
//draw_set_halign(fa_right);
//draw_set_valign(fa_bottom);

//script_execute(script_tool_text_outline_jason, 1260, 700, 2, c_white, string(health));

lifeBarLeftEndPoint = room_width - 120;
lifeBarRightEndPoint = room_width - 20;
lifeBarInterval = (lifeBarRightEndPoint - lifeBarLeftEndPoint) / PLAYER_HEALTH;
lifeBarState = lifeBarInterval * health;
lifeBarDisplay = lifeBarLeftEndPoint + lifeBarState;

draw_set_color(c_white);
draw_rectangle(lifeBarLeftEndPoint - 2, room_height - 42, lifeBarRightEndPoint + 2, room_height - 18, false);

draw_set_color(c_red);
draw_rectangle(lifeBarLeftEndPoint, room_height - 40, lifeBarRightEndPoint, room_height - 20, false);

draw_set_color(c_green);
draw_rectangle(lifeBarLeftEndPoint, room_height - 40, lifeBarDisplay, room_height - 20, false);
