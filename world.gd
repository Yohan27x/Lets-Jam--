extends Node2D


@onready var player = $Player
@onready var dialogue = $Node/Dialogue

const ENEMY_1 = preload("res://enemy_1.tscn")
const PIANO = preload("res://piano.tscn")
const SWORD = preload("res://sword.tscn")
const SPAWNER = preload("res://enemy_spawner.tscn")

var spawn_first_mob = false
var spawn_piano = false
var spawn_sword = false
var big_wave = false
var dial_sys 



# Called when the node enters the scene tree for the first time.
func _ready():
	dial_sys = dialogue.dialogue_system


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(player == null):
		pass
	
#	print(dial_sys.dialogue_index)
	
	if dial_sys.dialogue_index == 0:
		player.can_move = true
#		print(dialogue.timer_trigger_delay.time_left)

	if dial_sys.dialogue_index == 2 and spawn_piano == false:
		spawn_piano = true
		var piano = PIANO.instantiate()
		var main = get_tree().current_scene
		main.call_deferred("add_child", piano)
		
	if dial_sys.dialogue_index == 2 and spawn_sword == false:
		spawn_sword = true
		var sword = SWORD.instantiate()
		var main = get_tree().current_scene
		main.call_deferred("add_child", sword)
		
	if dial_sys.dialogue_index == 3 and big_wave == false:
		print("woldgd statrt big wave")
		big_wave = true
		var spawner = SPAWNER.instantiate()
		var main = get_tree().current_scene
		main.call_deferred("add_child", spawner)
	
	if dial_sys.dialogue_index == 1 and spawn_first_mob == false:

		spawn_first_mob = true
		for n in range(1):
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
	print("piano touched")
	dial_sys.current_dialogue["go_to_next"] = true

