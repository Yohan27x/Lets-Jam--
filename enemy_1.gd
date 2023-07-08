extends CharacterBody2D


var SPEED = 10

const KILL_EFFECT = preload("res://kill_effect.tscn")


@onready var timer_attack_cooldown = $Attack_cooldown
@export var attack_cooldown = 0.25
@export var aggro = 2.5
@export var turn_direction = 0.3

var target = null
var has_been_creating = false : set = set_creating, get = get_creating

@onready var animation_player = $AnimationPlayer
@onready var stats = $Stats
@onready var hurt_box = $HurtBox
@onready var attack_zone = $AttackZone
@onready var hit_box = $HitBox

var direction = "" : set = set_direction, get = get_direction

var can_attack = true
var is_attacking = false : set = set_is_attacking, get = get_is_attacking
var can_change_direction = false

signal player_moved(new_dir)


func set_direction(value):
	direction = value
	
	
func get_direction():
	return direction

func set_is_attacking(value):
	is_attacking = value
	return is_attacking
	
func get_is_attacking():
	return is_attacking

func get_creating():
	return has_been_creating
	
func set_creating(value):
	has_been_creating = value

func _ready():
	animation_player.play("create")
	timer_attack_cooldown.wait_time = aggro
	timer_attack_cooldown.start()
	
	
func _process(delta):
	
	
#	print("can attack :", can_attack)
#	print(timer_attack_cooldown.time_left)
	
	if(stats.health > 0):
	
		if direction == "down":
			hit_box.global_position.y = global_position.y + 6
			hit_box.global_position.x = global_position.x 
			hit_box.rotation_degrees = 0
			
			attack_zone.global_position.y = global_position.y + 6
			attack_zone.global_position.x = global_position.x 
			attack_zone.rotation_degrees = 0
			
			if(is_attacking == false):
				animation_player.play("walk_down")
			
		elif direction == "up":
			hit_box.global_position.y = global_position.y - 15
			hit_box.global_position.x = global_position.x 
			hit_box.rotation_degrees = 0
			
			attack_zone.global_position.y =global_position.y - 15
			attack_zone.global_position.x = global_position.x 
			attack_zone.rotation_degrees = 0
			
			if(is_attacking == false):
				animation_player.play("walk_up")

func _physics_process(delta):

		if(stats.health > 0):
			if(has_been_creating):
				if(target != null):
					
					seek()
					
					if(animation_player.current_animation.contains("attack")):
						velocity = Vector2.ZERO
					
					if velocity.y > 0 :
						if(direction != "down"):
							player_moved.emit("down")
					elif velocity.y < 0 :
						if(direction != "up"):
							player_moved.emit("up")
						
					move_and_slide()
					
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
	
func _on_detection_zone_body_entered(body):
		if(body.name == "Player"):
			target = body

func _on_hurt_box_area_entered(area):
	if has_been_creating:
		stats.health -= area.damage
		$AudioStreamPlayer2D.play()

		hurt_box.create_hit_effect(Vector2.ZERO)

func _on_attack_zone_body_entered(body):
	if can_attack and timer_attack_cooldown.is_stopped():
		print("in attack")
		is_attacking = true
		animation_player.play("attack_" + direction)
		animation_player.queue("RESET")
		timer_attack_cooldown.wait_time = attack_cooldown
		timer_attack_cooldown.start()
		can_attack = false
		
func _on_attack_cooldown_timeout():
	can_attack = true
	
func _on_stats_no_health():
	var kill_effect = KILL_EFFECT.instantiate()
	var main = get_tree().current_scene
	main.call_deferred("add_child", kill_effect)
	kill_effect.global_position = global_position
	animation_player.play("dead")


func _on_player_moved(new_dir):
	await get_tree().create_timer(turn_direction).timeout
	direction = new_dir
