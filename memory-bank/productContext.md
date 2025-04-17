# Product Context

This file provides a high-level overview of the project and the expected product that will be created. Initially it is based upon projectBrief.md (if provided) and all other available project-related information in the working directory. This file is intended to be updated as the project evolves, and should be used to inform all other modes of the project's goals and context.
2025-04-16 18:59:35 - Initial Memory Bank setup.

## Project Goal

Senate3D is a third-person controller template for Godot 4.4 featuring:
- Smooth third-person character controller with walking, running, and jumping
- NPC system with wandering behavior, player interaction, and dialog
- Modular temple assets for building 3D environments
- Dialog UI system for character interactions
- Utility scripts for asset management and temple building

The goal is to provide a solid foundation for creating third-person adventure games, exploration games, or any game requiring character interaction in a 3D environment.

## Key Features

* **Player Character Controller**
  - WASD movement with Shift for running
  - Space for jumping
  - Mouse-controlled camera with collision avoidance
  - Smooth animation transitions between idle, walking, running, and jumping

* **NPC System**
  - NPCs with random wandering behavior within a defined radius
  - Interaction system for player proximity detection
  - NPCs can look at and optionally follow the player
  - Dialog system with customizable dialog lines

* **Temple Assets**
  - Modular temple pieces for building environments
  - Floors, walls, pillars, balconies, and decorative elements
  - Can be assembled to create various temple layouts

* **Dialog UI**
  - Simple text-based dialog system
  - NPC name display
  - Dialog advancement
  - Automatic dialog triggering

* **Utility Scripts**
  - AssetHelper.gd: Utility functions for working with assets
  - TempleBuilder.gd: Utility functions for building temple environments
  - ExampleLevelBuilder.gd: Example script showing usage

## Overall Architecture

The project follows a modular architecture with clear separation of concerns:

* **Directory Structure**
  - Assets/: Contains all art assets (models, textures, animations)
  - Scenes/: Contains all scene files (characters, levels, UI)
  - Scripts/: Contains all script files (character controllers, UI logic, utility scripts)
  - Documentation/: Contains detailed documentation for each system

* **Core Systems**
  - Player Controller System: Handles player movement, animation, and camera
  - NPC System: Handles NPC behavior, interactions, and dialog
  - Temple Building System: Provides tools for building temple environments
  - UI System: Manages dialog display and interaction

* **Integration Points**
  - NPCs interact with player through proximity detection
  - Dialog UI is triggered by NPC interactions
  - Utility scripts provide high-level functions for scene creation