draw_set_font(font_score_verdana_jason);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

script_execute(script_tool_text_outline_jason, HUD_SCORE_X, HUD_SCORE_Y, 2, c_white, "Score: " + string_format(score, 4, 0));
