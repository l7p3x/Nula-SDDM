# Nula

A minimalist SDDM theme focused on elegance, fluid navigation, and a distraction-free login experience.

<p align="center">
  <img src="preview.png" alt="Nula Preview" width="900">
</p>

## Overview

Nula is a modern SDDM theme featuring a smooth user carousel, subtle animations, and a clean dark interface designed to stay out of the way while still looking distinctive.

The theme takes inspiration from minimalist design principles, emphasizing clarity, motion, and simplicity.

## Features

* Smooth user carousel
* Dark minimalist interface
* Large branded background element
* Session selector integration
* Power controls
* Lightweight QML implementation
* Keyboard-friendly navigation

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

![Login Screen](preview.png)

## Directory Structure

```text
Nula-SDDM/
├── Main.qml
├── components/
├── assets/
├── metadata.desktop
└── README.md
```

## Customization

You can customize:

* Colors
* Fonts
* Background elements
* Animations
* User carousel behavior
* Session selector appearance

Most visual changes can be made directly through the QML files.

## Compatibility

* SDDM
* Plasma (X11 / Wayland)
* Qt 5
* Qt 6

## License

MIT License

## Author

Created by **l7p3x**
