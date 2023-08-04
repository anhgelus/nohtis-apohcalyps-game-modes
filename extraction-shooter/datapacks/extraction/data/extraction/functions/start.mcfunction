tellraw @a ["",{"text":"[EXTRACTION]","color":"dark_gray"},{"text":" Creating the map"}]
# update config
scoreboard players operation game.second config = game.min config
scoreboard players operation game.second config *= time.second config
scoreboard players operation game.tick config = game.second config
scoreboard players operation game.tick config *= time.tick config
scoreboard players set game.time config 0

scoreboard players operation border.second config = border.min config
scoreboard players operation border.second config *= time.second config
scoreboard players operation border.tick config = border.second config
scoreboard players operation border.tick config *= time.tick config

scoreboard players operation msg.time.second config = msg.time.min config
scoreboard players operation msg.time.second config *= time.second config
scoreboard players operation msg.time.tick config = msg.time.second config
scoreboard players operation msg.time.tick config *= time.tick config

scoreboard players operation border.size.real config = border.size config

scoreboard players set game.player.total config 0
scoreboard players set game.player.spectator config 0

# Kill all armor stands
execute at @e[tag=extract,type=minecraft:area_effect_cloud] run setblock ~ ~ ~ minecraft:air
kill @e[tag=extract,type=minecraft:area_effect_cloud]

# Reset all scoreboards
scoreboard objectives remove death
scoreboard objectives remove isDead 
scoreboard objectives remove isInGame

# Reset players
execute as @a unless score @s extract matches 1 run clear @s
execute as @a unless score @s extract matches 1 run effect clear @s
effect clear @a hordes:infected 

# Generate armor stands
tellraw @a ["",{"text":"[EXTRACTION]","color":"dark_gray"},{"text":" Generating the exits..."}]
summon minecraft:area_effect_cloud 0 100 0 {Duration:2147483647,Tags:["extract"]}
summon minecraft:area_effect_cloud 0 100 0 {Duration:2147483647,Tags:["extract"]}
summon minecraft:area_effect_cloud 0 100 0 {Duration:2147483647,Tags:["extract"]}
#summon minecraft:armor_stand 0 100 0 {PersistenceRequired:1b,NoGravity:1b,Invulnerable:1,Tags:["extract"],Invisible:1b}

# Set up scoreboards
scoreboard objectives add death deathCount {"text":"Mort","color":"red"}
scoreboard objectives add isDead dummy
scoreboard objectives add isInGame dummy
scoreboard players set @a death 0
scoreboard players set @a isDead 0 

# Set up armor stands
spreadplayers 0 0 40 100 false @e[tag=extract,type=minecraft:area_effect_cloud]
execute as @e[tag=extract,type=minecraft:area_effect_cloud] at @e[tag=extract,type=area_effect_cloud] run setblock ~ ~ ~ minecraft:oak_trapdoor
tellraw @a ["",{"text":"[EXTRACTION]","color":"dark_gray"},{"text":" Exits generated!"}]

# Set up the worldborder
gamemode spectator @a
tp @a 0 100 0
function extraction:private/border/setup

# Set up the players
spreadplayers 0 0 25 100 false @a
gamemode survival @a
execute as @a unless score @s extract matches 1 run function extraction:starter_kit
execute as @a run scoreboard players add game.player.total config 1 
execute as @a run scoreboard players add @s isInGame 1
scoreboard objectives remove extract
scoreboard objectives add extract dummy 
scoreboard players set @a extract 0

scoreboard players set game.started config 1 
tellraw @a ["",{"text":"[EXTRACTION]","color":"dark_gray"},{"text":" Map generated and game started!"}]

