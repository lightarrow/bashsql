#!/bin/bash
#read me Author: Ronald Johnson 5/29/2015
#Simplicity is the ultimate sophistication.  — Leonardo da Vinci
#you can run this script to create the database and files needed to play the game. 
#Executing this script should build all that you need to play. 
#you need sqlite3 so see if you have it 
sqlite3 --version
#output will tell you version and then you can run these commands to get going
#if you dont have it 
#sudo apt-get install sqlite3
#yum install sqlite3
mkdir Dark_Star_Adventures
cd Dark_Star_Adventures
sqlite3 game.db 
#
printf "CREATE  TABLE "players" ("ID" INTEGER PRIMARY KEY  NOT NULL ,
"player_name" VARCHAR,
"player_experience_points" INTEGER,
"player_str" INTEGER,
"player_hp" INTEGER, 
"player_level" INTEGER,
"player_attack" INTEGER,
"player_ac" INTEGER,
"player_item1" VARCHAR,
"item1_quanity" INTEGER, 
"player_weapon" VARCHAR,
"player_weapon_strength" INTEGER,
"player_armor" VARCHAR,
"magic_level" INTEGER);" > create_player_table.sql
#
sqlite3 game.db .exit
sqlite3 .read < create_player_table.sql
touch save_game_script.sh
touch sql_save_game.sql
chmod a+x *


