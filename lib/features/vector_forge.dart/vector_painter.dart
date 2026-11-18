import 'dart:math';
import 'package:flutter/material.dart';
import 'vector_model.dart';

class VectorPainter extends CustomPainter {
  final Vector3D vectorA;
  final Vector3D vectorB;
  final Vector3D sumVector;
  final bool is3DView;
  final double scale;
  final double rotationX;
  final double rotationY;

  VectorPainter({
    required this.vectorA,
    required this.vectorB,
    required this.sumVector,
    required this.is3DView,
    required this.scale,
    required this.rotationX,
    required this.rotationY,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    Offset toScreen(Vector3D v) {
      double x = v.x;
      double y = v.y;
      double z = v.z;

      if (is3DView) {
        double x1 = x * cos(rotationY) + z * sin(rotationY);
        double z1 = -x * sin(rotationY) + z * cos(rotationY);
        double y1 = y;

        double y2 = y1 * cos(rotationX) - z1 * sin(rotationX);
        double z2 = y1 * sin(rotationX) + z1 * cos(rotationX);
        double x2 = x1;

        return Offset(center.dx + x2 * scale, center.dy - y2 * scale);
      } else {
        return Offset(center.dx + x * scale, center.dy - y * scale);
      }
    }

    final origin = toScreen(const Vector3D(0, 0, 0));

    if (is3DView) {
      final gridPaint = Paint()
        ..color = Colors.white.withOpacity(0.06)
        ..strokeWidth = 1.0;

      for (double i = -5; i <= 5; i += 1) {
        canvas.drawLine(
          toScreen(Vector3D(-5, i, 0)),
          toScreen(Vector3D(5, i, 0)),
          gridPaint,
        );
        canvas.drawLine(
          toScreen(Vector3D(i, -5, 0)),
          toScreen(Vector3D(i, 5, 0)),
          gridPaint,
        );
      }

      final xAxisPaint = Paint()
        ..color = Colors.redAccent
        ..strokeWidth = 2.0;
      final yAxisPaint = Paint()
        ..color = Colors.greenAccent
        ..strokeWidth = 2.0;
      final zAxisPaint = Paint()
        ..color = Colors.blueAccent
        ..strokeWidth = 2.0;

      canvas.drawLine(origin, toScreen(const Vector3D(6, 0, 0)), xAxisPaint);
      canvas.drawLine(origin, toScreen(const Vector3D(0, 6, 0)), yAxisPaint);
      canvas.drawLine(origin, toScreen(const Vector3D(0, 0, 6)), zAxisPaint);
    } else {
      final axisPaint = Paint()
        ..color = Colors.white38
        ..strokeWidth = 1.5;
      canvas.drawLine(
        Offset(0, center.dy),
        Offset(size.width, center.dy),
        axisPaint,
      );
      canvas.drawLine(
        Offset(center.dx, 0),
        Offset(center.dx, size.height),
        axisPaint,
      );
    }

    final targetA = toScreen(vectorA);
    _drawArrow(canvas, origin, targetA, Colors.blue, 'A');

    final targetSum = toScreen(vectorA + vectorB);
    _drawArrow(canvas, targetA, targetSum, Colors.orange, 'B');

    _drawArrow(canvas, origin, targetSum, Colors.green, 'A+B', isDashed: true);
  }

  void _drawArrow(
    Canvas canvas,
    Offset start,
    Offset end,
    Color color,
    String label, {
    bool isDashed = false,
  }) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    if (isDashed) {
      double dashWidth = 6, dashSpace = 4;
      double distance = (end - start).distance;
      if (distance == 0) return;
      Offset direction = (end - start) / distance;
      Offset current = start;
      double drawn = 0;
      while (drawn < distance) {
        Offset next = current + direction * dashWidth;
        canvas.drawLine(current, next, paint);
        current = next + direction * dashSpace;
        drawn += dashWidth + dashSpace;
      }
    } else {
      canvas.drawLine(start, end, paint);
    }

    // Arrowhead
    final angle = atan2(end.dy - start.dy, end.dx - start.dx);
    const arrowSize = 10.0;
    final path = Path()
      ..moveTo(end.dx, end.dy)
      ..lineTo(
        end.dx - arrowSize * cos(angle - pi / 6),
        end.dy - arrowSize * sin(angle - pi / 6),
      )
      ..lineTo(
        end.dx - arrowSize * cos(angle + pi / 6),
        end.dy - arrowSize * sin(angle + pi / 6),
      )
      ..close();

    final arrowPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, arrowPaint);

    // Text Label
    final textPainter = TextPainter(
      text: TextSpan(
        text: label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, end + const Offset(6, -6));
  }

  @override
  bool shouldRepaint(covariant VectorPainter oldDelegate) {
    return oldDelegate.vectorA != vectorA ||
        oldDelegate.vectorB != vectorB ||
        oldDelegate.sumVector != sumVector ||
        oldDelegate.is3DView != is3DView ||
        oldDelegate.scale != scale ||
        oldDelegate.rotationX != rotationX ||
        oldDelegate.rotationY != rotationY;
  }
}
