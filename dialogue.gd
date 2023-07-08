extends Control

var count = -1


@onready var timer_dialogue_speed = $Dialogue_speed
@onready var timer_stay_on_screen = $Stay_on_screen
@onready var timer_trigger_delay = $Trigger_delay
@onready var label = $Text
@onready var icon = $Icon

signal test_dialogue

var yohan_icon = preload("res://assets/yohan_talk.png")
var liz_icon = preload("res://assets/liz_talk.png")
var ana_icon = preload("res://assets/anaelle_talk.png")

var dialogue_system = ResourceLoader.load("res://dialogue_system.tres")

var text = ""

signal switch_to_game

# Called when the node enters the scene tree for the first time.
func _ready():
	
	timer_stay_on_screen.wait_time = dialogue_system.current_dialogue["stay_on_screen"]
	
	timer_trigger_delay.wait_time = dialogue_system.current_dialogue["delay_after_trigger"]
	timer_trigger_delay.start()
	visible = false

	timer_dialogue_speed.wait_time = dialogue_system.current_dialogue["dialogue_speed"]
	timer_dialogue_speed.start()
	
	icon.texture = get_icon(dialogue_system.current_dialogue)
	
func _process(delta):
	if(dialogue_system.dialogue_index == 3):
		switch_to_game.emit()
		
#	print(dialogue_system.current_dialogue["speaker"])
#	print(dialogue_system.current_dialogue["go_to_next"])
	pass
#	if(dialogue_system.current_dialogue["go_to_next"] == false):
#		visible = false
	
	
func change_next_text():
	#		emit_signal("test_dialogue")
			dialogue_system.dialogue_index += 1
			dialogue_system.current_dialogue = dialogue_system.dialogue_text[dialogue_system.dialogue_index]
			text = ""
			label.set_text(text)
			count = -1
			
			timer_dialogue_speed.wait_time = dialogue_system.current_dialogue["dialogue_speed"]
			timer_stay_on_screen.wait_time =  dialogue_system.current_dialogue["stay_on_screen"]
			
			timer_trigger_delay.wait_time = dialogue_system.current_dialogue["delay_after_trigger"]
			timer_trigger_delay.start()
			
			if(dialogue_system.current_dialogue["delay_after_trigger"] > 0.02):
				visible = false
			
			icon.texture = get_icon(dialogue_system.current_dialogue)
			
func next_letter_text():
	
	if((count < len(dialogue_system.current_dialogue["text"]) -1) and visible == true):
		count += 1
		text += dialogue_system.current_dialogue["text"][count]
		label.set_text(text)
		
	check_end_text()
		
				
func check_end_text():
#		if(dialogue_system.current_dialogue["go_to_next"] == true):
				if((count == len(dialogue_system.current_dialogue["text"]) -1) and dialogue_system.dialogue_index < len(dialogue_system.dialogue_text) -1):
					if(timer_stay_on_screen.is_stopped()):
						print("in")
						timer_stay_on_screen.start()

func _on_timer_timeout():
	if(dialogue_system.current_dialogue["ready"] == true):
		next_letter_text()
		
func get_icon(dialogue):
	if(dialogue["speaker"] == "yohan"):
		return yohan_icon
	elif(dialogue["speaker"] == "liz"):
		return liz_icon
	else:
		return ana_icon
		
func _on_trigger_delay_timeout():
#	if(dialogue_system.current_dialogue["go_to_next"] != false):
		visible = true
		dialogue_system.current_dialogue["ready"] = true
	
func _on_stay_on_screen_timeout():
	# quand stay screen fini, go au prochain text
	if(dialogue_system.current_dialogue["go_to_next"] == true):
		visible = true
		change_next_text()
	else:
		visible = false
		timer_stay_on_screen.wait_time = 0.02
		timer_stay_on_screen.start()
		


