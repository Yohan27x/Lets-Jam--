extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")
@onready var stats = $Stats

const KILL_EFFECT = preload("res://kill_effect.tscn")

var SPEED = 25
var target = null
var GRAVITY = 20

var normalized_vel = Vector2.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.

func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate:a", 255, 5)
	await get_tree().create_timer(3).timeout
	tween.stop()

func _physics_process(delta):

	
	if(stats.health > 0):
#			if(has_been_creating):
		if(target != null):
#					if(is_instance_valid(target)):
			if $Attack_Timer.is_stopped() == false:
				animation_state.travel("Attack")
			else:
				seek()
				
	#			print(velocity)
		
				if velocity != Vector2.ZERO:
						animation_tree.set("parameters/Idle/blend_position", velocity)
						animation_tree.set("parameters/Walk/blend_position", velocity)
						animation_tree.set("parameters/Attack/blend_position", velocity)
					
						animation_state.travel("Walk")
					
				else:
					animation_state.travel("Idle")

#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
#
#	for i in get_slide_collision_count():
#		var collision = get_slide_collision(i)
#		print(collision)
				
	
	
func add_force(force):
	velocity += force
	
func seek():
	
	var player_vec = target.global_position
	player_vec.y -= 10
	var desired = player_vec - global_position
	
	desired = desired.normalized()
	desired *= SPEED
	
	var steer = desired - velocity
	steer *= 1
	steer = steer.limit_length(1)
	
	add_force(steer)


func _on_detection_zone_body_entered(body):
	if(body.name == "Player"):
			target = body	


func _on_stats_no_health():
#	var kill_effect = KILL_EFFECT.instantiate()
#	var main = get_tree().current_scene
#	main.call_deferred("add_child", kill_effect)
#	kill_effect.global_position = global_position
	$Dead.play()
	queue_free()
	
#	animation_player.play("dead")


func _on_hurt_box_area_entered(area):
	stats.health -= area.damage
#	$AudioStreamPlayer2D.play()

	$HurtBox.create_hit_effect(Vector2.ZERO)


func _on_hit_box_area_entered(area):
	$Attack_Timer.start()
