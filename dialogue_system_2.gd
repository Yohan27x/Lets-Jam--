extends Resource
class_name DialogueSystem2

var dialogue_text = [
	{"speaker" : "yohan", "emotion" : "" ,"text" : "And voila ! ", "dialogue_speed" : 0.03, "delay_after_trigger" : 0.5, "ready" : false, "stay_on_screen" : 2.5, "go_to_next" : true, "text_start_delay" : 0.5  },
	{"speaker" : "ana", "emotion" : "" , "text" : "AH !!! ", "dialogue_speed" : 0.03, "delay_after_trigger" : 1.7, "ready" : false, "stay_on_screen" : 2, "go_to_next" : false, "text_start_delay" : 0.3 },
	{"speaker" : "liz", "emotion" : "" , "text" : "Oh, I did it! I managed to\ncode the character's movements. ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 1.2, "go_to_next" : true, "text_start_delay" : 0.01 },
	{"speaker" : "liz", "emotion" : "happy" , "text" : "But I think I've made a bit\nof a mess with the controls...", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.001, "ready" : false, "stay_on_screen" : 1.5, "go_to_next" : false, "text_start_delay" : 0.01 },
	{"speaker" : "yohan", "emotion" : "" , "text" : "Who did this?", "dialogue_speed" : 0.01, "delay_after_trigger" : 11, "ready" : false, "stay_on_screen" : 1.3, "go_to_next" : true, "text_start_delay" : 0.01 },
	{"speaker" : "ana", "emotion" : "happy" , "text" : "You like it?", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.5, "ready" : false, "stay_on_screen" : 2, "go_to_next" : true, "text_start_delay" : 0.01 },
	{"speaker" : "yohan", "emotion" : "" , "text" : "Not bad.", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.5, "ready" : false, "stay_on_screen" : 2, "go_to_next" : true, "text_start_delay" : 0.01 },
	{"speaker" : "liz", "emotion" : "happy" , "text" : "Let's see if I click on\nthis, and this, and that... ", "dialogue_speed" : 0.01, "delay_after_trigger" : 0.5, "ready" : false, "stay_on_screen" : 2, "go_to_next" : false, "text_start_delay" : 0.01 },
]

var dialogue_index = 0
var current_dialogue = dialogue_text[dialogue_index]
