tellraw @a ["",{"text":"[EXTRACTION] ","color":"dark_gray"},{"selector":"@s"}, {"text":" is dead!"}]
gamemode spectator @s
scoreboard players set @s isDead 1
scoreboard players add game.player.spectator config 1

