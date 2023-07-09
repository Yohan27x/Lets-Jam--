extends Resource

class_name Dialogue_system

#var dialogue_text = [["yohan","test test test test test \ntest test test", 3, 0.02, 0], ["liz","deux \ndeux deux ",2 ,0.02 ,2],["ana","trois\ntrois trois ", 2,1,0]]
var dialogue_text = [
	{"speaker" : "ana", "emotion" : "" , "text" : "...", "dialogue_speed" : 1, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 0.5, "go_to_next" : true, "text_start_delay" : 5 },
	{"speaker" : "ana", "emotion" : "" , "text" : "This theme sucks !", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 2, "go_to_next" : true, "text_start_delay" : 1 },
	{"speaker" : "yohan", "emotion" : "" , "text" : "What's with this 'reversed' roles idea ? ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 1.5, "go_to_next" : true, "text_start_delay" : 0.01 },
	{"speaker" : "liz", "emotion" : "" , "text" : "Well, it would have been better if it\nwas just reversed instead... ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 2, "go_to_next" : true, "text_start_delay" : 0.01 },
	{"speaker" : "yohan", "emotion" : "happy" , "text" : "Yep.", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 1.7, "go_to_next" : true, "text_start_delay" : 0.01 },
	{"speaker" : "ana", "emotion" : "" , "text" : "I don't even know where to start!", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 1.6, "go_to_next" : true, "text_start_delay" : 0.01 },
	{"speaker" : "liz", "emotion" : "happy" , "text" : "Well, I don't know… just draw a\ncharacter or something?", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 1.4, "go_to_next" : true, "text_start_delay" : 0.01 },
	{"speaker" : "ana", "emotion" : "" , "text" : "It doesn’t work like that, I need an Art Direction,\n a concept, I need constraints!", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 1.6, "go_to_next" : true, "text_start_delay" : 0.01 },
	{"speaker" : "yohan", "emotion" : "" , "text" : "Give me that !", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 1, "go_to_next" : true, "text_start_delay" : 0.7 },
	
]

var dialogue_index = 0
var current_dialogue = dialogue_text[dialogue_index]
