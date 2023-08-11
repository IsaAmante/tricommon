import 'package:flutter/material.dart';
import 'package:tricommon/common.dart';

class LinearLoading extends StatefulWidget {
  const LinearLoading({
    super.key,
    this.backgroundColor,
    this.color,
    this.duration = 1700,
  });

  final Color? backgroundColor;
  final Color? color;
  final int duration;

  @override
  State<LinearLoading> createState() => _LinearProgressIndicatorState();
}

class _LinearProgressIndicatorState extends State<LinearLoading> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    );
    _controller.repeat();
  }

  @override
  void didUpdateWidget(LinearLoading oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_controller.isAnimating) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (BuildContext context, Widget? child) {
        return _buildIndicator(context, _controller.value);
      },
    );
  }

  Widget _buildIndicator(
    BuildContext context,
    double animationValue,
  ) {
    final Color backgroundColor = widget.backgroundColor ?? ColorPalette.colorPrimary500;
    final loadingColor = widget.color ?? ColorPalette.colorPrimary500;

    return Container(
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: 2.wsp,
      ),
      child: CustomPaint(
        painter: _LinearLoadingPainter(
          backgroundColor: backgroundColor,
          valueColor: loadingColor,
          animationValue: animationValue,
        ),
      ),
    );
  }
}

class _LinearLoadingPainter extends CustomPainter {
  const _LinearLoadingPainter({
    required this.backgroundColor,
    required this.valueColor,
    required this.animationValue,
  });

  final Color backgroundColor;
  final Color valueColor;
  final double animationValue;

  static const Curve interval = Interval(
    0.0,
    1,
    curve: Curves.fastLinearToSlowEaseIn,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset.zero & size, paint);

    paint.color = valueColor;

    void drawBar(double x, double width) {
      if (width <= 0.0) {
        return;
      }

      final double left = x;
      canvas.drawRect(Offset(left, 0.0) & Size(width, size.height), paint);
    }

    final x = size.width * interval.transform(animationValue);
    final double excess = (x + (size.width / 5)) - size.width;
    final double finalWidth = (excess > 0) ? (size.width / 5 - excess) : (size.width / 5);
    drawBar(x, finalWidth);
  }

  @override
  bool shouldRepaint(_LinearLoadingPainter oldPainter) {
    return oldPainter.backgroundColor != backgroundColor || oldPainter.valueColor != valueColor || oldPainter.animationValue != animationValue;
  }
}
