extends StaticBody2D

var speed = 500
var screen_size
var velocity = Vector2()

func _ready():	
	screen_size = get_viewport_rect().size
		

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		
	velocity = velocity.normalized() * speed
	
		
func _process(delta):
	get_input()
	position += velocity * delta
	position.x = clamp(position.x, 52, screen_size.x - 52)