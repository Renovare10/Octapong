extends Node2D

@export var ball: RigidBody2D
var score: int = 0

func _ready() -> void:
	$GoalArea.body_entered.connect(_on_goal_area_body_entered)

func _on_goal_area_body_entered(body: Node) -> void:
	if body == ball:
		score += 1
		print("Score: ", score)
		reset_ball()

func reset_ball() -> void:
	ball.position = Vector2(512, 300)  # 1024x600 screen
	var angle_range = [randf_range(45, 135), randf_range(225, 315)]
	var random_angle = deg_to_rad(angle_range[randi() % 2])
	var direction = Vector2(cos(random_angle), sin(random_angle)).normalized()
	ball.linear_velocity = direction * ball.initial_speed
