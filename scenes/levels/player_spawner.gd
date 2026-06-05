extends Marker2D

signal player_spawned(player_instance)

const PLAYER = preload("uid://dy4txvxwuj5v1")


func _ready() -> void:
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
	create_player()
	
