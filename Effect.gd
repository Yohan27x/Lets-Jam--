extends AnimatedSprite2D

func _process(delta):
	play("animate")

func _on_animation_finished():
	queue_free()



