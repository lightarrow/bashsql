function save_game()
{
    #write to a file in SQL syntax. 
    printf "INSERT INTO players (player_name,player_experience_points,player_str,player_hp,player_level,player_attack,player_ac,player_item1,item1_quanity,player_weapon,player_armor) 
    values ('$player_name','$player_experience_points','$player_str','$player_hp','$player_level','$player_attack','$player_ac','$player_item1','$item1_quanity','$player_weapon','$player_armor');" > sql_save_game.txt
    #sqlite3
    ./save_game_script.sh
}