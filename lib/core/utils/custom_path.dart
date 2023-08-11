import 'package:flutter/material.dart';

class CustomPath extends StatelessWidget {
  final _GradientPainter _painter;
  final Widget _child;
  final double _radius;

  CustomPath({
    super.key,
    required double strokeWidth,
    required double radius,
    required Gradient gradient,
    Widget? child,
  })  : _painter = _GradientPainter(
          strokeWidth: strokeWidth,
          radius: radius,
          gradient: gradient,
        ),
        _child = child ?? Container(),
        _radius = radius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: InkWell(
        borderRadius: BorderRadius.circular(_radius),
        child: Container(
          constraints: const BoxConstraints(minWidth: 10, minHeight: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _child,
            ],
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter({
    required this.strokeWidth,
    required this.radius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    _paint.shader = gradient.createShader(outerRect);

    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
