extends Area2D

#const HitEffect = preload("res://Effects/HitEffect.tscn")

#var invincible = false : set = set_invincible, get = get_invincible
var invincible = false : set = set_invincible

signal invincibility_started
signal invincibility_ended

@onready var timer = $Timer

const HIT_EFFECT = preload("res://hit_effect.tscn")

func set_invincible(value):
	invincible = value
	if invincible == true:
		emit_signal("invincibility_started")
	else:
		emit_signal("invincibility_ended")

func start_invincibility(duration):
	self.invincible = true
	timer.start(duration)

func create_hit_effect(offset):
	var effect = HIT_EFFECT.instantiate()
	effect.z_index = 2
	var main = get_tree().current_scene
	main.call_deferred("add_child", effect)
	effect.global_position = global_position + offset

func _on_timer_timeout():
	self.invincible = false

func _on_invincibility_started():
	set_deferred("monitorable", false)

func _on_invincibility_ended():
	monitorable = true
