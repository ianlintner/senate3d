# System Patterns

This file documents recurring patterns and standards used in the project.
2025-04-16 19:00:26 - Initial Memory Bank setup.

## Coding Patterns

* **Scene-based Structure**: The project uses scene-based organization with reusable scene components
* **GDScript Conventions**: Follows standard GDScript naming conventions with snake_case for variables and functions
* **Exported Properties**: Key configuration parameters are exposed via exported properties in the Inspector
* **Group-based References**: Player and dialog UI elements are identified using Godot groups (e.g., "player", "dialog_ui")
* **Modular Component Design**: NPCs use modular components (base NPC, interaction, dialog) for flexible functionality

## Architectural Patterns

* **Directory Structure**: Clear separation of Assets, Scenes, Scripts, and Documentation
* **Character Controller Pattern**: Player controller with separate movement and camera control
* **NPC AI Pattern**: State-based NPC behavior with wandering, interaction detection, and dialog
* **Scene Instancing Pattern**: Reusable scene components instantiated in different contexts
* **Utility Script Pattern**: Static utility classes with helper functions for common tasks

## Testing Patterns

* Not explicitly documented in the current project structure
* Could be enhanced with:
  - Unit tests for utility functions
  - Integration tests for character controllers
  - Scene validation tests