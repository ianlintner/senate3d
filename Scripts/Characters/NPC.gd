extends CharacterBody3D

const LERP_VALUE : float = 0.15

@export_group("Movement variables")
@export var walk_speed : float = 1.5
@export var wander_radius : float = 5.0
@export var wander_timer_min : float = 3.0
@export var wander_timer_max : float = 8.0
@export var gravity : float = 50.0

# State variables
var current_target : Vector3 = Vector3.ZERO
var home_position : Vector3 = Vector3.ZERO
var wander_timer : float = 0.0

const ANIMATION_BLEND : float = 7.0

@onready var npc_mesh : Node3D = $Mesh
@onready var animator : AnimationTree = $AnimationTree

# Add this method to allow external scripts to set the target position
func set_target_position(pos: Vector3) -> void:
	current_target = pos
	# Reset the wander timer to prevent immediate recalculation of target
	wander_timer = randf_range(wander_timer_min, wander_timer_max)

func _ready():
	# Store the initial position as home
	home_position = global_position
	# Initialize the wander timer
	wander_timer = randf_range(wander_timer_min, wander_timer_max)
	# Set initial animation state
	animator.set("parameters/iwr_blend/blend_amount", -1.0) # Start with idle

func _physics_process(delta):
	# Apply gravity
	velocity.y -= gravity * delta
	
	# Handle wandering behavior
	wander_timer -= delta
	if wander_timer <= 0:
		# Choose a new random target within the wander radius
		var random_dir = Vector3(randf_range(-1, 1), 0, randf_range(-1, 1)).normalized()
		current_target = home_position + random_dir * randf_range(0, wander_radius)
		# Reset the timer
		wander_timer = randf_range(wander_timer_min, wander_timer_max)
	
	# Move towards the current target
	var direction = Vector3.ZERO
	if current_target != Vector3.ZERO:
		direction = (current_target - global_position).normalized()
		direction.y = 0  # Keep movement on the horizontal plane
	
	# Set velocity based on direction and speed
	velocity.x = direction.x * walk_speed
	velocity.z = direction.z * walk_speed
	
	# Rotate the mesh to face the movement direction
	if direction != Vector3.ZERO:
		npc_mesh.rotation.y = lerp_angle(npc_mesh.rotation.y, atan2(velocity.x, velocity.z), LERP_VALUE)
	
	# Apply movement
	move_and_slide()
	
	# Check if we've reached the target (within a small threshold)
	if global_position.distance_to(current_target) < 0.5:
		current_target = Vector3.ZERO  # Clear the target
	
	# Update animations
	animate(delta)

func animate(delta):
	if is_on_floor():
		animator.set("parameters/ground_air_transition/transition_request", "grounded")
		
		if velocity.length() > 0:
			# Use walk animation (0.0 in the blend)
			animator.set("parameters/iwr_blend/blend_amount", lerp(animator.get("parameters/iwr_blend/blend_amount"), 0.0, delta * ANIMATION_BLEND))
		else:
			# Use idle animation (-1.0 in the blend)
			animator.set("parameters/iwr_blend/blend_amount", lerp(animator.get("parameters/iwr_blend/blend_amount"), -1.0, delta * ANIMATION_BLEND))
	else:
		animator.set("parameters/ground_air_transition/transition_request", "air")
