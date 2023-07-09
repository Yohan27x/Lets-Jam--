extends Resource
class_name DialogueSystem3

var dialogue_text = [
	{"speaker" : "yohan", "emotion" : "happy" , "text" : "C'est la fin enfin bordel ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 0.5, "go_to_next" : true, "text_start_delay" : 0.01 },
]

var dialogue_index = 0
var current_dialogue = dialogue_text[dialogue_index]
