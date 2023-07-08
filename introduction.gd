extends Node

var dialogue_system = ResourceLoader.load("res://dialogue_system.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(dialogue_system.dialogue_index == 3):
		pass


func _on_dialogue_switch_to_game():
	
