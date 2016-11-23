draw_set_font(font_stage_verdana_jason);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

switch (object_gameloop_jason.textIndex)
{
    case 100:
        script_execute(script_tool_text_outline_jason, 640, 360, 2, c_white, "Stage Complete!");
        break;
    case 101:
        script_execute(script_tool_text_outline_jason, 640, 360, 2, c_white, "Game Over");
        break;
}
