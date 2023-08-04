execute at @e[tag=extract,type=minecraft:area_effect_cloud] if score border.tick config < game.time config if block ~ ~ ~ minecraft:oak_trapdoor[open=true] if score @p extract matches 0 run function extraction:private/extract
execute at @e[tag=extract,type=minecraft:area_effect_cloud] unless score border.tick config < game.time config if block ~ ~ ~ minecraft:oak_trapdoor[open=true] if score @p extract matches 0 run setblock ~ ~ ~ minecraft:oak_trapdoor[open=true]
execute as @a[scores={death=1,isDead=0}] run function extraction:private/dead
execute at @e[tag=extract,type=minecraft:area_effect_cloud] run function extraction:private/area_effect_cloud

execute if score game.started config matches 1 if score game.time config = game.tick config run function extraction:private/end
execute if score game.started config matches 1 if score border.tick config = game.time config run function extraction:private/border

scoreboard players operation msg.mod config = game.time config
scoreboard players operation msg.mod config %= msg.time.tick config

execute if score msg.mod config matches 0 unless score game.time config matches 0 unless score border.tick config = game.time config run function extraction:private/remaining

execute if score game.started config matches 1 run scoreboard players add game.time config 1
