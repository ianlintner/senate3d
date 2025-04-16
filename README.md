# Senate3D - Third Person Controller with NPCs and Temple Assets

## Overview

Senate3D is a third-person controller template for Godot 4.4 featuring:

- Smooth third-person character controller with walking, running, and jumping
- NPC system with wandering behavior, player interaction, and dialog
- Modular temple assets for building 3D environments
- Dialog UI system for character interactions
- Utility scripts for asset management and temple building

This project provides a solid foundation for creating third-person adventure games, exploration games, or any game requiring character interaction in a 3D environment.

## Getting Started

1. Open the project in Godot 4.4 or later
2. Open the main scene at `Scenes/Levels/prototype.tscn`
3. Press F5 or click the Play button to run the game
4. Use WASD to move, Shift to run, Space to jump, and mouse to control the camera

## Project Structure

The project is organized into the following directories:

- **Assets/**: Contains all art assets (models, textures, animations)
- **Scenes/**: Contains all scene files (characters, levels, UI)
- **Scripts/**: Contains all script files (character controllers, UI logic, utility scripts)
- **Documentation/**: Contains detailed documentation for each system

## Documentation

Detailed documentation is available for each component of the project:

- [Project Organization](Documentation/ProjectOrganization.md): Overview of the project structure
- [Player Controller](Documentation/PlayerController.md): Details on the player character controller
- [NPC System](Documentation/NPCSystem.md): Guide to the NPC and dialog systems
- [Temple Assets](Documentation/TempleAssets.md): Guide to using the modular temple assets
- [Utility Scripts](Documentation/UtilityScripts.md): Guide to using the utility scripts
- [Asset Organization Guide](Documentation/AssetOrganizationGuide.md): Guide to organizing assets in Godot

## Features

### Player Character

- WASD movement with Shift for running
- Space for jumping
- Mouse-controlled camera with collision avoidance
- Smooth animation transitions between idle, walking, running, and jumping

### NPC System

- NPCs that wander randomly within a defined radius
- Interaction system that detects when the player is nearby
- NPCs can look at and optionally follow the player
- Dialog system with customizable dialog lines

### Temple Assets

- Modular temple pieces for building environments
- Floors, walls, pillars, balconies, and decorative elements
- Can be assembled to create various temple layouts

### Dialog UI

- Simple text-based dialog system
- NPC name display
- Dialog advancement with Space/Enter
- Automatic dialog triggering when player approaches NPC

## Customization

All components can be customized through exported variables in the Inspector:

- Player movement speed, jump height, and gravity
- NPC walking speed, wander radius, and interaction distance
- Camera sensitivity, zoom, and collision settings
- Dialog appearance and behavior

Additionally, utility scripts are provided to help with common tasks:

- **AssetHelper.gd**: Utility functions for working with assets
- **TempleBuilder.gd**: Utility functions for building temple environments

## Credits

- Original template by WaffleAWT
- Character model and animations included in the Assets directory
- Modular temple assets included in the Assets directory

## License

See the [LICENSE.txt](LICENSE.txt) file for details.

## Contact

For questions or suggestions, contact the original template creator:
- Discord: WaffleAWT