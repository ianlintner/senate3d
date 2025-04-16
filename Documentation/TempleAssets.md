# Modular Temple Assets Guide

## Overview

The modular temple assets are a collection of 3D models that can be used to create various temple environments. These assets are designed to be modular, allowing for flexible level design.

## Asset Categories

### Floors

- **Floor_Normal_Square**: Basic square floor tile
- **Floor_Curved_Large/Small**: Curved floor pieces for creating circular areas
- **Floor_Curved_Large/Small_Outer**: Outer curved floor pieces
- **Floor_Bridge_Ramp**: Ramp/bridge floor piece
- **Floor_Tower_Balcony**: Special floor for tower balconies
- **Floor_Ruined**: Various ruined floor pieces for creating damaged areas

### Balconies

- **Balcony_Base**: Various balcony base pieces (Straight, Curved, Bridge, Tower)
- **Balcony_Railing**: Matching railing pieces for balconies

### Pillars

- **Pillar_Large**: Base, middle, and top pieces for large pillars
- **Pillar_Large_Arch/Beam**: Arch and beam pieces that connect pillars
- **Pillar_Wall**: Base, middle, and top pieces for wall pillars

### Decorative Elements

- **Prop_Flag**: Various flag designs (Sun, Moon, Stars, Eclipse)
- **Prop_Flag_Stand**: Flag stand pieces
- **Prop_Rubble**: Rubble pieces for decoration
- **Prop_Rug**: Various rug designs (Sun, Moon, Stars, Eclipse)
- **Prop_Vase**: Decorative vases

## Usage Tips

### Building Basic Structures

1. **Floors**: Start by laying out the floor plan using the floor pieces
2. **Pillars**: Add pillars at key points, building them from base, middle, and top pieces
3. **Walls**: Use wall pillars to create wall sections
4. **Balconies**: Add balconies along edges with appropriate railings
5. **Decoration**: Add rugs, flags, and other decorative elements

### Creating Circular Areas

1. Use the curved floor pieces to create circular or semi-circular areas
2. Combine large and small curved pieces for varied circular shapes
3. Use the outer curved pieces for the perimeter

### Creating Elevated Areas

1. Use the bridge/ramp pieces to connect different height levels
2. Create balconies along elevated areas using the balcony pieces
3. Add railings to prevent player from falling

### Creating Ruined Areas

1. Use the ruined floor pieces to create damaged sections
2. Add rubble props around ruined areas for detail
3. Mix intact and ruined pieces for a partially destroyed look

## Material Information

The materials for all temple assets are defined in the `Materials_Modular_Temple.mtl` file. This file contains:

- Base stone material for structural elements
- Decorative materials for flags, rugs, and other props
- Variation materials for creating visual diversity

## Optimization Tips

1. **Instance Repeated Elements**: Use instancing for repeated elements like pillars
2. **LOD Considerations**: Consider creating LOD (Level of Detail) versions for distant views
3. **Occlusion Culling**: Set up occlusion culling for complex temple layouts
4. **Batching**: Group similar materials to reduce draw calls

## Integration with Character System

The temple assets are scaled appropriately for the included character controller. The player and NPCs should navigate the temple environment without scaling issues.

## Example Layouts

Here are some example layouts you can create with these assets:

1. **Main Temple Hall**: Large square area with pillars and decorative rugs
2. **Circular Shrine**: Circular area with central decorative element
3. **Elevated Walkways**: Connected balconies with railings
4. **Ruined Section**: Partially destroyed area with rubble
5. **Ceremonial Path**: Long hallway with flags and decorative elements