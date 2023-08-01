scoreboard players operation msg.remaining.tick config = game.tick config
scoreboard players operation msg.remaining.tick config -= game.time config
scoreboard players operation msg.remaining.second config = msg.remaining.tick config
scoreboard players operation msg.remaining.second config /= time.tick config
scoreboard players operation msg.remaining.min config = msg.remaining.second config
scoreboard players operation msg.remaining.min config /= time.second config

scoreboard players set game.started config 1 
tellraw @a ["",{"text":"[EXTRACTION]","color":"dark_gray"},{"text":" Time remaining: "},{"score":{"name":"msg.remaining.min","objective":"config"}},{"text":" minutes"}]

