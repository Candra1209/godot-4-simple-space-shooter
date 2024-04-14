extends Area2D

var speed : int
var rotation_speed : int
var direction : float

signal collision

func _ready():
	var	ranVec := RandomNumberGenerator.new()

	var width = get_viewport().get_visible_rect().size[0]
	var randomX = ranVec.randi_range(0, width)
	var randomY = ranVec.randi_range(-150, -50)
	position = Vector2(randomX,randomY)
	
	speed = ranVec.randi_range(100,600)
	
	direction = ranVec.randf_range(-1,1)
	
	rotation_speed = ranVec.randi_range(5,20)
	

func _process(delta):
	position += Vector2(direction,1) * speed * delta
	rotation += rotation_speed * delta

func _on_body_entered(_body):
	collision.emit()


func _on_area_entered(area):
	area.queue_free()
	queue_free()
