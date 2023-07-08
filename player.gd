extends CharacterBody2D

var dialogue_system = ResourceLoader.load("res://dialogue_system.tres")

@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")

@onready var hit_box = $Marker2D/HitBox
@onready var hurt_box = $HurtBox



var stats = PlayerStats

const SPEED = 70

var touch_piano = false
var can_move = true

enum {
	MOVE,
	ATTACK
}

var state = MOVE

var last_input_vector

func _ready():
	z_index = 2
#	y_sort_enabled = true


func _physics_process(delta):
	match state:
		MOVE:
			move_state()
		ATTACK:
			attack_state()

func move_state():
	
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if(input_vector != Vector2.ZERO):
		last_input_vector = input_vector
		
#	print("last_input_vector : ", last_input_vector)

		
	if can_move == true:
		if input_vector.x != 0:
			velocity.x = input_vector.x * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
		if input_vector.y != 0:
			velocity.y = input_vector.y * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
			
#		print(velocity)
			
		if input_vector != Vector2.ZERO:
			animation_tree.set("parameters/Idle/blend_position", input_vector)
			animation_tree.set("parameters/Walk/blend_position", input_vector)
			animation_tree.set("parameters/Attack/blend_position", input_vector)
			
			animation_state.travel("Walk")
		
		else:
			animation_state.travel("Idle")
			
						
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
					dialogue_system.current_dialogue["go_to_next"] = true
					touch_piano = true

func attack_state():
	velocity = Vector2.ZERO
	animation_state.travel("Attack")

func attack_animation_finished():
	state = MOVE


func _on_hurt_box_area_entered(area):
	stats.health -= area.damage
	$AudioStreamPlayer2D.play()

	print("player scrpit / player hit ")
	hurt_box.create_hit_effect(Vector2(6,0))
	
