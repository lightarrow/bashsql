#!/bin/bash
#Author Ronald L. Johnson 05/20/2015
#Simplicity is the ultimate sophistication.  — Leonardo da Vinci
#test Script
#./test.sh 2>&1 | tee gameplay.txt
#echo $? give the exit status of a test
# life rules alive = 5 dead = 4 leave =9
#Life has a number and death has a number. 
#reaching 0 in any area is $nothing
#TO DO:
#1.Format action as it progresses. 
#3.Format sql calls for save game. DONE !!!!!!!!!!!!!!
#4.Clean up some of the code 
#sqlite3 game.db .read create_player_table.sql
#you must save one game before you can load one. 
nothing=0
player=5 # change to 4 to kill
enemy=5 # change to 4 to kill
dead=4
leave=9  #end program.
level2=10
level3=30
level4=50
max_level=40
magic_level=1
heal2=2
#sleep 5
function attack_power()  #set attack level bast on str and player weapon stregnth
{
    #this is broken after game save attemped 1 fix
    player_attack_total=$(( $player_attack + $player_weapon_strength ))
}
function load_noob()
{
    save_id=0
    player_name="Lore"
    player_str=15
    player_hp=18
    player_current_hp=$player_hp
    player_level=1
    player_attack=5
    player_ac=3
    item1_quanity=0
    player_item1="Potion"
    player_weapon="Short Sword"
    player_armor="Leather Vest"
    player_weapon_strength=3
    player_attack_total=0
    player_experience_points=0
    current_exp=0
    magic_level=1
  #sleep 5
}


function load_slime()
{
    enemy=5
    enemy_image=slime.txt
    enemy_name="Green Slime"
    printf "A %s appears !" "$enemy_name"
    #sleep 5
    enemy_str=5
    enemy_hp=10
    enemy_current_hp=$enemy_hp  #sets current hp level that is tested for death in event loop. 
    enemy_level=1
    enemy_attack=3
    enemy_ac=3
    enemy_item1="Potion"
    enemy_weapon="Splat"
    enemy_armor="None"
    enemy_weapon_strength=0
    enemy_attack_total=0
    enemy_experience_points=3
}
function load_dragon()
{
    enemy=5
    enemy_image=dragon.txt
    enemy_name="Green Dragon"
    printf "A %s appears !" "$enemy_name"
    #sleep 5
    enemy_str=9
    enemy_hp=100
    enemy_current_hp=$enemy_hp  #sets current hp level that is tested for death in event loop. 
    enemy_level=1
    enemy_attack=15
    enemy_ac=6
    enemy_item1="Potion"
    enemy_weapon="Splat"
    enemy_armor="None"
    enemy_weapon_strength=12
    enemy_attack_total=12
    enemy_experience_points=40
}
function load_lizard_man()
{
    enemy=5
    enemy_image=lizard_man.txt
    enemy_name="Lizard Man"
    printf "A %s appears !" "$enemy_name"
    #sleep 5
    enemy_str=5
    enemy_hp=50
    enemy_current_hp=$enemy_hp  #sets current hp level that is tested for death in event loop. 
    enemy_level=1
    enemy_attack=5
    enemy_ac=3
    enemy_item1="Potion"
    enemy_weapon="Axe"
    enemy_armor="None"
    enemy_weapon_strength=4
    enemy_attack_total=0
    enemy_experience_points=8

}

