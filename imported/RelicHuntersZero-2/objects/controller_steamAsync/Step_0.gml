///Sync Loop

//DAILY SYNC
if (global.dailyChecked == 0)
{
    //Upload Score
    steam_upload_score("RANK_GLOBAL_ALLTIME", global.scoreEndlessBest);
    currentDateString = "DAILY-"+string(current_day)+"-"+string(current_month)+"-"+string(current_year);
    steam_create_leaderboard(currentDateString, lb_sort_descending, lb_disp_numeric);
    steam_upload_score(currentDateString, global.scoreEndless);
            
    //Download Full List and wait for Async to load step 1
    fullList_get = steam_download_scores(currentDateString, 1, 9999);
    global.dailyChecked = 1;
}
else if (global.dailyChecked == 2) 
{   
    //Find player's rank and wait for Async to load step 3
    score_get = steam_download_scores_around_user(currentDateString, 0, 1);
    global.dailyChecked = 3;
}
else if (global.dailyChecked == 4)
{
    //Find out which Badge you got
    if (global.dailyPlayers != -1) && (global.dailyRankDebug != -1)
    {
        var myTopPercent = global.dailyRankDebug / global.dailyPlayers;
        if (myTopPercent <= 0.05) { global.dailyBadge = 7; } //MASTER
        else if (myTopPercent <= 0.10) { global.dailyBadge = 6; } //DIAMOND
        else if (myTopPercent <= 0.15) { global.dailyBadge = 5; } //PLATINUM
        else if (myTopPercent <= 0.30) { global.dailyBadge = 4; } //GOLD
        else if (myTopPercent <= 0.50) { global.dailyBadge = 3; } //SILVER
        else if (myTopPercent <= 0.70) { global.dailyBadge = 2; } //BRONZE
        else { global.dailyBadge = 1; } //NO BADGE
                
        global.dailyChecked = 5;
        show_debug_message("Completed Steam Leaderboards sync - SUCCESS!");
    } 
}

