execute at @e[tag=extract,type=minecraft:area_effect_cloud] if block ~ ~ ~ minecraft:oak_trapdoor[open=true] if score @p extract matches 0 run function extraction:extract
execute as @a[scores={death=1,isDead=0}] run function extraction:dead
execute at @e[tag=extract,type=minecraft:area_effect_cloud] run function extraction:area_effect_cloud

execute if score game.time config = game.tick config run function extraction:end
execute if score border.tick config = game.time config run function extraction:border

scoreboard players operation msg.mod config = game.time config
scoreboard players operation msg.mod config %= msg.time.tick config

execute if score msg.mod config matches 0 unless score game.time config matches 0 unless score border.tick config = game.time config run function extraction:remaining

scoreboard players add game.time config 1
