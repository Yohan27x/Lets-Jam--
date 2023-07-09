extends Node2D

const ENEMY_1 = preload("res://enemy_1.tscn")
const KEBAB = preload("res://kebab.tscn")
const SHOOTER = preload("res://shooter.tscn")
var enemies = [ENEMY_1, KEBAB, SHOOTER]
# Called when the node enters the scene tree for the first time.

var rythm1_count = 0
var rythm2_count = 0
var rythm3_count = 0
var rythm4_count = 0

func _ready():
	pass

func _process(delta):
	
	if(rythm1_count >= 14):
		$Rythm2.start()
	
	if(rythm2_count >= 10):
		$Rythm3.start()
		
	if(rythm3_count >= 7):
		$Rythm4.start()
	
	if(rythm1_count < 14):
		if($Rythm1.is_stopped()):
			$Rythm1.start()
	elif(rythm2_count < 10):
		if($Rythm2.is_stopped()):
			$Rythm2.start()
	elif(rythm3_count < 7):
		if($Rythm3.is_stopped()):
			$Rythm3.start()	
	elif(rythm4_count < 10):
		if($Rythm4.is_stopped()):
			$Rythm4.start()		
			
			
func _on_rythm_1_timeout():
	rythm1_count += 1
	print("in instanciate enemy 1")
	var enemy = enemies.pick_random().instantiate()
	var main = get_tree().current_scene
	main.call_deferred("add_child", enemy) 
	enemy.global_position = Vector2(randf_range(20,200),randf_range(20,140))

func _on_rythm_2_timeout():
	rythm2_count += 1
	print("in instanciate enemy 2")
	var enemy = enemies.pick_random().instantiate()
	var main = get_tree().current_scene
	main.call_deferred("add_child", enemy) 
	enemy.global_position = Vector2(randf_range(20,200),randf_range(20,140))

func _on_rythm_3_timeout():
	rythm3_count += 1
	print("in instanciate enemy 3")
	var enemy = enemies.pick_random().instantiate()
	var main = get_tree().current_scene
	main.call_deferred("add_child", enemy) 
	enemy.global_position = Vector2(randf_range(20,200),randf_range(20,140))

func _on_rythm_4_timeout():
	rythm4_count += 1
	print("in instanciate enemy 4")
	var enemy = enemies.pick_random().instantiate()
	var main = get_tree().current_scene
	main.call_deferred("add_child", enemy) 
	enemy.global_position = Vector2(randf_range(20,200),randf_range(20,140))
