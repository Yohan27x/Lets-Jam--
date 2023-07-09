extends RigidBody2D


var dialogue_system = ResourceLoader.load("res://dialogue_system.tres")
var fall_once = true

func _ready():
	global_position.y = -100
	global_position.x = 140
#	$Fly.seek(0.4)
#	$Fly.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	add_constant_force(Vector2(0,4))
	if(global_position.y > 50):
		freeze = true
		if(fall_once == true):
			fall_once = false

