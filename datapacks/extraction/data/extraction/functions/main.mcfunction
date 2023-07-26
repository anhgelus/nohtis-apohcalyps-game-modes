execute at @e[tag=extract,type=armor_stand] if block ~ ~ ~ minecraft:oak_trapdoor[open=true] run function extraction:extract
execute as @a[scores={death=1}] run function extraction:dead
