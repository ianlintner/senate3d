extends Node
# TempleBuilder.gd
# A utility script with helper functions for building temple environments

class_name TempleBuilder

# Constants for temple piece sizes (adjust based on actual model dimensions)
const FLOOR_SIZE = 2.0
const PILLAR_HEIGHT = 2.0
const WALL_HEIGHT = 2.0

# Function to create a temple room with floor, pillars, and walls
static func create_temple_room(size: Vector2, position: Vector3, parent_node: Node) -> Node3D:
	var room = Node3D.new()
	room.name = "TempleRoom"
	room.position = position
	parent_node.add_child(room)
	
	# Create floor
	var floor_node = create_temple_floor(size, Vector3.ZERO, room)
	
	# Create pillars at corners
	create_temple_pillar(Vector3(0, 0, 0), room)
	create_temple_pillar(Vector3((size.x - 1) * FLOOR_SIZE, 0, 0), room)
	create_temple_pillar(Vector3(0, 0, (size.y - 1) * FLOOR_SIZE), room)
	create_temple_pillar(Vector3((size.x - 1) * FLOOR_SIZE, 0, (size.y - 1) * FLOOR_SIZE), room)
	
	# Create walls
	create_temple_walls(size, Vector3.ZERO, room)
	
	return room

# Function to create a temple floor
static func create_temple_floor(size: Vector2, position: Vector3, parent_node: Node) -> Node3D:
	var floor_root = Node3D.new()
	floor_root.name = "Floor"
	floor_root.position = position
	parent_node.add_child(floor_root)
	
	var floor_mesh = load("res://Assets/Models/Environment/ModularTemple/Floor_Normal_Square.obj")
	
	for x in range(size.x):
		for z in range(size.y):
			var floor_tile = MeshInstance3D.new()
			floor_tile.name = "FloorTile_" + str(x) + "_" + str(z)
			floor_tile.mesh = floor_mesh
			floor_tile.position = Vector3(x * FLOOR_SIZE, 0, z * FLOOR_SIZE)
			floor_root.add_child(floor_tile)
	
	return floor_root

# Function to create a temple pillar
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
	middle.position.y = PILLAR_HEIGHT
	pillar_root.add_child(middle)
	
	# Create top
	var top = MeshInstance3D.new()
	top.name = "Top"
	top.mesh = load("res://Assets/Models/Environment/ModularTemple/Pillar_Large_Top.obj")
	top.position.y = PILLAR_HEIGHT * 2
	pillar_root.add_child(top)
	
	return pillar_root

# Function to create temple walls
static func create_temple_walls(size: Vector2, position: Vector3, parent_node: Node) -> Node3D:
	var walls_root = Node3D.new()
	walls_root.name = "Walls"
	walls_root.position = position
	parent_node.add_child(walls_root)
	
	var wall_base_mesh = load("res://Assets/Models/Environment/ModularTemple/Pillar_Wall_Base.obj")
	var wall_middle_mesh = load("res://Assets/Models/Environment/ModularTemple/Pillar_Wall_Middle.obj")
	var wall_top_mesh = load("res://Assets/Models/Environment/ModularTemple/Pillar_Wall_Top.obj")
	
	# Create north wall (along Z axis, X = 0)
	for z in range(size.y - 1):
		create_wall_section(Vector3(0, 0, z * FLOOR_SIZE), Vector3(0, 0, 1), walls_root)
	
	# Create east wall (along X axis, Z = size.y - 1)
	for x in range(size.x - 1):
		create_wall_section(Vector3(x * FLOOR_SIZE, 0, (size.y - 1) * FLOOR_SIZE), Vector3(1, 0, 0), walls_root)
	
	# Create south wall (along Z axis, X = size.x - 1)
	for z in range(size.y - 1):
		create_wall_section(Vector3((size.x - 1) * FLOOR_SIZE, 0, z * FLOOR_SIZE), Vector3(0, 0, 1), walls_root)
	
	# Create west wall (along X axis, Z = 0)
	for x in range(size.x - 1):
		create_wall_section(Vector3(x * FLOOR_SIZE, 0, 0), Vector3(1, 0, 0), walls_root)
	
	return walls_root

# Function to create a single wall section
static func create_wall_section(position: Vector3, direction: Vector3, parent_node: Node) -> Node3D:
	var wall_section = Node3D.new()
	wall_section.name = "WallSection"
	wall_section.position = position
	parent_node.add_child(wall_section)
	
	# Calculate rotation based on direction
	var rotation_y = 0.0
	if direction.x == 1:
		rotation_y = PI / 2  # 90 degrees
	
	wall_section.rotation.y = rotation_y
	
	# Create base
	var base = MeshInstance3D.new()
	base.name = "Base"
	base.mesh = load("res://Assets/Models/Environment/ModularTemple/Pillar_Wall_Base.obj")
	wall_section.add_child(base)
	
	# Create middle
	var middle = MeshInstance3D.new()
	middle.name = "Middle"
	middle.mesh = load("res://Assets/Models/Environment/ModularTemple/Pillar_Wall_Middle.obj")
	middle.position.y = WALL_HEIGHT
	wall_section.add_child(middle)
	
	# Create top
	var top = MeshInstance3D.new()
	top.name = "Top"
	top.mesh = load("res://Assets/Models/Environment/ModularTemple/Pillar_Wall_Top.obj")
	top.position.y = WALL_HEIGHT * 2
	wall_section.add_child(top)
	
	return wall_section

