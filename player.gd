extends CharacterBody2D

var dialogue_system = ResourceLoader.load("res://dialogue_system.tres")

@onready var sprite = $NormalSprite
@onready var animation_tree = $AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")
@onready var hit_box = $Marker2D/HitBox
@onready var hurt_box = $HurtBox
@onready var normal_animation = $NormalAnimation
@onready var attack_animation = $AttackAnimation

signal piano_touched

var stats = PlayerStats

const SPEED = 70

var touch_piano = false
var can_move = true
var sword_pick = false

enum {
	MOVE,
	ATTACK
}

var state = MOVE
var last_input_vector
var player_dead = false

func _ready():
	z_index = 2
	stats.no_health.connect(dead)
#	y_sort_enabled = true

func dead():
	player_dead = true
#	$Respawn_cooldown.start()
	await get_tree().create_timer(5).timeout
	player_dead = false
	global_position = Vector2(100,100)
	stats.health = 1

func respawn():
	pass
	
	
func _process(delta):
	if(player_dead == true):
		animation_state.travel("Dead")

func _physics_process(delta):
	match state:
		MOVE:
			move_state()
		ATTACK:
			attack_state()
			
func move_state():
	
	if(player_dead == false):
	
		var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		
		if(input_vector != Vector2.ZERO):
			last_input_vector = input_vector
			
	#	print("last_input_vector : ", last_input_vector)
		
		if can_move == true:
			if input_vector.x != 0:
				if(sword_pick == false):
					$NormalSprite.scale.x = sign(-input_vector.x)
				else:
					$AttackSprite.scale.x = sign(-input_vector.x)
				velocity.x = input_vector.x * SPEED
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
				
			if input_vector.y != 0:
				velocity.y = input_vector.y * SPEED
				if(sword_pick == false):
					$NormalSprite.scale.x = 1
				else:
					$AttackSprite.scale.x = 1
			else:
				velocity.y = move_toward(velocity.y, 0, SPEED)
				
	#		print(velocity)
				
			if input_vector != Vector2.ZERO:
				animation_tree.set("parameters/Idle/blend_position", input_vector)
				animation_tree.set("parameters/Walk/blend_position", input_vector)
				if(sword_pick == true):
					animation_tree.set("parameters/Dead/blend_position", input_vector)
					animation_tree.set("parameters/Respawn/blend_position", input_vector)
					animation_tree.set("parameters/Attack/blend_position", input_vector)
				
				animation_state.travel("Walk")
			
			else:
				animation_state.travel("Idle")
				
		if(sword_pick == true)	:
			if Input.is_action_just_pressed("attack"):
				if(last_input_vector.x < 0):
		#			print("attack left")
					hit_box.global_position.y = global_position.y - 7
					hit_box.global_position.x = global_position.x - 5
					hit_box.rotation_degrees = 0
					
				if(last_input_vector.x > 0):
		#			print("attack right")
					hit_box.global_position.y = global_position.y - 6
					hit_box.global_position.x = global_position.x + 21
					hit_box.rotation_degrees = 0
					
				if(last_input_vector.x == 0 and last_input_vector.y > 0):
		#			print("attack down")
					hit_box.global_position.y = global_position.y + 5
					hit_box.global_position.x = global_position.x + 13
					hit_box.rotation_degrees = 90
					
				if(last_input_vector.x == 0 and last_input_vector.y < 0):
		#			print("attack up")
					hit_box.global_position.y = global_position.y - 15
					hit_box.global_position.x = global_position.x + 10
					hit_box.rotation_degrees = 90
					
				state = ATTACK
				
		move_and_slide()
		
		for i in get_slide_collision_count():
			if(touch_piano == false):
				var collision = get_slide_collision(i)
				if(collision.get_collider().name == "Piano"):
						piano_touched.emit()
						touch_piano = true
	else:
		animation_state.travel("Dead")

func attack_state():
	velocity = Vector2.ZERO
	animation_state.travel("Attack")

func attack_animation_finished():
	state = MOVE

func _on_hurt_box_area_entered(area):
	stats.health -= area.damage
#	print("area.damage : ", area.damage)
#	print("stats.health : ", stats.health)
	$AudioStreamPlayer2D.play()

	hurt_box.create_hit_effect(Vector2(6,0))
	
func _on_sword_get_body_entered(body):
	if(body.name == "Sword"):
		if(sword_pick == false):
			sword_pick = true
			body.queue_free()
			$NormalSprite.visible = false
			$AttackSprite.visible = true
			animation_tree = $AttackAnimationTree
			animation_state = animation_tree.get("parameters/playback")


