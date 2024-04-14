extends Node2D

var random = RandomNumberGenerator.new()
@export var health: int = 3

func _ready():
	get_tree().call_group('UI', 'set_healt', health)
	
	var size := get_viewport().get_visible_rect().size
	for star in $Stars.get_children():
		var randomX = random.randi_range(0, int(size.x))
		var randomY = random.randi_range(0, int(size.y))
		star.position = Vector2(randomX,randomY)
		
		var randomScale = random.randf_range(1,2)
		star.scale = Vector2(randomScale, randomScale)
		
		star.speed_scale = random.randf_range(0.6,1.5)

func _on_meteor_timer_timeout():
	var meteor_schene: PackedScene =load("res://Scene/meteor_" + str(random.randi_range(1,4)) + ".tscn")
	var meteor = meteor_schene.instantiate()
	
	$Meteors.add_child(meteor)
	
	meteor.connect('collision',on_meteor_collision)

func on_meteor_collision() :
	health -= 1
	get_tree().call_group('UI', 'set_healt', health)
	if health <= 0 :
		print("Mati")
		get_tree().change_scene_to_file("res://Scene/GameOverUI.tscn")

func _on_pemain_laser(pos):
	var laser_Schene: PackedScene = load("res://Scene/laser_scene.tscn")
	var laser = laser_Schene.instantiate()
	$Laser.add_child(laser)
	laser.position = pos # Replace with function body.
