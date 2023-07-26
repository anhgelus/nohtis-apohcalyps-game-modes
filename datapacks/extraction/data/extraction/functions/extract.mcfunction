gamemode spectator @p
tellraw @a ["",{"text":"[EXTRACTION] ","color":"dark_gray"},{"selector":"@p"}, {"text":" found an exit!"}]
setblock ~ ~ ~ minecraft:oak_trapdoor[open=false]
scoreboard players set @p extract 1
#setblock ~ ~ ~ minecraft:air
#kill @e[type=minecraft:armor_stand,tag=extract,limit=1,sort=nearest]

