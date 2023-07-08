extends Node2D


@onready var player = $Player
@onready var dialogue = $Node/Dialogue

const ENEMY_1 = preload("res://enemy_1.tscn")

var done1 = false
var dial_sys 



# Called when the node enters the scene tree for the first time.
func _ready():
	dial_sys = dialogue.dialogue_system


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	print(dial_sys.dialogue_index)
	
	if dial_sys.dialogue_index == 0:
		player.can_move = true
#		print(dialogue.timer_trigger_delay.time_left)

	if dial_sys.dialogue_index == 2:
		print("here")

	
	if dial_sys.dialogue_index == 1 and done1 == false:
		
		done1 = true
		for n in range(5):
			var enemy = ENEMY_1.instantiate()
			var world = get_tree().current_scene
			world.add_child(enemy)
#			enemy.y_sort_enabled = true
			var enemy_pos = Vector2.ZERO
			enemy_pos.x = randf_range(0,150)
			enemy_pos.y = randf_range(0,150)
			enemy.SPEED = (randf_range(5,25))
			enemy.global_position = enemy_pos
			
			
func create_enemy_1():
	pass

func _on_dialogue_test_dialogue():
	print("dialogue changed")

func _on_player_piano_touched():
	dial_sys.current_dialogue["go_to_next"] = true
