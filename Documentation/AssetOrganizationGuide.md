# Asset Organization Guide

## Overview

This guide explains how to properly organize the project assets using the Godot editor to maintain all references and ensure the project continues to function correctly.

## Important Note

**Do not move files directly in the file system!** This can break references in scenes. Always use the Godot editor's FileSystem dock to move files, as it will update all references automatically.

## Recommended Organization

We recommend organizing the assets into the following structure:

```
/Assets
├── Animations/           # Character animations
├── Models/               # 3D models
│   ├── Characters/       # Character models
│   └── Environment/      # Environment models
│       └── ModularTemple/# Modular temple assets
├── Textures/             # Texture files
└── Materials/            # Material definitions
```

## Step-by-Step Organization Process

### 1. Open the Project in Godot

1. Launch Godot Engine
2. Open the Senate3D project
3. Make sure the FileSystem dock is visible (View > FileSystem)

### 2. Create Required Directories

The following directories have already been created:
- Assets/Materials
- Assets/Models/Environment/ModularTemple
- Scripts/Utils
- Documentation
- Scenes/Props

### 3. Organize Temple Assets

1. In the FileSystem dock, select all .obj files in Assets/external/Modular Temple/
2. Right-click and select "Move To..."
3. Navigate to Assets/Models/Environment/ModularTemple/
4. Click "OK" to move the files
5. Move the Materials_Modular_Temple.mtl file to Assets/Materials/

### 4. Organize Other External Assets

1. Move assets from Assets/external/ancient-temple/ to Assets/Models/Environment/
2. Move assets from Assets/external/basechar/ to Assets/Models/Characters/
3. Move assets from Assets/external/Temple/ to Assets/Models/Environment/

### 5. Organize Textures

1. Keep the existing textures in Assets/Textures/
2. If you add new textures, place them in the appropriate subdirectory

### 6. Update Project Settings (if needed)

If you encounter any issues with missing resources after reorganizing:

1. Go to Project > Project Settings
2. Navigate to the "General" tab and the "Filesystem" section
3. Check if any paths need to be updated in the "Resource Paths" settings

## Tips for Adding New Assets

### Adding New Models

1. Import the model file into the appropriate subdirectory of Assets/Models/
2. Configure the import settings in the Import dock
3. Create materials in Assets/Materials/ if needed
4. Create a scene for the model if it will be used as a prop

### Adding New Textures

1. Import the texture file into Assets/Textures/
2. Configure the import settings in the Import dock
3. Assign the texture to materials as needed

### Adding New Animations

1. Import the animation file into Assets/Animations/
2. Configure the import settings in the Import dock
3. Add the animation to the appropriate AnimationPlayer or AnimationTree

## Troubleshooting

### Missing Resources

If you see pink/purple error materials or missing resources after moving files:

1. Check the error console for specific error messages
2. Verify that all files were moved correctly
3. Open the affected scenes and update any broken references manually
4. Reimport the project if necessary (Project > Tools > Reimport All Resources)

### Import Errors

If you encounter import errors when moving files:

1. Check the import settings for the affected files
2. Make sure all dependencies are available
3. Try reimporting the specific file (right-click > Reimport)