# Utility Scripts Guide

## Overview

This project includes utility scripts to help with common tasks such as asset management, temple building, and NPC creation. These scripts are located in the `Scripts/Utils/` directory.

The following utility scripts are available:
- **AssetHelper.gd**: Utility functions for working with assets
- **TempleBuilder.gd**: Utility functions for building temple environments
- **ExampleLevelBuilder.gd**: Example script demonstrating how to use the utility scripts

## AssetHelper.gd

`AssetHelper.gd` provides utility functions for working with assets in the project.

### Functions

#### `get_random_temple_prop(prop_type: String) -> String`

Returns the path to a random temple prop of the specified type.

- **Parameters**:
  - `prop_type`: The type of prop to get ("flag", "rug", "vase", or "rubble")
- **Returns**: String path to the prop model

```gdscript
# Example usage
var prop_path = AssetHelper.get_random_temple_prop("flag")
var prop_mesh = load(prop_path)
```

#### `create_temple_pillar(position: Vector3, parent_node: Node) -> Node3D`

Creates a complete temple pillar (base, middle, top) at the specified position.

- **Parameters**:
  - `position`: The position to place the pillar
  - `parent_node`: The parent node to add the pillar to
- **Returns**: The created pillar node

```gdscript
# Example usage
var pillar = AssetHelper.create_temple_pillar(Vector3(0, 0, 0), self)
```

#### `create_temple_floor_grid(size: Vector2, position: Vector3, parent_node: Node) -> Node3D`

Creates a grid of temple floor tiles.

- **Parameters**:
  - `size`: The size of the grid (x, y)
  - `position`: The position to place the floor
  - `parent_node`: The parent node to add the floor to
- **Returns**: The created floor node

```gdscript
# Example usage
var floor = AssetHelper.create_temple_floor_grid(Vector2(5, 5), Vector3(0, 0, 0), self)
```

#### `create_basic_npc(position: Vector3, parent_node: Node, npc_name: String = "NPC") -> CharacterBody3D`

Creates a basic NPC at the specified position.

- **Parameters**:
  - `position`: The position to place the NPC
  - `parent_node`: The parent node to add the NPC to
  - `npc_name`: The name of the NPC (default: "NPC")
- **Returns**: The created NPC node

```gdscript
# Example usage
var npc = AssetHelper.create_basic_npc(Vector3(5, 0, 5), self, "Guard")
```

#### `add_dialog_to_npc(npc: CharacterBody3D, dialog_lines: Array, npc_name: String = "NPC") -> void`

Adds dialog capability to an existing NPC.

- **Parameters**:
  - `npc`: The NPC node to add dialog to
  - `dialog_lines`: An array of dialog lines
  - `npc_name`: The name of the NPC for the dialog (default: "NPC")

```gdscript
# Example usage
var dialog_lines = ["Hello there!", "Welcome to the temple."]
AssetHelper.add_dialog_to_npc(npc, dialog_lines, "Temple Guard")
```

#### `get_random_color_texture() -> Texture2D`

Returns a random color texture from the available textures.

- **Returns**: A random color texture

```gdscript
# Example usage
var texture = AssetHelper.get_random_color_texture()
```

## TempleBuilder.gd

`TempleBuilder.gd` provides utility functions for building temple environments.

### Functions

#### `create_temple_room(size: Vector2, position: Vector3, parent_node: Node) -> Node3D`

Creates a complete temple room with floor, pillars, and walls.

- **Parameters**:
  - `size`: The size of the room (x, y)
  - `position`: The position to place the room
  - `parent_node`: The parent node to add the room to
- **Returns**: The created room node

```gdscript
# Example usage
var room = TempleBuilder.create_temple_room(Vector2(5, 5), Vector3(0, 0, 0), self)
```

#### `create_temple_floor(size: Vector2, position: Vector3, parent_node: Node) -> Node3D`

Creates a temple floor of the specified size.

- **Parameters**:
  - `size`: The size of the floor (x, y)
  - `position`: The position to place the floor
  - `parent_node`: The parent node to add the floor to
- **Returns**: The created floor node

```gdscript
# Example usage
var floor = TempleBuilder.create_temple_floor(Vector2(5, 5), Vector3(0, 0, 0), self)
```

#### `create_temple_pillar(position: Vector3, parent_node: Node) -> Node3D`

Creates a temple pillar at the specified position.

- **Parameters**:
  - `position`: The position to place the pillar
  - `parent_node`: The parent node to add the pillar to
- **Returns**: The created pillar node

```gdscript
# Example usage
var pillar = TempleBuilder.create_temple_pillar(Vector3(0, 0, 0), self)
```

