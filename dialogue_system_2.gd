extends Resource
class_name DialogueSystem2

var dialogue_text = [
	{"speaker" : "yohan", "emotion" : "" ,"text" : "we are in teh game !!! ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 0.01, "go_to_next" : true, "text_start_delay" : 0.5  },
	{"speaker" : "ana", "emotion" : "happy" , "text" : "ouaf oauf oauf  ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.4, "ready" : false, "stay_on_screen" : 0.01, "go_to_next" : true, "text_start_delay" : 0.01 },
	{"speaker" : "liz", "emotion" : "happy" , "text" : "bababab\nbobo ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 0.5, "go_to_next" : false, "text_start_delay" : 0.01 },
	{"speaker" : "yohan", "emotion" : "" , "text" : "bqsfdqsfqzerbo ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 0.5, "go_to_next" : true, "text_start_delay" : 0.01 },
]

var dialogue_index = 0
var current_dialogue = dialogue_text[dialogue_index]

