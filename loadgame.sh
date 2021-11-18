#!/bin/bash
#loads last save by collectin the last record in the database. 
    save_id=$(sqlite3 game.db "SELECT id FROM players ORDER BY ID DESC LIMIT 1;") 
    player_name=$(sqlite3 game.db "SELECT player_name FROM players ORDER BY ID DESC LIMIT 1;")
    player_str=$(sqlite3 game.db "SELECT player_str FROM players ORDER BY ID DESC LIMIT 1;")
    player_hp=$(sqlite3 game.db "SELECT player_hp FROM players ORDER BY ID DESC LIMIT 1;")
    player_level=$(sqlite3 game.db "SELECT player_level FROM players ORDER BY ID DESC LIMIT 1;")
    player_attack=$(sqlite3 game.db "SELECT player_attack FROM players ORDER BY ID DESC LIMIT 1;")
    player_ac=$(sqlite3 game.db "SELECT player_ac FROM players ORDER BY ID DESC LIMIT 1;")
    player_item1=$(sqlite3 game.db "SELECT player_item1 FROM players ORDER BY ID DESC LIMIT 1;")
    item1_quanity=$(sqlite3 game.db "SELECT item1_quanity FROM players ORDER BY ID DESC LIMIT 1;")
    player_weapon=$(sqlite3 game.db "SELECT player_weapon FROM players ORDER BY ID DESC LIMIT 1;")
    player_weapon_strength=$(sqlite3 game.db "SELECT player_weapon FROM players ORDER BY ID DESC LIMIT 1;")
    player_armor=$(sqlite3 game.db "SELECT player_armor FROM players ORDER BY ID DESC LIMIT 1;")
    
printf "save id is %d" "$save_id"


