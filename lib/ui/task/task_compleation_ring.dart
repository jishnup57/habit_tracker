import 'dart:math';

import 'package:flutter/material.dart';

import '../theming/app_theme.dart';

class TaskCompleationRing extends StatelessWidget {

  final double progress;

  const TaskCompleationRing({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        painter: RingPainter(
          progress: progress,
          taskNotCompleatedColor: theme.taskRing,
          taskCompleatedColor: theme.accent,
        ),
      ),
    );
  }
}

class RingPainter extends CustomPainter {
  final double progress;
  final Color taskNotCompleatedColor;
  final Color taskCompleatedColor;

  RingPainter({
    required this.progress,
    required this.taskNotCompleatedColor,
    required this.taskCompleatedColor,
  }
  );

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width / 15;
    final Center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final Paint backgroundPaint = Paint()
      ..color = taskNotCompleatedColor
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(Center, radius, backgroundPaint);

    final Paint foregroundPaint = Paint()
      ..color = taskCompleatedColor
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;
    //..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: Center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant RingPainter oldDelegate) => oldDelegate.progress != progress;
}
