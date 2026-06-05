extends RigidBody2D

@export var explosion_scene: PackedScene

@export var velocity_threshold: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered) # Replace with function body.



func _on_body_entered (body: Node):
	if body.is_in_group("player"):
		destroy_enemy()
		return
	if body is RigidBody2D and body.linear_velocity.length()> velocity_threshold:
		destroy_enemy()

func destroy_enemy():
	create_explosion()
	queue_free()


func create_explosion():
	var explotion_instance = explosion_scene.instantiate()
	explotion_instance.position = position
	add_sibling(explotion_instance)
