extends Resource
class_name DialogueSystem3

var dialogue_text = [
	{"speaker" : "yohan", "emotion" : "happy" , "text" : "How did we end up here?", "dialogue_speed" : 0.1, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 2, "go_to_next" : true, "text_start_delay" : 3.2 },
]

var dialogue_index = 0
var current_dialogue = dialogue_text[dialogue_index]
