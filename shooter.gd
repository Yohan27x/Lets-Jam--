extends CharacterBody2D


const BULLET = preload("res://bullet.tscn")
const KILL_EFFECT = preload("res://kill_effect.tscn")

@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")

@export var RELOAD_SPEED = 4
@export var DAMAGE = 1
@export var HEALTH = 1
@export var BULLET_VELOCITY = 65

var SPEED = 65

@onready var stats = $Stats

var target = null


func _process(delta):
		if(stats.health > 0):
#			if(has_been_creating):
			if(target != null):
	#					if(is_instance_valid(target)):
		
				seek()
				
				if velocity != Vector2.ZERO:
						animation_tree.set("parameters/Walk/blend_position", velocity)
					
						animation_state.travel("Walk")
					
				else:
					animation_state.travel("Idle")

func _physics_process(delta):
	pass
	
	
func add_force(force):
	velocity += force
	
func seek():
	
	var player_vec = target.global_position
	player_vec.y -= 10
	var desired = player_vec - global_position
	
	desired = desired.normalized()
	desired *= SPEED
	
	var steer = desired - velocity
	steer = steer.limit_length(1)
	
	add_force(steer)

func _on_player_detection_body_entered(body):
	if(body.name == "Player"):
			target = body
			$Shoot.start()

func create_bullet():
	var bullet = BULLET.instantiate()
	var main = get_tree().current_scene
	main.call_deferred("add_child", bullet)
	bullet.damage = DAMAGE
	bullet.velocity = (target.global_position - global_position).normalized()
	bullet.velocity *= BULLET_VELOCITY
	bullet.global_position = global_position
		
func _on_shoot_timeout():
	$Shoot.wait_time = RELOAD_SPEED
	if(target.player_dead == false):
		create_bullet()
		$Shoot.start()


func _on_hurt_box_area_entered(area):
	$Stats.health -= area.damage
	$AudioStreamPlayer2D.play()
	$HurtBox.create_hit_effect(Vector2.ZERO)


func _on_stats_no_health():
#	var kill_effect = KILL_EFFECT.instantiate()
#	var main = get_tree().current_scene
#	main.call_deferred("add_child", kill_effect)
#	kill_effect.global_position = global_position
	queue_free()
#	animation_player.play("dead")
