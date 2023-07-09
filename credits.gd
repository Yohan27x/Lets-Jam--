extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var tween = get_tree().create_tween()
	tween.tween_property($Fade, "modulate:a", 0, 5)
	await get_tree().create_timer(3).timeout
	tween.stop()
	$Fade.modulate.a = 0
