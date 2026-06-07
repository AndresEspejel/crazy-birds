extends Control

@onready var v_box_container: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer

func _ready() -> void:
	for level in GameManager.levels_launches:
		var label = Label.new()
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		label.text = "level "+ str(level)+" : " + str(GameManager.levels_launches[level])
		v_box_container.add_child(label)
	
	var button = Button.new()
	button.alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.text = "Go back"
	v_box_container.add_child(button)
	button.pressed.connect(_on_button_pressed)

func _on_button_pressed():
	GameManager.reset_game()
