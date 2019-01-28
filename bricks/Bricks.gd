extends Node2D

var screen_size
var brick
var brick_width = 64
var brick_height = 32
var width
var height
var bricks_vertical_area
var bricks_horizontal_area
var allowed_height
var allowed_width

func _ready():
	screen_size = get_viewport_rect().size
	brick = preload("res://bricks/Brick.tscn")
	
	allowed_height = int(screen_size.y) / 3
	allowed_width = int(screen_size.x)
	bricks_vertical_area = (allowed_height - (allowed_height % brick_height)) + brick_width
	bricks_horizontal_area = allowed_width - (allowed_width % brick_width)
	width = ((allowed_width - bricks_horizontal_area) / 2) + brick_height
	var start_width = width
	height = ((allowed_height - bricks_vertical_area) / 2) + (brick_width * 1.5)
	
	while height <= bricks_vertical_area:
		while width <= bricks_horizontal_area:
			var brick_instance = brick.instance()
			brick_instance.position = Vector2(width, height)
			add_child(brick_instance)
			width += brick_width
		height += brick_height
		width = start_width
		
		

