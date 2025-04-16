# Senate3D Project Organization

## Overview

This document outlines the organization of the Senate3D project, a third-person controller template with NPCs, dialog system, and temple assets.

## Directory Structure

```
/Senate3D
├── Assets/
│   ├── Animations/           # Character animations
│   ├── Models/               # 3D models
│   │   ├── Characters/       # Character models
│   │   └── Environment/      # Environment models (temple pieces)
│   │       └── ModularTemple/# Modular temple assets
│   ├── Textures/             # Texture files
│   └── Materials/            # Material definitions
├── Scenes/
│   ├── Characters/           # Character scenes (player, NPCs)
│   ├── Levels/               # Level scenes
│   ├── UI/                   # UI scenes (dialog)
│   └── Props/                # Reusable prop scenes
├── Scripts/
│   ├── Characters/           # Character scripts
│   ├── UI/                   # UI scripts
│   └── Utils/                # Utility scripts
└── Documentation/            # Project documentation
```

## Asset Organization

### Characters

- **Player Character**: A third-person character controller with walking, running, and jumping animations
- **NPC System**: NPCs with wandering behavior, player interaction, and dialog capabilities

### Environment

- **Modular Temple**: A collection of modular temple pieces for level building
  - Floors, walls, pillars, balconies, and decorative elements
  - Can be assembled to create various temple layouts

### UI

- **Dialog System**: A simple dialog system for NPC interactions

## Important Notes

### Moving Assets in Godot

When reorganizing assets in Godot, it's important to use the FileSystem dock in the editor rather than moving files directly in the file system. This ensures that references in scenes are properly updated.

To move assets:
1. Open the Godot editor
2. In the FileSystem dock, drag and drop files to their new locations
3. Godot will automatically update references in scenes

### Importing New Assets

When importing new assets:
1. Place 3D models in the appropriate subdirectory of `Assets/Models/`
2. Place textures in `Assets/Textures/`
3. Create materials in `Assets/Materials/`
4. Create reusable prop scenes in `Scenes/Props/`

## Project Components

### Player Character

The player character features:
- WASD movement
- Running with Shift
- Jumping with Space
- Camera control with mouse
- Smooth animation transitions

### NPC System

The NPC system includes:
- Wandering behavior within a configurable radius
- Player interaction when in proximity
- Dialog system with customizable dialog lines
- NPCs can look at and optionally follow the player

### Dialog System

The dialog system provides:
- Simple text-based dialog
- NPC name display
- Dialog advancement with Space/Enter
- Automatic dialog triggering when player approaches NPC