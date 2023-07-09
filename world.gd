extends Node2D


@onready var player = $Player
@onready var dialogue = $Node/Dialogue

const ENEMY_1 = preload("res://enemy_1.tscn")
const KEBAB = preload("res://kebab.tscn")
const SHOOTER = preload("res://shooter.tscn")
var enemies = [ENEMY_1, KEBAB, SHOOTER]
const PIANO = preload("res://piano.tscn")
const SWORD = preload("res://sword.tscn")
const SPAWNER = preload("res://enemy_spawner.tscn")

var spawn_first_mob = false
var spawn_piano = false
var spawn_sword = false
var last_wave = false
var move_player_itself = false
var first_enemy = false
var right_input = false
var dial_sys 

var on_test = false

var spawner


var game_over = false
var one_time = false


# Called when the node enters the scene tree for the first time.
func _ready():
	dial_sys = dialogue.dialogue_system
	player.play_main_sound.connect(play_piano)

func play_piano():
	$Begin.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if dial_sys.dialogue_index == 0:
		pass
#		print(dialogue.timer_trigger_delay.time_left)
		
		
#	if dial_sys.dialogue_index == 1 and on_test == false:
#		on_test = true
#		player.set_good_input()
#		var enemy = KEBAB.instantiate()
#		var world = get_tree().current_scene
#		world.add_child(enemy)
#		var enemy_pos = Vector2(100,100)
#		enemy.global_position = enemy_pos
#
#		var enemy_shooter = ENEMY_1.instantiate()
#		var world2 = get_tree().current_scene
#		world2.call_deferred("add_child", enemy_shooter)
#		var enemy_shooter_pos = Vector2(150,40)
#		enemy_shooter.global_position = enemy_shooter_pos
#
#		var sword = SWORD.instantiate()
#		var main = get_tree().current_scene
#		main.call_deferred("add_child", sword)
#

	if dial_sys.dialogue_index == 1 and move_player_itself == false:
		player.move_player()
		move_player_itself = true
		# WOOOW IL A BOUG2
		await get_tree().create_timer(1).timeout
		dial_sys.current_dialogue["go_to_next"] = true
#
	if dial_sys.dialogue_index == 3  and dialogue.is_complete:

		player.set_wrong_input()
#
	if dial_sys.dialogue_index == 6 and dialogue.is_complete and right_input == false:
		right_input = true
		player.set_good_input()

	if dial_sys.dialogue_index == 7 and dialogue.is_complete and last_wave == false:
		print("woldgd statrt last_wave")
		last_wave = true
		spawner = SPAWNER.instantiate()
		var main = get_tree().current_scene
		main.call_deferred("add_child", spawner)
		
		var sword = SWORD.instantiate()
		main.call_deferred("add_child", sword)
		
		
	if(last_wave == true):
		if spawner.rythm3_count > 0:
			if player.player_dead == true and game_over == false:
				print("worldgd game is over ")
				player.game_is_over = true
				game_over = true
				get_tree().change_scene_to_file("res://conclusion.tscn")
				
	if(game_over == true and one_time == false):
		one_time = true
		$Timer_game_over.start()
		
#	print("$Fade.modulate.a :", $Fade.modulate.a)
		
#	if($Fade.modulate.a > 180):
#		get_tree().change_scene_to_file("res://conclusion.tscn")
		
#	if dial_sys.dialogue_index == 3 and last_wave == false:
#		print("woldgd statrt last_wave")
#		last_wave = true
#		var spawner = SPAWNER.instantiate()
#		var main = get_tree().current_scene
#		main.call_deferred("add_child", spawner)
	
#	if dial_sys.dialogue_index == 1 and spawn_first_mob == false:
#
#		spawn_first_mob = true
#		for n in range(1):
#			var enemy = ENEMY_1.instantiate()
#			var world = get_tree().current_scene
#			world.add_child(enemy)
##			enemy.y_sort_enabled = true
#			var enemy_pos = Vector2.ZERO
#			enemy_pos.x = randf_range(0,150)
#			enemy_pos.y = randf_range(0,150)
#			enemy.SPEED = (randf_range(5,25))
#			enemy.global_position = enemy_pos
			
			


func _on_player_piano_touched():
	print("piano touched")
	dial_sys.current_dialogue["go_to_next"] = true

func _on_player_move_first():
	$CreatePiano.start()

func _on_create_piano_timeout():
	spawn_piano = true
	var piano = PIANO.instantiate()
	var main = get_tree().current_scene
	main.call_deferred("add_child", piano)

func _on_begin_finished():
	$Loop.play()

#func _on_timer_game_over_timeout():
#	var tween = get_tree().create_tween()
#	tween.tween_property($Fade, "modulate:a", 5, 5)
#	await get_tree().create_timer(3).timeout
#	tween.stop()

