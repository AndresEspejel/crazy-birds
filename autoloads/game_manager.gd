extends Node

const MAIN = preload("uid://cngwgwnq6sb7o")
const SCORES_SCREEN = preload("uid://cborgp7ieargf")

const LEVELS = {
	1: preload("uid://bx23w4j41er22"),
	2: preload("uid://fdync7x71unf"),
	3: preload("uid://c7hh527ko7kmv"),
}

var levels_launches = {}

var launches = 0
var current_level = 0
var enemies_left


func add_level_launches():
	levels_launches[current_level] = launches


func increase_launches():
	launches += 1

func decrease_enemies_left():
	enemies_left -= 1
	if enemies_left == 0:
		add_level_launches()
		SignalManager.level_completed.emit()


func load_next_level():
	current_level += 1
	if current_level <= LEVELS.size():
		get_tree().change_scene_to_packed(LEVELS[current_level])
		launches = 0
	else:
		get_tree().change_scene_to_packed(SCORES_SCREEN)

func set_enemies_left(enemies):
	enemies_left = enemies

func reset_game():
	launches = 0
	current_level = 0
	get_tree().change_scene_to_packed(MAIN)

	
