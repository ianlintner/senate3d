extends Node3D
# ExampleLevelBuilder.gd
# An example script that demonstrates how to use the utility scripts to create a temple environment with NPCs

# Make sure the utility scripts are loaded
const AssetHelper = preload("res://Scripts/Utils/AssetHelper.gd")
const TempleBuilder = preload("res://Scripts/Utils/TempleBuilder.gd")

# This function can be called to create a sample temple environment
func create_sample_temple():
	# Create a main temple room
	var main_room = TempleBuilder.create_temple_room(Vector2(5, 5), Vector3(0, 0, 0), self)
	
	# Create a circular shrine area
	var shrine = TempleBuilder.create_circular_temple_area(5.0, Vector3(10, 0, 0), self)
	
	# Create an entrance
	var entrance = TempleBuilder.create_temple_entrance(Vector3(0, 0, -5), Vector3(0, 0, -1), self)
	
	# Add some NPCs
	add_temple_npcs()
	
	# Add some lighting
	add_lighting()
	
	print("Sample temple created successfully!")

# Add NPCs to the temple
func add_temple_npcs():
	# Create a guard NPC at the entrance
	var guard = AssetHelper.create_basic_npc(Vector3(0, 0, -3), self, "Temple Guard")
	var guard_dialog = [
		"Halt! Who goes there?",
		"Oh, it's just you. Welcome to the temple.",
		"Please be respectful inside."
	]
	AssetHelper.add_dialog_to_npc(guard, guard_dialog, "Temple Guard")
	
	# Create a priest NPC in the main room
	var priest = AssetHelper.create_basic_npc(Vector3(2, 0, 2), self, "Temple Priest")
	var priest_dialog = [
		"Welcome, seeker of knowledge.",
		"This temple holds many secrets.",
		"Feel free to explore, but be careful not to disturb the ancient artifacts."
	]
	AssetHelper.add_dialog_to_npc(priest, priest_dialog, "Temple Priest")
	
	# Create a scholar NPC in the shrine
	var scholar = AssetHelper.create_basic_npc(Vector3(10, 0, 0), self, "Scholar")
	var scholar_dialog = [
		"Fascinating architecture, isn't it?",
		"I've been studying these ruins for years.",
		"The symbols on the walls tell a story of an ancient civilization."
	]
	AssetHelper.add_dialog_to_npc(scholar, scholar_dialog, "Scholar")

# Add lighting to the temple
func add_lighting():
	# Add a directional light for overall illumination
	var dir_light = DirectionalLight3D.new()
	dir_light.name = "DirectionalLight"
	dir_light.rotation_degrees = Vector3(-45, 45, 0)
	dir_light.light_energy = 0.8
	dir_light.shadow_enabled = true
	add_child(dir_light)
	
	# Add point lights for atmospheric lighting
	add_point_light(Vector3(0, 3, 0), Color(1.0, 0.9, 0.7), 1.0)  # Main room
	add_point_light(Vector3(10, 3, 0), Color(0.7, 0.8, 1.0), 1.0)  # Shrine
	add_point_light(Vector3(0, 3, -5), Color(1.0, 0.7, 0.4), 0.8)  # Entrance

# Helper function to add a point light
func add_point_light(position: Vector3, color: Color, energy: float):
	var light = OmniLight3D.new()
	light.name = "PointLight"
	light.position = position
	light.light_color = color
	light.light_energy = energy
	light.shadow_enabled = true
	light.omni_range = 10.0
	add_child(light)

# Called when the node enters the scene tree
func _ready():
	# Uncomment the line below to automatically create a sample temple when the scene starts
	# create_sample_temple()
	pass

# Example of how to use this script:
# 1. Create a new scene with a Node3D as the root
# 2. Attach this script to the root node
# 3. Instance the scene in your level
# 4. Call the create_sample_temple() function from code or by uncommenting the line in _ready()
#
# Alternatively, you can call specific functions to create only what you need:
# - TempleBuilder.create_temple_room() for a room
# - TempleBuilder.create_circular_temple_area() for a circular area
# - AssetHelper.create_basic_npc() to create NPCs