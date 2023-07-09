extends RigidBody2D

var dialogue_system = ResourceLoader.load("res://dialogue_system.tres")
var fall_once = true

func _ready():
	global_position.y = -100
	global_position.x = 80
	$Fly.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(global_position.y > 100):
		freeze = true
		if(fall_once == true):
			fall_once = false
			$Fall.play()
			$Fog.play("grounded")


func _on_fog_animation_finished():
	$Fog.visible = false
