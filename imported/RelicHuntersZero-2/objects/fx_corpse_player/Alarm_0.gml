///GameOver

if (!instance_exists(class_player))
{
    global.gameOver = true;
    audio_stop_all();
}

