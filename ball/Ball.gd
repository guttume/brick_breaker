extends KinematicBody2D

signal scored(hit_point)

export var speed = 150

var velocity = Vector2() setget set_velocity
var screen_size
var damage = 10

func _ready():
	screen_size = get_viewport_rect().size	
	hide()
	
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		var collider = collision.collider
		if collider.has_method("remove"):
			var collider_hit_point = collider.get_hit_point()
			emit_signal("scored", collider_hit_point)
			if (collider_hit_point <= damage):
				collider.remove()
				
				
func set_velocity(initial_velocity):
	position = Vector2(screen_size.x / 2, screen_size.y - 100)
	velocity = initial_velocity * speed
	show()