# Function to create a circular temple area
static func create_circular_temple_area(radius: float, position: Vector3, parent_node: Node) -> Node3D:
	var circular_area = Node3D.new()
	circular_area.name = "CircularTempleArea"
	circular_area.position = position
	parent_node.add_child(circular_area)
	
	# Create the floor using curved pieces
	var floor_curved_large = load("res://Assets/Models/Environment/ModularTemple/Floor_Curved_Large.obj")
	var floor_curved_large_outer = load("res://Assets/Models/Environment/ModularTemple/Floor_Curved_Large_Outer.obj")
	
	# Create inner circle
	for i in range(4):  # 4 pieces to make a circle
		var angle = i * PI / 2  # 90 degrees each
		var floor_piece = MeshInstance3D.new()
		floor_piece.name = "FloorCurvedLarge_" + str(i)
		floor_piece.mesh = floor_curved_large
		floor_piece.position = Vector3(0, 0, 0)
		floor_piece.rotation.y = angle
		circular_area.add_child(floor_piece)
	
	# Create outer circle
	for i in range(4):  # 4 pieces to make a circle
		var angle = i * PI / 2  # 90 degrees each
		var floor_piece = MeshInstance3D.new()
		floor_piece.name = "FloorCurvedLargeOuter_" + str(i)
		floor_piece.mesh = floor_curved_large_outer
		floor_piece.position = Vector3(0, 0, 0)
		floor_piece.rotation.y = angle
		circular_area.add_child(floor_piece)
	
	# Add some decorative elements
	add_decorative_elements(circular_area, radius)
	
	return circular_area

# Function to add decorative elements to a temple area
static func add_decorative_elements(parent_node: Node, radius: float = 5.0) -> void:
	# Add a central rug
	var rug = MeshInstance3D.new()
	rug.name = "CentralRug"
	rug.mesh = load("res://Assets/Models/Environment/ModularTemple/Prop_Rug_Eclipse.obj")
	rug.position = Vector3(0, 0.01, 0)  # Slightly above floor to prevent z-fighting
	parent_node.add_child(rug)
	
	# Add some vases around the perimeter
	for i in range(4):
		var angle = i * PI / 2 + PI / 4  # Offset by 45 degrees
		var vase = MeshInstance3D.new()
		vase.name = "Vase_" + str(i)
		vase.mesh = load("res://Assets/Models/Environment/ModularTemple/Prop_Vase.obj")
		vase.position = Vector3(cos(angle) * radius * 0.8, 0, sin(angle) * radius * 0.8)
		parent_node.add_child(vase)
	
	# Add a flag
	var flag_stand = MeshInstance3D.new()
	flag_stand.name = "FlagStand"
	flag_stand.mesh = load("res://Assets/Models/Environment/ModularTemple/Prop_Flag_Stand_Top.obj")
	flag_stand.position = Vector3(0, 0, -radius * 0.7)
	parent_node.add_child(flag_stand)
	
	var flag = MeshInstance3D.new()
	flag.name = "Flag"
	flag.mesh = load("res://Assets/Models/Environment/ModularTemple/Prop_Flag_Sun.obj")
	flag.position = Vector3(0, 2.0, -radius * 0.7)  # Adjust height as needed
	parent_node.add_child(flag)

# Function to create a temple entrance with stairs and pillars
static func create_temple_entrance(position: Vector3, direction: Vector3, parent_node: Node) -> Node3D:
	var entrance = Node3D.new()
	entrance.name = "TempleEntrance"
	entrance.position = position
	parent_node.add_child(entrance)
	
	# Calculate rotation based on direction
	var rotation_y = 0.0
	if direction.x == 1:
		rotation_y = PI / 2  # 90 degrees
	elif direction.x == -1:
		rotation_y = -PI / 2  # -90 degrees
	elif direction.z == -1:
		rotation_y = PI  # 180 degrees
	
	entrance.rotation.y = rotation_y
	
	# Create entrance floor (bridge/ramp)
	var floor_bridge = MeshInstance3D.new()
	floor_bridge.name = "FloorBridge"
	floor_bridge.mesh = load("res://Assets/Models/Environment/ModularTemple/Floor_Bridge_Ramp.obj")
	entrance.add_child(floor_bridge)
	
	# Create pillars on either side of the entrance
	var pillar_left = create_temple_pillar(Vector3(-FLOOR_SIZE, 0, 0), entrance)
	var pillar_right = create_temple_pillar(Vector3(FLOOR_SIZE, 0, 0), entrance)
	
	# Create an arch connecting the pillars
	var arch = MeshInstance3D.new()
	arch.name = "Arch"
	arch.mesh = load("res://Assets/Models/Environment/ModularTemple/Pillar_Large_Arch.obj")
	arch.position = Vector3(0, PILLAR_HEIGHT * 2, 0)
	entrance.add_child(arch)
	
	# Add some decorative flags
	var flag_left = MeshInstance3D.new()
	flag_left.name = "FlagLeft"
	flag_left.mesh = load("res://Assets/Models/Environment/ModularTemple/Prop_Flag_Moon.obj")
	flag_left.position = Vector3(-FLOOR_SIZE, PILLAR_HEIGHT * 2.5, 0)
	entrance.add_child(flag_left)
	
	var flag_right = MeshInstance3D.new()
	flag_right.name = "FlagRight"
	flag_right.mesh = load("res://Assets/Models/Environment/ModularTemple/Prop_Flag_Sun.obj")
	flag_right.position = Vector3(FLOOR_SIZE, PILLAR_HEIGHT * 2.5, 0)
	entrance.add_child(flag_right)
	
	return entrance