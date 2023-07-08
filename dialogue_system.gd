extends Resource

class_name Dialogue_system

#var dialogue_text = [["yohan","test test test test test \ntest test test", 3, 0.02, 0], ["liz","deux \ndeux deux ",2 ,0.02 ,2],["ana","trois\ntrois trois ", 2,1,0]]
var dialogue_text = [
	{"speaker" : "yohan", "text" : "test test sdf qsdf qsdfds ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 1, "go_to_next" : false },
	{"speaker" : "ana", "text" : "ouaf oauf oauf  ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 1, "go_to_next" : true },
	{"speaker" : "liz", "text" : "bababab\nbobo ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 3, "go_to_next" : true },
]

var dialogue_index = 0
var current_dialogue = dialogue_text[dialogue_index]
