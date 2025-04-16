# NPC System for Godot 4.3 Third-Person Controller

This NPC system extends the Third-Person Controller template with NPCs that can wander, interact with the player, and engage in dialog. The system is modular, allowing you to choose which features to include.

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

## Setup Instructions

Detailed setup instructions are provided in:
- `Scenes/Characters/npc_setup_instructions.txt` - How to set up the NPC character
- `Scenes/UI/dialog_ui_setup_instructions.txt` - How to set up the dialog UI

## Usage Examples

### Basic Wandering NPC

```gdscript
# Example of how to create a wandering NPC in code
var npc_scene = load("res://Scenes/Characters/npc.tscn")
var npc_instance = npc_scene.instantiate()
npc_instance.global_position = Vector3(10, 0, 10)  # Set position
add_child(npc_instance)
```

### NPC with Dialog

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

## Customization

All NPC behaviors can be customized through exported variables in the Inspector:

- **NPC.gd**:
  - walk_speed: How fast the NPC walks
  - wander_radius: How far from its starting point the NPC will wander
  - wander_timer_min/max: How long the NPC waits between wandering

- **NPCInteraction.gd**:
  - interaction_radius: How close the player needs to be to trigger interaction
  - look_at_player: Whether the NPC turns to face the player
  - follow_player: Whether the NPC follows the player
  - follow_distance: How close the NPC tries to get when following

- **NPCDialogInteraction.gd**:
  - npc_name: The name displayed in the dialog
  - dialog_lines: The lines of dialog the NPC will say

## Integration with Existing Project

The NPC system is designed to work with the existing Third-Person Controller template. The NPCs use the same character model and animations as the player, creating a consistent visual style.

### Important Setup Notes

1. **Player Group**: For the NPC interaction to work properly, you must add the player character to a group:
   - Add the player to the "player" group (lowercase)
   - For compatibility, you can also add it to the "Player" group (uppercase)
   - In the Inspector, go to Node > Groups and add these groups to the player's root node

2. **Dialog UI Group**: If using the dialog system, add your dialog UI to the "dialog_ui" group for automatic detection

## Extending the System

The modular design makes it easy to extend the system with additional features:
- Add more complex dialog trees
- Implement quest systems
- Add combat interactions
- Create merchant NPCs with inventory systems
