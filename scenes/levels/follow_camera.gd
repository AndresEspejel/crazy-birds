extends Camera2D

var player
var start_position = Vector2(960.0,540.0)


func _process(delta: float) -> void:
	
	if player == null:
		return

	if player.position.x > position.x:
		position.x = player.position.x


func _on_player_spawner_player_spawned(player_instance) -> void:
	player = player_instance
	position = start_position
	
