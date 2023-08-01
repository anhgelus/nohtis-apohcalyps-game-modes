execute at @e[tag=extract,type=minecraft:area_effect_cloud] if block ~ ~ ~ minecraft:oak_trapdoor[open=true] if score @p extract matches 0 run function extraction:extract
execute as @a[scores={death=1,isDead=0}] run function extraction:dead
execute at @e[tag=extract,type=minecraft:area_effect_cloud] run function extraction:area_effect_cloud
