extends Control

@export var level_schene : PackedScene = load("res://Scene/level.tscn")

func _ready():
	$BG/CenterContainer/VBoxContainer/Label2.text = $BG/CenterContainer/VBoxContainer/Label2.text + str(Global.score)
		
func _input(event):
	if event.is_action_pressed("Tembak"):
		get_tree().change_scene_to_packed(level_schene)
