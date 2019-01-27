extends StaticBody2D

var hit_point = 10 setget get_hit_point


func remove():
	queue_free()
	

func get_hit_point():
	return hit_point