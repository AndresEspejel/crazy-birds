extends Marker2D

signal player_spawned(player_instance)

const PLAYER = preload("uid://dy4txvxwuj5v1")


var can_spawn = true

func _ready() -> void:
	SignalManager.level_completed.connect(_on_level_completed)
	create_player()

func _process(delta: float) -> void:
	pass

func create_player():
	var player_instance = PLAYER.instantiate()
	add_sibling.call_deferred(player_instance)
	player_instance.position = position
	player_instance.tree_exited.connect(_on_player_tree_exited)
	player_spawned.emit(player_instance)
	
func _on_player_tree_exited():
	if can_spawn:
		create_player()
	
func _on_level_completed():
	can_spawn = false
