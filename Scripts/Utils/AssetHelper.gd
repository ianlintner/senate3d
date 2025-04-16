extends Node
# AssetHelper.gd
# A utility script with helper functions for working with assets in the project

class_name AssetHelper

# Function to get a random temple prop from the available props
static func get_random_temple_prop(prop_type: String) -> String:
	var props = {
		"flag": [
			"res://Assets/Models/Environment/ModularTemple/Prop_Flag_1.obj",
			"res://Assets/Models/Environment/ModularTemple/Prop_Flag_2.obj",
			"res://Assets/Models/Environment/ModularTemple/Prop_Flag_3.obj",
			"res://Assets/Models/Environment/ModularTemple/Prop_Flag_Eclipse.obj",
			"res://Assets/Models/Environment/ModularTemple/Prop_Flag_Moon.obj",
			"res://Assets/Models/Environment/ModularTemple/Prop_Flag_Stars.obj",
			"res://Assets/Models/Environment/ModularTemple/Prop_Flag_Sun.obj"
		],
		"rug": [
			"res://Assets/Models/Environment/ModularTemple/Prop_Rug_Corner_Inner.obj",
			"res://Assets/Models/Environment/ModularTemple/Prop_Rug_Corner_Outer.obj",
			"res://Assets/Models/Environment/ModularTemple/Prop_Rug_Eclipse.obj",
			"res://Assets/Models/Environment/ModularTemple/Prop_Rug_Middle.obj",
			"res://Assets/Models/Environment/ModularTemple/Prop_Rug_Moon.obj",
			"res://Assets/Models/Environment/ModularTemple/Prop_Rug_Side.obj",
			"res://Assets/Models/Environment/ModularTemple/Prop_Rug_Stars.obj",
			"res://Assets/Models/Environment/ModularTemple/Prop_Rug_Sun.obj"
		],
		"vase": [
			"res://Assets/Models/Environment/ModularTemple/Prop_Vase.obj",
			"res://Assets/Models/Environment/ModularTemple/Prop_Vase_1.obj"
		],
		"rubble": [
			"res://Assets/Models/Environment/ModularTemple/Prop_Rubble_1.obj",
			"res://Assets/Models/Environment/ModularTemple/Prop_Rubble_2.obj"
		]
	}
	
	if props.has(prop_type) and props[prop_type].size() > 0:
		return props[prop_type][randi() % props[prop_type].size()]
	else:
		push_error("Invalid prop type: " + prop_type)
		return ""

# Function to create a temple pillar (base, middle, top)
static func create_temple_pillar(position: Vector3, parent_node: Node) -> Node3D:
	var pillar_root = Node3D.new()
	pillar_root.name = "Pillar"
	pillar_root.position = position
	parent_node.add_child(pillar_root)
	
	# Create base
	var base = MeshInstance3D.new()
	base.name = "Base"
	base.mesh = load("res://Assets/Models/Environment/ModularTemple/Pillar_Large_Base.obj")
	pillar_root.add_child(base)
	
	# Create middle
	var middle = MeshInstance3D.new()
	middle.name = "Middle"
	middle.mesh = load("res://Assets/Models/Environment/ModularTemple/Pillar_Large_Middle.obj")
	middle.position.y = 2.0  # Adjust based on actual model height
	pillar_root.add_child(middle)
	
	# Create top
	var top = MeshInstance3D.new()
	top.name = "Top"
	top.mesh = load("res://Assets/Models/Environment/ModularTemple/Pillar_Large_Top.obj")
	top.position.y = 4.0  # Adjust based on actual model height
	pillar_root.add_child(top)
	
	return pillar_root

# Function to create a temple floor grid
static func create_temple_floor_grid(size: Vector2, position: Vector3, parent_node: Node) -> Node3D:
	var floor_root = Node3D.new()
	floor_root.name = "Floor"
	floor_root.position = position
	parent_node.add_child(floor_root)
	
	var floor_mesh = load("res://Assets/Models/Environment/ModularTemple/Floor_Normal_Square.obj")
	var tile_size = 2.0  # Adjust based on actual model size
	
	for x in range(size.x):
		for z in range(size.y):
			var floor_tile = MeshInstance3D.new()
			floor_tile.name = "FloorTile_" + str(x) + "_" + str(z)
			floor_tile.mesh = floor_mesh
			floor_tile.position = Vector3(x * tile_size, 0, z * tile_size)
			floor_root.add_child(floor_tile)
	
	return floor_root

# Function to create a basic NPC
static func create_basic_npc(position: Vector3, parent_node: Node, npc_name: String = "NPC") -> CharacterBody3D:
	# This is a simplified version - in practice, you would instance the NPC scene
	var npc = CharacterBody3D.new()
	npc.name = npc_name
	npc.position = position
	
	# Add the NPC script
	var script = load("res://Scripts/Characters/NPC.gd")
	npc.set_script(script)
	
	# Add a collision shape
	var collision_shape = CollisionShape3D.new()
	collision_shape.name = "CollisionShape"
	var shape = CapsuleShape3D.new()
	shape.height = 1.8
	shape.radius = 0.4
	collision_shape.shape = shape
	collision_shape.position = Vector3(0, 0.9, 0)
	npc.add_child(collision_shape)
	
	# Note: In a real implementation, you would also add the mesh and animation tree
	# This is just a placeholder to show the structure
	
	parent_node.add_child(npc)
	return npc

# Function to add dialog to an NPC
static func add_dialog_to_npc(npc: CharacterBody3D, dialog_lines: Array, npc_name: String = "NPC") -> void:
	# Create dialog interaction node
	var dialog_interaction = Node.new()
	dialog_interaction.name = "DialogInteraction"
	
	# Add the dialog interaction script
	var script = load("res://Scripts/Characters/NPCDialogInteraction.gd")
	dialog_interaction.set_script(script)
	
	# Set dialog properties
	dialog_interaction.npc_name = npc_name
	dialog_interaction.dialog_lines = dialog_lines
	
	# Try to find dialog UI
	var dialog_uis = npc.get_tree().get_nodes_in_group("dialog_ui")
	if dialog_uis.size() > 0:
		dialog_interaction.dialog_ui_path = dialog_uis[0].get_path()
	
	npc.add_child(dialog_interaction)

# Function to get a random color texture
static func get_random_color_texture() -> Texture2D:
	var textures = [
		"res://Assets/Textures/Red.png",
		"res://Assets/Textures/Green.png",
		"res://Assets/Textures/Orange.png",
		"res://Assets/Textures/Purple.png",
		"res://Assets/Textures/White.png",
		"res://Assets/Textures/Black.png"
	]
	
	return load(textures[randi() % textures.size()])