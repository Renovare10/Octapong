extends RigidBody2D

# Configurable initial speed
@export var initial_speed: float = 300.0  # Pixels per second, tweak for balance

func _ready() -> void:
	# Zero gravity
	gravity_scale = 0.0
	
	# Perfect elasticity (retain all momentum on bounce)
	physics_material_override = PhysicsMaterial.new()
	physics_material_override.bounce = 1.0
	physics_material_override.friction = 0.0  # No energy loss
	
	# Random initial direction (45-135 degrees for fair start, adjust as needed)
	var random_angle = deg_to_rad(randf_range(45, 135))
	var direction = Vector2(cos(random_angle), sin(random_angle)).normalized()
	
	# Apply initial momentum
	linear_velocity = direction * initial_speed
