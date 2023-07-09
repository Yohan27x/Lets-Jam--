extends Node2D

const effect_bullet = preload("res://bullet_effect.tscn")
var velocity = Vector2(0,0)

var damage
@onready var hitbox = $HitBox

func _physics_process(delta):
	position += velocity * delta
	
func _process(delta):
	hitbox.damage = damage

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_hit_box_area_entered(area):
	var effect = effect_bullet.instantiate()
	var main = get_tree().current_scene
	main.call_deferred("add_child", effect)
	effect.global_position = global_position
	
	queue_free()
