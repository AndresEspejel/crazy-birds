extends Node

const MAIN = preload("uid://cngwgwnq6sb7o")

const LEVELS = {
	1:  preload("uid://bx23w4j41er22"),
	2: preload("uid://fdync7x71unf"),
	3: preload("uid://c7hh527ko7kmv"),
}

var current_level = 0
var enemies_left

func decrease_enemies_left():
	enemies_left -= 1
	if enemies_left == 0:
		load_next_level.call_deferred()


func load_next_level():
	current_level += 1
	if current_level <= LEVELS.size():
		get_tree().change_scene_to_packed(LEVELS[current_level])
	else:
		print("FIN DEL JUEGO: "+ str(current_level))

func set_enemies_left(enemies):
	enemies_left = enemies
