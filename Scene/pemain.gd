extends CharacterBody2D

@export var speed_awal: int = 250
var isCanShoot : bool = true
signal laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var speed = speed_awal
	if(Input.is_action_pressed("SpeedBoost")):
		speed += 200
	
	var arah = Input.get_vector("Kiri", "kanan", "maju", "mundur")
	velocity = arah * speed
	move_and_slide()
	
	if(Input.is_action_pressed("Tembak") and isCanShoot):
		laser.emit($LaserPos.global_position)
		isCanShoot = false
		$LaserCooldown.start()


func _on_laser_cooldown_timeout():
	isCanShoot = true
