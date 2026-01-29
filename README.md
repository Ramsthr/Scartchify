# Scratchify

[![pub package](https://img.shields.io/pub/v/scratchify.svg)](https://pub.dev/packages/scratchify)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A Flutter package for creating interactive scratch card widgets, perfect for lottery games, reveal animations, and interactive UI elements.

## Features

- 🎨 **Customizable Scratch Experience**: Adjust brush size, shape, color, and opacity
- 🎭 **Multiple Brush Shapes**: Circle, square, star, heart, and diamond shapes
- ✨ **Reveal Animations**: Fade, scale, slide, bounce, and zoom effects
- 📱 **Haptic Feedback**: Optional vibration feedback during scratching
- 📊 **Progress Tracking**: Real-time scratching progress with customizable thresholds
- 🖱️ **Tap to Scratch**: Enable/disable tap scratching functionality
- 🎯 **High Performance**: Optimized grid-based scratching algorithm

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  scratchify: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Example

```dart
import 'package:scratchify/scratchify.dart';

class MyScratchCard extends StatefulWidget {
  @override
  _MyScratchCardState createState() => _MyScratchCardState();
}

class _MyScratchCardState extends State<MyScratchCard> {
  late final ScratchController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScratchController(
      config: const ScratchConfig(
        revealFullAtPercent: 0.5, // Reveal when 50% scratched
        brushSize: 25.0,
        brushShape: BrushShape.circle,
        revealAnimationType: RevealAnimationType.fade,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScratchCard(
      controller: _controller,
      overlay: Container(
        color: Colors.grey[300],
        child: Center(
          child: Text(
            'Scratch to Reveal!',
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
        ),
      ),
      child: Container(
        color: Colors.yellow,
        child: Center(
          child: Text(
            '🎉 You Won! 🎉',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
```

### Advanced Configuration

```dart
ScratchController controller = ScratchController(
  config: ScratchConfig(
    revealFullAtPercent: 0.7,
    gridResolution: 200, // Higher = smoother but more performance intensive
    brushSize: 30.0,
    brushColor: Colors.blue,
    brushOpacity: 0.8,
    brushShape: BrushShape.star,
    enableHapticFeedback: true,
    revealAnimationType: RevealAnimationType.bounce,
    animationDurationMs: 800,
    enableProgressAnimation: true,
    enableTapToScratch: false,
  ),
);
```

### Controller Methods

```dart
// Reveal the entire card
controller.reveal();

// Reset the scratch state
controller.reset();

// Check if fully revealed
bool isComplete = controller.isCompleted;

// Get current progress (0.0 to 1.0)
double progress = controller.progress;
```

## API Reference

### ScratchCard

The main widget that provides the scratch card functionality.

**Parameters:**
- `controller`: Required `ScratchController` instance
- `overlay`: Widget displayed as the scratchable layer
- `child`: Widget revealed underneath the overlay

### ScratchController

Manages the scratch state and configuration.

**Constructor:**
```dart
ScratchController({required ScratchConfig config})
```

**Methods:**
- `reveal()`: Instantly reveals the entire card
- `reset()`: Resets the scratch state
- `scratchAt(Offset position, Size size)`: Programmatically scratch at a position

**Properties:**
- `isCompleted`: Whether the card is fully revealed
- `progress`: Current scratch progress (0.0 to 1.0)

### ScratchConfig

Configuration class for customizing the scratch behavior.

**Parameters:**
- `revealFullAtPercent`: Percentage of area that needs to be scratched to consider it complete (default: 0.5)
- `isScratchingEnabled`: Whether scratching is enabled (default: true)
- `gridResolution`: Grid resolution for scratch detection (default: 100)
- `enableTapToScratch`: Allow tapping to scratch (default: false)
- `brushSize`: Size of the scratch brush (default: 20.0)
- `brushColor`: Color of the scratch brush (default: Colors.transparent)
- `brushOpacity`: Opacity of the brush (default: 1.0)
- `brushShape`: Shape of the brush (default: BrushShape.circle)
- `enableHapticFeedback`: Enable vibration feedback (default: false)
- `revealAnimationType`: Animation when revealing (default: RevealAnimationType.none)
- `animationDurationMs`: Duration of reveal animation in milliseconds (default: 500)
- `enableProgressAnimation`: Animate progress changes (default: false)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Credits

This package is inspired by and takes reference from [Scratchify](https://github.com/gsrathoreniks/Scratchify) by gsrathoreniks.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
