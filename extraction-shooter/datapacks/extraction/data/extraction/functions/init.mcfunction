tellraw @a ["",{"text":"[EXTRACTION]","color":"dark_gray"},{"text":" Creating the map"}]

# Kill all armor stands
execute at @e[tag=extract,type=minecraft:armor_stand] run setblock ~ ~ ~ minecraft:air
kill @e[tag=extract,type=minecraft:armor_stand]

# Reset all scoreboards
scoreboard objectives remove death

# Reset players
clear @a[scores={extract=0}]

# Generate 5 armor stands
tellraw @a ["",{"text":"[EXTRACTION]","color":"dark_gray"},{"text":" Generating the exits..."}]
summon minecraft:armor_stand 0 100 0 {PersistenceRequired:1b,NoGravity:1b,Invulnerable:1,Tags:["extract"],Invisible:1b}
summon minecraft:armor_stand 0 100 0 {PersistenceRequired:1b,NoGravity:1b,Invulnerable:1,Tags:["extract"],Invisible:1b}
summon minecraft:armor_stand 0 100 0 {PersistenceRequired:1b,NoGravity:1b,Invulnerable:1,Tags:["extract"],Invisible:1b}

# Set up scoreboards
scoreboard objectives add death deathCount {"text":"Mort","color":"red"}
execute as @a run scoreboard players set @p death 0

# Set up armor stands
spreadplayers 0 0 40 100 false @e[tag=extract,type=minecraft:armor_stand]
execute as @e[tag=extract,type=minecraft:armor_stand] at @e[tag=extract,type=armor_stand] run setblock ~ ~ ~ minecraft:oak_trapdoor
tellraw @a ["",{"text":"[EXTRACTION]","color":"dark_gray"},{"text":" Exits generated!"}]

# Set up the worldborder
gamemode spectator @a
tp @a 0 100 0
worldborder set 300

# Set up the players
spreadplayers 0 0 25 100 false @a
gamemode survival @a
execute as @a[scores={extract=0}] run function extract:starter_kit
scoreboard objectives remove extract
scoreboard objectives add extract dummy 
scoreboard players set @a extract 0

tellraw @a ["",{"text":"[EXTRACTION]","color":"dark_gray"},{"text":" Map generated and game started!"}]

