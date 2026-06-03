# Nula

<p align="center">
  <img src="preview.png" alt="Nula Preview">
</p>

A minimalist SDDM theme featuring a smooth user carousel and modern dark interface.

## Overview

Nula is a modern SDDM theme featuring a smooth user carousel, subtle animations, and a clean dark interface designed to stay out of the way while still looking distinctive.

The theme takes inspiration from minimalist design principles, emphasizing clarity, motion, and simplicity.

## Features

* Smooth user carousel
* Dark minimalist interface
* Large branded background element
* Session selector integration
* Power controls

## Installation

Clone the repository:

```bash
git clone https://github.com/l7p3x/Nula-SDDM.git
```

Install the theme:

```bash
sudo cp -r Nula-SDDM /usr/share/sddm/themes/nula
```

Configure SDDM:

```ini
[Theme]
Current=nula
```

Restart SDDM or reboot the system.

## Screenshots

### Login Screen

![Login Screen](preview2.gif)

## Directory Structure

```text
Nula-SDDM/
├── assets/
├── components/
├── Main.qml
├── metadata.desktop
└── theme.conf
```

## Customization

The theme exposes only a few basic configuration options through the `theme.conf` file, including:

- Default avatar
- Avatar size
- Avatar border color
- Avatar border width

More advanced customizations, such as:

- Animations
- Interface layout
- User carousel behavior
- Session controls appearance
- Element positioning

require editing the theme's QML files directly.

## Dependencies

- SDDM
- QtQuick
- QtQuick.Controls
- Qt5Compat.GraphicalEffects

## License

MIT License. See the LICENSE file for details.

## Author

Created by **l7p3x**
