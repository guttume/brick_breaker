extends Node2D

signal body_entered(body)

func _on_BottomLimit_body_entered(body):
	emit_signal("body_entered", body)
