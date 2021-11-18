#!/bin/bash
all_saves=$(sqlite3 game.db "SELECT * from players") #sqlite3 requires the path to the DB as the seond argument
last_save=$(sqlite3 game.db "SELECT * FROM players ORDER BY ID DESC LIMIT 1;")# reads last entry of records on the table. 
printf "%s\n" "$last_save" > last_save.txt
printf "%s\n" "$all_saves" > all_saves.txt




