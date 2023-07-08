extends Node2D

var dialogue_system = ResourceLoader.load("res://dialogue_system.tres")

@onready var player = $Player
@onready var dialogue = $Node/Dialogue
@onready var introduction = $Introduction

const ENEMY_1 = preload("res://enemy_1.tscn")

var done1 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dialogue_system.dialogue_index == 0:
		player.can_move = true
#		print(dialogue.timer_trigger_delay.time_left)

	if dialogue_system.dialogue_index == 2:
		print("here")

	
	if dialogue_system.dialogue_index == 1 and done1 == false:
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
