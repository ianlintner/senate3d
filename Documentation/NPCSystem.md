# NPC and Dialog System Guide

## Overview

The NPC system provides interactive characters with wandering behavior, player interaction, and dialog capabilities. The system is modular, allowing you to choose which features to include.

## Components

### 1. NPC Character (Scripts/Characters/NPC.gd)

The base NPC script provides:
- Random wandering behavior within a configurable radius
- Animation handling (idle, walk)
- Gravity and collision handling
- Customizable movement parameters

### 2. NPC Interaction (Scripts/Characters/NPCInteraction.gd)

This optional component adds:
- Player proximity detection
- NPC looking at player when nearby
- Optional following behavior
- Customizable interaction radius and follow distance

### 3. NPC Dialog (Scripts/Characters/NPCDialogInteraction.gd & Scripts/UI/NPCDialog.gd)

This optional component adds:
- Simple dialog system
- Automatic dialog triggering when player approaches
- Customizable dialog lines and NPC name
- UI for displaying dialog

## Setting Up NPCs

### Basic NPC Setup

1. Create a new scene with a CharacterBody3D as the root node
2. Name the root node "NPC"
3. Attach the "NPC.gd" script to this node
4. Add a CollisionShape3D with a CapsuleShape3D (height: 1.8, radius: 0.4)
5. Add a Node3D named "Mesh" with the character model
6. Add an AnimationTree with the appropriate animations
7. Configure the exported variables in the Inspector

### Adding Interaction

1. Add a Node as a child of the NPC node and name it "Interaction"
2. Attach the "NPCInteraction.gd" script to this node
3. Configure the interaction parameters in the Inspector:
   - interaction_radius: How close the player needs to be (default: 3.0)
   - look_at_player: Whether the NPC turns to face the player (default: true)
   - follow_player: Whether the NPC follows the player (default: false)
   - follow_distance: How close the NPC tries to get when following (default: 2.0)

### Adding Dialog

1. First, set up the Dialog UI (see below)
2. Add a Node as a child of the NPC node and name it "DialogInteraction"
3. Attach the "NPCDialogInteraction.gd" script to this node
4. Configure the interaction parameters as above
5. Configure the dialog parameters in the Inspector:
   - npc_name: The name of the NPC to display in the dialog
   - dialog_lines: An array of strings containing the NPC's dialog lines
   - dialog_ui_path: The path to the DialogUI node in your scene

## Setting Up the Dialog UI

1. Create a new scene with a Control node as the root
2. Name the root node "DialogUI"
3. Add the node to the "dialog_ui" group
4. Attach the "NPCDialog.gd" script to this node
5. Add a Panel (or NinePatchRect) named "DialogBox"
6. Add a Label named "NameLabel" as a child of DialogBox
7. Add a Label named "DialogText" as a child of DialogBox
8. Configure the exported variables in the Inspector
9. Instance the dialog_ui.tscn scene in your main level scene
10. Make sure it's added to the CanvasLayer

## Player Setup for Interaction

For the interaction system to work properly:
1. Add the player to the "player" group (lowercase)
2. For compatibility, you can also add it to the "Player" group (uppercase)
3. In the Inspector, go to Node > Groups and add these groups to the player's root node

## Customization

All NPC behaviors can be customized through exported variables in the Inspector:

### NPC.gd
- walk_speed: How fast the NPC walks
- wander_radius: How far from its starting point the NPC will wander
- wander_timer_min/max: How long the NPC waits between wandering

### NPCInteraction.gd
- interaction_radius: How close the player needs to be to trigger interaction
- look_at_player: Whether the NPC turns to face the player
- follow_player: Whether the NPC follows the player
- follow_distance: How close the NPC tries to get when following

### NPCDialogInteraction.gd
- npc_name: The name displayed in the dialog
- dialog_lines: The lines of dialog the NPC will say

## Code Examples

### Creating an NPC in Code

```gdscript
# Example of how to create a wandering NPC in code
var npc_scene = load("res://Scenes/Characters/npc.tscn")
var npc_instance = npc_scene.instantiate()
npc_instance.global_position = Vector3(10, 0, 10)  # Set position
add_child(npc_instance)
```

### Configuring Dialog in Code

```gdscript
# Example of how to configure an NPC with dialog in code
var dialog_interaction = npc_instance.get_node("DialogInteraction")
dialog_interaction.npc_name = "Village Guard"
dialog_interaction.dialog_lines = [
    "Halt! Who goes there?",
    "Oh, it's just you. Carry on.",
    "Keep an eye out for monsters outside the village."
]
```

## Extending the System

The modular design makes it easy to extend the system with additional features:
- Add more complex dialog trees
- Implement quest systems
- Add combat interactions
- Create merchant NPCs with inventory systems

## Troubleshooting

### NPC Not Interacting with Player
- Check that the player is in the "player" group
- Verify the interaction_radius is large enough
- Ensure the NPCInteraction script is attached correctly

### Dialog Not Appearing
- Check that the DialogUI is in the "dialog_ui" group
- Verify the dialog_ui_path is set correctly
- Ensure the DialogUI is visible in the scene tree

### NPC Not Wandering
- Check that the wander_radius is greater than 0
- Verify the NPC has enough clear space to wander
- Ensure the NPC.gd script is attached correctly