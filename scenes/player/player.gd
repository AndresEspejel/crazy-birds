extends RigidBody2D

@export var force_multiplier: float

@onready var line_2d: Line2D = $Line2D

const MAX_DRAG_DISTANCE = 150.0
var is_dragged = false
var start_position


func _ready() -> void:
	start_position = position
	sleeping_state_changed.connect(_on_sleeping_state_changed)
	line_2d.clear_points()
	
func _physics_process(_delta: float) -> void:
	if is_dragged:
		drag()
		update_line()
		check_release()

func update_line():
	line_2d.clear_points()
	line_2d.add_point(to_local(start_position))
	line_2d.add_point(to_local(position))

func check_release():
	if Input.is_action_just_released("drag"):
		launch()

func drag():
	var mouse_position  = get_global_mouse_position()
	var drag_vertor = mouse_position - start_position
		
	if drag_vertor.length() > MAX_DRAG_DISTANCE:
		drag_vertor = drag_vertor.normalized() * MAX_DRAG_DISTANCE
	
	if drag_vertor.x > 0:
		drag_vertor.x = 0
	
	position = start_position + drag_vertor


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("drag"):
		is_dragged = true
	
func launch():
	is_dragged = false
	freeze = false
	var force_vector = (start_position - position)* force_multiplier
	apply_impulse(force_vector )
	line_2d.visible = false
	GameManager.increase_launches()
	SignalManager.player_launched.emit()

func  _on_sleeping_state_changed():
	queue_free()
