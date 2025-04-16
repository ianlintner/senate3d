# Player Character Controller Guide

## Overview

The player character controller provides a third-person character with walking, running, jumping, and smooth animation transitions. It's designed to work with the included character model and animations.

## Components

### 1. Player Script (Scripts/Characters/Player.gd)

The main player script handles:
- Movement using WASD keys
- Running with Shift
- Jumping with Space
- Gravity and collision handling
- Animation transitions

### 2. Spring Arm Pivot (Scripts/Characters/SpringArmPivot.gd)

This script handles:
- Camera rotation with mouse movement
- Camera zoom with mouse wheel
- Camera collision avoidance
- Smooth camera movement

## Character Setup

The player character consists of:
1. A CharacterBody3D as the root node
2. A CollisionShape3D for physics interactions
3. A Node3D named "Mesh" containing the character model
4. A SpringArmPivot for camera control
5. An AnimationTree for handling animations

## Controls

- **W/A/S/D**: Move forward/left/backward/right
- **Shift**: Run
- **Space**: Jump
- **Mouse Movement**: Rotate camera
- **Mouse Wheel**: Zoom camera (if enabled)

## Customization

The player controller can be customized through exported variables in the Inspector:

### Player.gd
- walk_speed: How fast the player walks (default: 2.0)
- run_speed: How fast the player runs (default: 5.0)
- jump_strength: How high the player jumps (default: 15.0)
- gravity: How strong gravity is (default: 50.0)

### SpringArmPivot.gd
- mouse_sensitivity: How sensitive the camera is to mouse movement
- invert_y: Whether to invert the Y-axis for camera control
- zoom_enabled: Whether to enable camera zoom with mouse wheel
- min_zoom: Minimum zoom distance
- max_zoom: Maximum zoom distance
- zoom_speed: How fast the camera zooms

## Animation System

The player uses an AnimationTree with:
- A state machine for ground/air transitions
- A blend tree for idle/walk/run transitions
- Smooth blending between animations

The animations are controlled by:
- Movement state (idle, walking, running)
- Whether the player is on the ground or in the air

## Integration with Level Design

The player character is scaled appropriately for the included temple assets. The character can navigate the temple environment without scaling issues.

## Adding the Player to a Level

1. Instance the player.tscn scene in your level
2. Position the player at the desired starting location
3. Make sure the player is added to the "player" group for NPC interactions

## Camera Considerations

The camera uses a SpringArm setup which:
- Follows the player smoothly
- Avoids clipping through walls
- Maintains a consistent distance from the player
- Can be rotated around the player

## Physics Considerations

The player uses a CharacterBody3D with:
- A capsule collision shape for accurate collision detection
- Floor snapping for smooth movement on surfaces
- Gravity for realistic jumping and falling
- Proper handling of slopes and stairs

## Code Examples

### Modifying Player Speed in Code

```gdscript
# Example of how to modify player speed in code
var player = get_node("path/to/player")
player.walk_speed = 3.0  # Set walk speed to 3.0
player.run_speed = 7.0   # Set run speed to 7.0
```

### Adding Custom Input Handling

```gdscript
# Example of how to add custom input handling to the player
# Add this to a script extending the Player.gd script

func _input(event):
    if event.is_action_pressed("crouch"):
        # Handle crouching
        pass
    
    # Call the parent _input function to maintain existing functionality
    super._input(event)
```

## Troubleshooting

### Player Not Moving
- Check that the input mappings are correctly set in the project settings
- Verify the player script is attached correctly
- Ensure the player is not colliding with other objects

### Camera Not Rotating
- Check that the SpringArmPivot script is attached correctly
- Verify the mouse sensitivity is not set to 0
- Ensure the mouse is captured in the game window

### Animations Not Playing
- Check that the AnimationTree is correctly configured
- Verify the animation resources are properly loaded
- Ensure the animation parameters are being set correctly

### Player Falling Through Floor
- Check that the floor has proper collision shapes
- Verify the gravity and floor snapping settings
- Ensure the physics process is running correctly