#### `create_temple_walls(size: Vector2, position: Vector3, parent_node: Node) -> Node3D`

Creates temple walls around a rectangular area.

- **Parameters**:
  - `size`: The size of the area to surround (x, y)
  - `position`: The position to place the walls
  - `parent_node`: The parent node to add the walls to
- **Returns**: The created walls node

```gdscript
# Example usage
var walls = TempleBuilder.create_temple_walls(Vector2(5, 5), Vector3(0, 0, 0), self)
```

#### `create_circular_temple_area(radius: float, position: Vector3, parent_node: Node) -> Node3D`

Creates a circular temple area with decorative elements.

- **Parameters**:
  - `radius`: The radius of the circular area
  - `position`: The position to place the area
  - `parent_node`: The parent node to add the area to
- **Returns**: The created circular area node

```gdscript
# Example usage
var circle = TempleBuilder.create_circular_temple_area(5.0, Vector3(0, 0, 0), self)
```

#### `add_decorative_elements(parent_node: Node, radius: float = 5.0) -> void`

Adds decorative elements (rugs, vases, flags) to a temple area.

- **Parameters**:
  - `parent_node`: The parent node to add the decorations to
  - `radius`: The radius to distribute decorations within (default: 5.0)

```gdscript
# Example usage
TempleBuilder.add_decorative_elements(self, 3.0)
```

#### `create_temple_entrance(position: Vector3, direction: Vector3, parent_node: Node) -> Node3D`

Creates a temple entrance with stairs, pillars, and an arch.

- **Parameters**:
  - `position`: The position to place the entrance
  - `direction`: The direction the entrance should face (normalized Vector3)
  - `parent_node`: The parent node to add the entrance to
- **Returns**: The created entrance node

```gdscript
# Example usage
var entrance = TempleBuilder.create_temple_entrance(Vector3(0, 0, 0), Vector3(0, 0, 1), self)
```

## Using the Utility Scripts

To use these utility scripts in your own scripts, you need to:

1. Add the class_name to your script's dependencies
2. Call the static functions directly

Example:

```gdscript
extends Node3D

# Make sure the utility scripts are loaded
const AssetHelper = preload("res://Scripts/Utils/AssetHelper.gd")
const TempleBuilder = preload("res://Scripts/Utils/TempleBuilder.gd")

func _ready():
    # Create a temple room
    var room = TempleBuilder.create_temple_room(Vector2(5, 5), Vector3(0, 0, 0), self)
    
    # Add an NPC
    var npc = AssetHelper.create_basic_npc(Vector3(2, 0, 2), self, "Temple Guardian")
    
    # Add dialog to the NPC
    var dialog_lines = ["Welcome to the temple.", "Feel free to explore."]
    AssetHelper.add_dialog_to_npc(npc, dialog_lines, "Temple Guardian")
```

## Extending the Utility Scripts

You can extend these utility scripts with your own functions by:

1. Creating a new script that extends the utility script
2. Adding your own functions
3. Using the extended script in your project

Example:

```gdscript
extends "res://Scripts/Utils/TempleBuilder.gd"

class_name ExtendedTempleBuilder

# Add your own functions
static func create_temple_maze(size: Vector2, position: Vector3, parent_node: Node) -> Node3D:
    # Implementation here
    pass
```

## ExampleLevelBuilder.gd

`ExampleLevelBuilder.gd` provides an example of how to use the utility scripts to create a temple environment with NPCs.

### Functions

#### `create_sample_temple() -> void`

Creates a sample temple environment with a main room, circular shrine, entrance, NPCs, and lighting.

```gdscript
# Example usage
var level_builder = ExampleLevelBuilder.new()
level_builder.create_sample_temple()
```

#### `add_temple_npcs() -> void`

Adds NPCs to the temple environment with dialog.

```gdscript
# Example usage
var level_builder = ExampleLevelBuilder.new()
level_builder.add_temple_npcs()
```

#### `add_lighting() -> void`

Adds lighting to the temple environment.

```gdscript
# Example usage
var level_builder = ExampleLevelBuilder.new()
level_builder.add_lighting()
```

### Using the Example Script

To use the example script:

1. Create a new scene with a Node3D as the root
2. Attach the ExampleLevelBuilder.gd script to the root node
3. Instance the scene in your level
4. Call the create_sample_temple() function from code or by uncommenting the line in _ready()

```gdscript
# Example of how to use the example script from another script
var example_builder = load("res://Scripts/Utils/ExampleLevelBuilder.gd").new()
add_child(example_builder)
example_builder.create_sample_temple()