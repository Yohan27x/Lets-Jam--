extends Resource

class_name Dialogue_system

#var dialogue_text = [["yohan","test test test test test \ntest test test", 3, 0.02, 0], ["liz","deux \ndeux deux ",2 ,0.02 ,2],["ana","trois\ntrois trois ", 2,1,0]]
var dialogue_text = [
	{"speaker" : "yohan", "emotion" : "happy" , "text" : "bqsfdqsfqzerbo ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 0.5, "go_to_next" : true, "text_start_delay" : 7 },
	{"speaker" : "ana", "emotion" : "" , "text" : "bqsfdqsfqzerbo ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 0.5, "go_to_next" : true, "text_start_delay" : 0.01 },
	
]

var dialogue_index = 0
var current_dialogue = dialogue_text[dialogue_index]
