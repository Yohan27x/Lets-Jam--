extends Resource
class_name DialogueSystem3

var dialogue_text = [
	{"speaker" : "yohan", "text" : "we are in teh game !!! ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 1, "go_to_next" : true, "text_start_delay" : 0.5  },
	{"speaker" : "ana", "text" : "ouaf oauf oauf  ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.4, "ready" : false, "stay_on_screen" : 2, "go_to_next" : true, "text_start_delay" : 0.01 },
	{"speaker" : "liz", "text" : "bababab\nbobo ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 3, "go_to_next" : true, "text_start_delay" : 0.01 },
#	{"speaker" : "liz", "text" : "rtyertyertyerty ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 3, "go_to_next" : true },
]

var dialogue_index = 0
var current_dialogue = dialogue_text[dialogue_index]