#printing formating
function print_player_stats()
{
    printf "Player stats.\n"
    header1="%-8s %-12s %-12s %-4s %-12s %-12s %-12s\n"
    format1="%-8s %-12d %-12s %-4d %-12d %-12d %-12d\n"
    header2="%-12s %-12s %-12s %-12s %-12s %-12s\n"
    format2="%-12d %-12s %-12d %-12s %-12d %-12s\n"
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "_"
    printf "$header1" "Name" "Experience" "Strength" "HP" "Level" "Attack" "Magic"
    printf "$format1" "$player_name" "$player_experience_points" "$player_str" "$player_hp" "$player_level" "$player_attack" "$magic_level"
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "_"
    printf "$header2" "AC" "Items" "item_qty" "Weapon" "Weapon_STR" "Armor"
    printf "$format2" "$player_ac" "$player_item1" "$item1_quanity" "$player_weapon" "$player_weapon_strength" "$player_armor"
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "_"
}
function save_game()
{
    #write to a file in SQL syntax. 
    printf "INSERT INTO players (player_name,player_experience_points,player_str,player_hp,player_level,player_attack,player_ac,player_item1,item1_quanity,player_weapon,player_weapon_strength,player_armor,magic_level) 
    values ('$player_name','$player_experience_points','$player_str','$player_hp','$player_level','$player_attack','$player_ac','$player_item1','$item1_quanity','$player_weapon','$player_weapon_strength','$player_armor','$magic_level');" > sql_save_game.sql
    #sqlite3
    ./save_game_script.sh
}
function load_last_save()
{
    #$player_weapon_strength is missing from the player table
    save_id=$(sqlite3 game.db "SELECT id FROM players ORDER BY ID DESC LIMIT 1;") 
    player_name=$(sqlite3 game.db "SELECT player_name FROM players ORDER BY ID DESC LIMIT 1;")
    player_experience_points=$(sqlite3 game.db "SELECT player_experience_points FROM players ORDER BY ID DESC LIMIT 1;")
    player_str=$(sqlite3 game.db "SELECT player_str FROM players ORDER BY ID DESC LIMIT 1;")
    player_hp=$(sqlite3 game.db "SELECT player_hp FROM players ORDER BY ID DESC LIMIT 1;")
    player_level=$(sqlite3 game.db "SELECT player_level FROM players ORDER BY ID DESC LIMIT 1;")
    player_attack=$(sqlite3 game.db "SELECT player_attack FROM players ORDER BY ID DESC LIMIT 1;")
    player_ac=$(sqlite3 game.db "SELECT player_ac FROM players ORDER BY ID DESC LIMIT 1;")
    player_item1=$(sqlite3 game.db "SELECT player_item1 FROM players ORDER BY ID DESC LIMIT 1;")
    item1_quanity=$(sqlite3 game.db "SELECT item1_quanity FROM players ORDER BY ID DESC LIMIT 1;")
    player_weapon=$(sqlite3 game.db "SELECT player_weapon FROM players ORDER BY ID DESC LIMIT 1;")
    player_weapon_strength=$(sqlite3 game.db "SELECT player_weapon_strength FROM players ORDER BY ID DESC LIMIT 1;")
    player_armor=$(sqlite3 game.db "SELECT player_armor FROM players ORDER BY ID DESC LIMIT 1;")
    magic_level=$(sqlite3 game.db "SELECT magic_level FROM players ORDER BY ID DESC LIMIT 1;")
    player_current_hp=$player_hp
    attack_power
    print_player_stats
    #sleep 5
}
function attack_enemy()
{
    printf "%s attacks %s.\n %s takes %d damage.\n" "$player_name" "$enemy_name" "$enemy_name" "$player_attack_total"
    #calculate hp in attacks. 
    enemy_current_hp=$(( $enemy_current_hp - $player_attack_total ))

}
function use_magic()
{
        printf "1.Heal\n2.Heal2\n"
    read -p "Magic spells: " cast
    case $cast in
        1) printf "You hold your focus stone, and feel light moving through your body.\n"
            heal=$((player_current_hp + 10))
            player_current_hp=$heal
            printf "Your health has increased by 10\n"
            ;;
        2) 
          if [ $magic_level -gt $heal2 ];then
            player_current_hp=$((player_current_hp + 25))
            printf "You hold your focus stone, and your body feels like its on fire.\n"
          elif [[ $player_level -le $level2 ]];then
                printf "You are not at a sufficent enough level to use heal 2.\n Heal will be used.\n"
                heal=$((player_current_hp + 10))
                player_current_hp=$heal
          fi
            ;;
    esac
}

