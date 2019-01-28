extends KinematicBody2D

signal scored(hit_point)

var speed = 250

var velocity = Vector2()
var screen_size
var damage = 10

func _ready():
	screen_size = get_viewport_rect().size	
	position = Vector2(screen_size.x / 2, screen_size.y - 100)
	velocity = Vector2(-1, -1) * speed
	
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		handle_collision(collision.collider)


func handle_collision(collider):
	if collider.has_method("remove"):
		var collider_hit_point = collider.get_hit_point()
		if (get_parent().has_method('update_score')):
			get_parent().update_score(collider_hit_point)
		if (collider_hit_point <= damage):
			collider.remove()