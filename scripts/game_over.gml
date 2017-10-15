///game_over
global.hp = 0;
audio_play_sound(snd_dead, 100, false);
instance_destroy(obj_player);

global.dead = 1;
//game_end();

