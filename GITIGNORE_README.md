# Godot .gitignore Explanation

This `.gitignore` file is configured specifically for Godot 4.x projects. It helps keep your Git repository clean by excluding files that shouldn't be tracked in version control.

## What's Included

### Godot-specific Ignores
- `.godot/` - Godot's cache and temporary files
- `.import/` - Imported resource files
- `export.cfg` and `export_presets.cfg` - Export configuration files
- `*.translation` - Generated translation files

### Mono/.NET Ignores (for C# projects)
- `.mono/` - Mono-specific files
- `data_*/` - Generated data files
- `mono_crash.*.json` - Crash logs

### Build Directories
- `build/`, `builds/`, `bin/`, `obj/` - Build output directories

### Generated and Temporary Files
- `*.gen.*`, `*.generated.*` - Generated code files
- `*.tmp`, `*.temp`, `*.swp`, `*~` - Temporary files
- `*.log` - Log files

### OS-specific Files
- `.DS_Store`, `Thumbs.db`, etc. - Operating system metadata files

### Editor-specific Files
- `.vscode/`, `.idea/`, `.vs/` - Editor configuration directories
- `*.code-workspace` - VS Code workspace files

### Detailed Godot 4.x Ignores
- Various cache and editor state files within the `.godot/` directory

## Customization

### Asset Files
By default, all asset files are tracked in version control. If you want to exclude certain asset types, uncomment the relevant lines at the bottom of the file.

For example, to exclude PNG files:
```
*.png
```

### Project-specific Ignores
You may want to add project-specific ignores based on your workflow. Add them in the appropriate section or at the end of the file.

## Best Practices

1. **Do track**:
   - Source code (`.gd`, `.cs`, `.tscn`, `.tres`)
   - Asset files (models, textures, sounds)
   - Project configuration files

2. **Don't track**:
   - Generated files
   - Build outputs
   - Temporary files
   - Large binary files that change frequently

3. **Consider LFS**:
   - For large binary files, consider using Git LFS (Large File Storage)
   - This is especially useful for large models, textures, or audio files

## Additional Resources

- [Godot Documentation](https://docs.godotengine.org)
- [Git Documentation](https://git-scm.com/doc)
- [GitHub's .gitignore Templates](https://github.com/github/gitignore)