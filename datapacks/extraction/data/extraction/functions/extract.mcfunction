gamemode spectator @p
tellraw @a ["",{"text":"[EXTRACTION] ","color":"dark_gray"},{"selector":"@p"}, {"text":" found an exit!"}]
setblock ~ ~ ~ minecraft:air
kill @e[type=minecraft:armor_stand,tag=extract,limit=1,sort=nearest]

