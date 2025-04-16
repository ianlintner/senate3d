extends Node

# This script can be attached to the NPC to add player interaction functionality

@export_group("Interaction Settings")
@export var interaction_radius : float = 3.0  # How close the player needs to be to trigger interaction
@export var look_at_player : bool = true  # Whether the NPC should turn to face the player when nearby
@export var follow_player : bool = false  # Whether the NPC should follow the player when nearby
@export var follow_distance : float = 2.0  # How close the NPC tries to get when following

var player : CharacterBody3D = null
var is_interacting : bool = false

func _ready():
	# Find the player in the scene
	await get_tree().process_frame
	
	# Try to find player in "player" group
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		player = players[0]
	
	# If not found, try with capital "Player" group
	if player == null:
		players = get_tree().get_nodes_in_group("Player")
		if players.size() > 0:
			player = players[0]
	
	# If still not found, try to find by node name
	if player == null:
		# Search for a node named "Player" in the scene
		var root = get_tree().root
		player = _find_player_node(root)
		
func _find_player_node(node):
	# Recursive function to find a player node
	if node.name == "Player" and node is CharacterBody3D:
		return node
	
	for child in node.get_children():
		var result = _find_player_node(child)
		if result != null:
			return result
	
	return null

func _process(_delta):
	if player == null:
		return
	
	var distance_to_player = get_parent().global_position.distance_to(player.global_position)
	# Check if player is within interaction radius
	if distance_to_player <= interaction_radius:
		if !is_interacting:
			is_interacting = true
			_on_player_entered()
		
		# Make NPC look at player
		if look_at_player:
			var npc = get_parent()
			var mesh = npc.get_node("Mesh") if npc.has_node("Mesh") else null
			if mesh != null:
				var look_dir = (player.global_position - npc.global_position).normalized()
				look_dir.y = 0  # Keep on horizontal plane
				if look_dir != Vector3.ZERO:
					var target_angle = atan2(look_dir.x, look_dir.z)
					mesh.rotation.y = lerp_angle(mesh.rotation.y, target_angle, 0.1)
		
		# Make NPC follow player if enabled
		if follow_player:
			var npc = get_parent()
			if npc is CharacterBody3D:
				if distance_to_player > follow_distance:
					var direction = (player.global_position - npc.global_position).normalized()
					direction.y = 0  # Keep on horizontal plane
					
					# Override the NPC's current_target if it has that property
					if npc.has_method("set_target_position"):
						npc.set_target_position(player.global_position)
					elif npc.get("current_target") != null:
						npc.current_target = player.global_position - direction * follow_distance
	else:
		if is_interacting:
			is_interacting = false
			_on_player_exited()

# Add this method to the NPC script to allow the interaction script to set targets
func set_target_position(pos):
	if get_parent().has_method("set_target_position"):
		get_parent().set_target_position(pos)
	elif get_parent().get("current_target") != null:
		get_parent().current_target = pos

# Override these methods in extending scripts to add custom behavior
func _on_player_entered():
	print("Player entered NPC interaction radius")

func _on_player_exited():
	print("Player exited NPC interaction radius")
