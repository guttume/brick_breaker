extends Node2D

var score = 0 setget update_score
var state = "stop"
var ball_instance
var ball
var screen_size

onready var game_over_text = $HUD/VBoxContainer/GameOverText
onready var start_text = $HUD/VBoxContainer/StartText
onready var score_label = $HUD/ScoreText/Label


func _ready():
	screen_size = get_viewport_rect().size
	score = 0
	ball = preload("res://ball/Ball.tscn")
	state = "stopped"
	$Paddle.position = Vector2(screen_size.x / 2, screen_size.y - 50)
	game_over_text.hide()
	

func _unhandled_input(event):
	if state != "stopped":
		return
		
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_SPACE:			
			$Paddle.position = Vector2(screen_size.x / 2, screen_size.y - 50)	
			game_over_text.hide()
			start_text.hide()
			ball_instance = ball.instance()
			add_child(ball_instance)
			state = "playing"
	

func _on_walls_body_entered(body):
	if (body == ball_instance):
		state = "stopped"
		game_over_text.show()
		start_text.show()
		remove_child(ball_instance)

func update_score(hit_point):
	score += hit_point
	score_label.text = "Score: " + str(score)
	