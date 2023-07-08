extends Label

#var count = -1
#
#@onready var timer = $"../Timer"
#
#var dialogue_text = [["test test test test test \ntest test test", 3, 0.02], ["deux \ndeux deux ", 2,0.2],["trois\ntrois trois ", 2,1]]
#var dialogue_index = 0
#var current_dialogue = dialogue_text[dialogue_index][0]
#var dialogue_speed = dialogue_text[dialogue_index][2]
#
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	timer.wait_time = dialogue_speed
#	var text = ""
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
#
#
#func check_end_text():
#
#	if count == len(current_dialogue) -1 and dialogue_index < len(dialogue_text) -1:
#		await get_tree().create_timer(dialogue_text[dialogue_index][1]).timeout
#		count = -1
#		dialogue_index += 1
#		current_dialogue = dialogue_text[dialogue_index][0]
#		timer.wait_time = dialogue_text[dialogue_index][2]
#		text = ""
#		print(current_dialogue)
#
#
#func next_letter_text():
#
#	count += 1
#	text += current_dialogue[count]
#	set_text(text)
#
#	check_end_text()
#
#
#func _on_timer_timeout():
#	if(count < len(current_dialogue) -1):
#		next_letter_text()
