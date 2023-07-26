execute at @e[tag=extract,type=minecraft:armor_stand] if block ~ ~ ~ minecraft:oak_trapdoor[open=true] if score @p extract matches 0 run function extraction:extract
execute as @a[scores={death=1}] run function extraction:dead
execute at @e[tag=extract,type=minecraft:armor_stand] run function extraction:armor_stand
