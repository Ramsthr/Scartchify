/// A Flutter package for creating interactive scratch card widgets.
///
/// This package provides a [ScratchCard] widget that allows users to scratch
/// off an overlay to reveal content underneath, similar to lottery scratch cards.
///
/// ## Features
///
/// - Customizable brush size, shape, and color
/// - Various reveal animations
/// - Haptic feedback support
/// - Progress tracking
/// - Tap to scratch functionality
///
/// ## Usage
///
/// ```dart
/// import 'package:scratchify/scratchify.dart';
///
/// ScratchController controller = ScratchController(
///   config: ScratchConfig(
///     revealFullAtPercent: 0.5,
///     brushSize: 20.0,
///     brushShape: BrushShape.circle,
///   ),
/// );
///
/// ScratchCard(
///   controller: controller,
///   overlay: Image.asset('assets/scratch_overlay.png'),
///   child: Text('You won!'),
/// );
/// ```

library scratchify;

export 'scratch_card.dart';
export 'scratch_config.dart';
export 'scratch_controller.dart';
