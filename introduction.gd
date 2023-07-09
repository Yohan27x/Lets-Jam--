extends Node

@export var dialogue_system = ResourceLoader.load("res://dialogue_system.tres")
@onready var color_rect = $ColorRect
@onready var timer = $Timer
@onready var dialogue = $Dialogue



# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	print(dialogue_system.dialogue_index)
	
	if(name == "Conclusion"):
		if(dialogue.is_complete):
			var tween = get_tree().create_tween()
			tween.tween_property(color_rect, "modulate:a", 5, 3)
			await get_tree().create_timer(3).timeout
			tween.stop()
			get_tree().change_scene_to_file("res://credits.tscn")

func _on_dialogue_switch_to_game():
	print("in signal")
	get_tree().change_scene_to_file("res://world.tscn")
	

func _on_timer_timeout():
	var tween = get_tree().create_tween()
	tween.tween_property(color_rect, "modulate:a", 0, 3)
	await get_tree().create_timer(3).timeout
	tween.stop()
	color_rect.modulate.a = 0
