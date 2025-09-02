extends CharacterBody2D

# Configurable speed for paddle movement
@export var speed: float = 400.0  # Pixels per second, tweak in editor
# Fixed Y position for the paddle
@export var fixed_y_position: float = 567.0  # Set to your desired Y-coordinate

func _ready() -> void:
	# Set initial Y position
	position.y = fixed_y_position

func _physics_process(delta: float) -> void:
	# Get input direction (1 for right, -1 for left, 0 for no input)
	var direction: float = Input.get_axis("ui_left", "ui_right")
	
	# Set velocity for left/right movement, lock Y velocity to 0
	velocity = Vector2(direction * speed, 0.0)
	
	# Apply movement and handle collisions
	move_and_slide()
	
	# Force Y position to stay locked
	position.y = fixed_y_position
