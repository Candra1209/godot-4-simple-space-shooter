extends CanvasLayer

var time_elipsed := 0

func set_healt(amount):
	print("UI" + str( amount))
	
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
		
	for i in amount:
		var	text_react = TextureRect.new()
		text_react.texture = load("res://Sprites/UI/playerLife1_green.png")
		
		$MarginContainer2/HBoxContainer.add_child(text_react)
		text_react.stretch_mode = TextureRect.STRETCH_KEEP


func _on_score_timer_timeout():
	time_elipsed += 1
	$MarginContainer/Label.text = str(time_elipsed)
	Global.score = time_elipsed
