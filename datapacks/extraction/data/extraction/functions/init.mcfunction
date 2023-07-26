tellraw @a ["",{"text":"[EXTRACTION]","color":"dark_gray"},{"text":" Creating the map"}]

# Kill all armor stands
kill @e[tag=extract,type=minecraft:armor_stand]

# Reset all scoreboards
scoreboard objectives remove death
scoreboard objectives remove extract 

# Generate 5 armor stands
summon minecraft:armor_stand 0 100 0 {PersistenceRequired:1b,NoGravity:1b,Invulnerable:1,Tags:["extract"],Invisible:1b}
summon minecraft:armor_stand 0 100 0 {PersistenceRequired:1b,NoGravity:1b,Invulnerable:1,Tags:["extract"],Invisible:1b}
summon minecraft:armor_stand 0 100 0 {PersistenceRequired:1b,NoGravity:1b,Invulnerable:1,Tags:["extract"],Invisible:1b}
summon minecraft:armor_stand 0 100 0 {PersistenceRequired:1b,NoGravity:1b,Invulnerable:1,Tags:["extract"],Invisible:1b}
summon minecraft:armor_stand 0 100 0 {PersistenceRequired:1b,NoGravity:1b,Invulnerable:1,Tags:["extract"],Invisible:1b}

# Set up scoreboards
scoreboard objectives add death deathCount {"text":"Mort","color":"red"}
scoreboard objectives add extract dummy 
execute as @a run scoreboard players set @p death 0
execute as @a run scoreboard players set @p extract 0

# Set up armor stands
spreadplayers 0 0 100 450 false @e[tag=extract,type=minecraft:armor_stand]
execute as @e[tag=extract,type=minecraft:armor_stand] at @e[tag=extract,type=armor_stand] run setblock ~ ~ ~ minecraft:oak_trapdoor

# Set up the worldborder
gamemode spectator @a
tp @a 0 100 0
worldborder set 1000

# Set up the players
spreadplayers 0 0 25 450 false @a
gamemode survival @a

tellraw @a ["",{"text":"[EXTRACTION]","color":"dark_gray"},{"text":" Map generated and game started!"}]

