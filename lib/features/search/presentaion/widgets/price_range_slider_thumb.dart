import 'package:flutter/material.dart';

class PriceRangeSliderThumb extends RangeSliderThumbShape {
  final double thumbRadius;

  const PriceRangeSliderThumb({
    this.thumbRadius = 12.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    @required Animation<double> activationAnimation,
    @required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool isOnTop,
    @required SliderThemeData sliderTheme,
    TextDirection textDirection,
    Thumb thumb,
    bool isPressed,
  }) {
    final canvas = context.canvas;
    final rect = Rect.fromCircle(center: center, radius: thumbRadius);
    final rrect = RRect.fromRectAndRadius(
      Rect.fromPoints(
        Offset(rect.left, rect.top),
        Offset(rect.right, rect.bottom),
      ),
      Radius.circular(thumbRadius),
    );
    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final borderPaint = Paint()
      ..color = sliderTheme.activeTrackColor
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(rrect, fillPaint);
    canvas.drawRRect(rrect, borderPaint);
  }
}