function inventory()
{
    printf "%s %d\n" "$player_item1" "$item1_quanity"
    printf "1.%s %s\n2.Back\n" "$player_item1" "$item_quanity"
    read -p "Use items in bag of holding: " bag
    case $bag in
        1) 
        if [ $item1_quanity -gt $nothing ]; then
            player_current_hp=$(($player_current_hp + 50))
            item1_quanity=$(($item1_quanity - 1))
        elif [[ $item1_quanity -le $nothing ]]; then
            printf "You can not use what you do not have.\n"
        fi
            ;;
        2) 
            break
            ;;
        
    esac
}
function level_Up()
{
    #clear
    player_level=$(($player_level + 1))
    printf "You have ganed a level!" 
    magic_level=$(($magic_level + 1))
    printf "Your magic level has increased."
    player_str=$(($player_str + 3))
    player_hp=$(($player_hp + 3))
    player_current_hp=$player_hp
    player_attack=$(($player_attack + 2))
    attack_power
    #sleep 15
    
}
function win()
{
    printf "you have destroyed the green dragon! You are a great warrior.\n"
}

function encounter()
{
    #new structure. 
while [[ $player -ne $dead  && $player -ne $leave && $enemy -ne $dead ]]
    do
    ##clear
    printf "\n" 
    cat $enemy_image
    printf "\n"
    if [[ $enemy_current_hp -le $nothing ]]; then
       enemy=4
       break
    fi
    if [[ $player_current_hp -le $nothing ]]; then
        player=4
        break
    fi
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "_"
    printf "||%s has %d HP ||\n||%s has %d HP||\n" "$player_name" "$player_current_hp" "$enemy_name" "$enemy_current_hp"
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "_"
    printf "\n1.Attack \n2.Magic \n3.Inventory \n4.Check player stats.\n5.Quit\n6.Save and exit\n"
    printf "Make your choice: "
    read -p "Make your choice: " option
    case $option in
        1) attack_enemy
            ;;
        2) use_magic
            ;;
        3) inventory
            ;;
        4) print_player_stats
            ;;
        5) player=9
           exit
            ;;
        6) save_game
            player=9
            exit
            ;;
    esac
    if [[ $enemy_current_hp -gt $nothing ]]; then
    printf "%s Attacks!\n %s takes %d damage.\n" "$enemy_name" "$player_name" "$enemy_attack"
    player_current_hp=$(( $player_current_hp - $enemy_attack ))
    #sleep 5
    #clear
    fi
done
if [ $player -eq $dead ]; then
        printf "You have died a horrable death, your body will be found by another adventurer.\n"
fi
#when the enemy is dead then increase player exp 
if [[ $enemy -eq $dead ]]; then
       current_exp=$(($player_experience_points + $enemy_experience_points))
        printf "Success your experience points have increased to %d\n" "$current_exp"
        player_experience_points=$current_exp
fi
if [[ $player_experience_points -ge $level2 ]];then
    level_Up
    level2=10000
    #sleep 20
fi
if [[ $player_experience_points -ge $level3 ]]; then
    printf "You have reached the max_level"
    level_Up
    #sleep 5
    player_attack=10
    level3=10000
fi
if [[ $player_experience_points -ge $level4 ]]; then
    printf "You have reached the max_level"
    level_Up
    #sleep 5
    player_attack=15
    level4=10000
fi  
}

function game_flow()
{
    while [[ $player -ne $leave && $player -ne $dead ]]; do
        attack_power
        load_slime
        encounter
        #sleep 5
        load_slime
        encounter
        #sleep 5
        load_slime
        encounter
        load_slime
        encounter
        load_slime
        encounter
        load_lizard_man
        encounter
        printf "you have found 3 strong potions that will raise hit points by 50\n"
        item1_quanity=$((item1_quanity + 3))
        print_player_stats
        load_lizard_man
        encounter
        load_dragon
        encounter
        if [[ $player -ne $dead && $player -ne $leave ]];then
            win
            break
        fi
    done
}
########################Game Begins###################################
    #clear
    cat title.txt
    printf "\nWould you like to load a saved game?\n" 
    printf "1.New game.\n2.Load last saved game. \n3.Quit\n"
    read -p "Please choose: " load
    case $load in
        1) load_noob
            ;;
        2) load_last_save
            ;;
        3) exit
           player=9 
            ;;
    esac
printf "\nWelcome to this adventure.\nYou awaken to find your self in a dark cave.\nThe last thing you remember is the harvest celebration, and a lot of celebration.\nYou look around and find a short sword, and some leather armor.\nYour only choice is to head off in to the damp dark.\nGrabbing the only protection you can find you head into the dark corodor with only a small torch.\n"
#sleep 20
game_flow
printf "Thanks for Playing\n"