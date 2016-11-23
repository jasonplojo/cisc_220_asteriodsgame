script_execute(script_hud_menu_jason);
script_execute(script_mouse_menu_jason);

if (!audio_is_playing(music_menu_jason))
{
    audio_play_sound(music_menu_jason, 0 , true);
    audio_sound_gain(music_menu_jason, musicLevel, 0);
}
