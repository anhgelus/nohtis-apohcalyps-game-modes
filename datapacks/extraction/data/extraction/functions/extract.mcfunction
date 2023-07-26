gamemode spectator @p
tellraw @a ["",{"text":"[EXTRACTION] ","color":"dark_gray"},{"selector":"@p"}, {"text":" found an exit!"}]
setblock ~ ~ ~ minecraft:air
kill @a[type=armor_stand,tag=extract,limit=1,sort=nearest]

