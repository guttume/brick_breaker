extends Node2D

var score = 0
var state = "stop"
var ball_velocity = Vector2()
var ball_instance
var ball
var screen_size

onready var brick = $Brick


func _ready():
	screen_size = get_viewport_rect().size
	score = 0
	ball = preload("res://ball/Ball.tscn")
	state = "stopped"
	$Paddle.position = Vector2(screen_size.x / 2, screen_size.y - 50)
	

func _unhandled_input(event):
	if state != "stopped":
		return
		
	if event is InputEventKey:
		if event.pressed:
			if event.scancode == KEY_LEFT:
				ball_velocity = Vector2(-1, -1)
			
			if event.scancode == KEY_RIGHT:
				ball_velocity = Vector2(1, 1)
				
			
			$Paddle.position = Vector2(screen_size.x / 2, screen_size.y - 50)	
			$HUD/VBoxContainer/GameOverText.hide()
			$HUD/VBoxContainer/StartText.hide()
			ball_instance = ball.instance()
			add_child(ball_instance)
			ball_instance.speed = 250
			ball_instance.set_velocity(ball_velocity)
			state = "playing"
	

func _on_walls_body_entered(body):
	if (body == ball_instance):
		state = "stopped"
		$HUD/VBoxContainer/GameOverText.show()
		$HUD/VBoxContainer/StartText.show()
		remove_child(ball_instance)

func _on_Ball_scored(hit_point):
	score += hit_point
	$HUD/ScoreText/Label.text = "Score: " + str(score)