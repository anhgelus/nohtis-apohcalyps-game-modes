execute if score border.size.real config matches 100.. run function extraction:private/border/setup_big
execute if score border.size.real config matches 50..99 run function extraction:private/border/setup_middle
execute if score border.size.real config matches 25..49 run function extraction:private/border/setup_normal
execute if score border.size.real config matches 1..24 run function extraction:private/border/setup_little
execute if score border.size.real config matches 1.. run function extraction:private/border/setup
