
import 'package:flutter/material.dart';
import 'package:osta/core/constants/app_colors.dart';

class NavCustomPainter extends CustomPainter {

  late double loc;
  late double s;
  Color color;
  TextDirection textDirection;

  NavCustomPainter(
      double startingLoc, int itemsLength, this.color, this.textDirection) {
    final span = 1.0 / itemsLength;
    s = 0.2;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
  }

  @override
  void paint(Canvas canvas, Size size) {

    var dotPoint = Offset(size.width / 2, 2);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var paint_2 = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((loc - 0.1) * size.width, 0)
      ..cubicTo(
        (loc + s * 0.20) * size.width,
        size.height * 0.05,
        loc * size.width,
        size.height * 0.60,
        (loc + s * 0.50) * size.width,
        size.height * 0.60,
      )
      ..cubicTo(
        (loc + s) * size.width,
        size.height * 0.60,
        (loc + s - s * 0.20) * size.width,
        size.height * 0.05,
        (loc + s + 0.1) * size.width,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
    // canvas.drawCircle(dotPoint, 6, paint_2);

  }
  //
  // @override
  // void paint(Canvas canvas, Size size) {
  //   var dotPoint = Offset(size.width / 2, 2);
  //
  //   var paint_1 = Paint()
  //     ..color = AppColors.borderColor
  //     ..style = PaintingStyle.fill;
  //   var paint_2 = Paint()
  //     ..color = AppColors.primaryColor
  //     ..style = PaintingStyle.fill;
  //
  //   var path = Path();
  //
  //   path.moveTo(0, 0);
  //   path.quadraticBezierTo(7.5, 0, 12, 5);
  //   path.quadraticBezierTo(size.width / 2, size.height / 2, size.width - 12, 5);
  //   path.quadraticBezierTo(size.width - 7.5, 0, size.width, 0);
  //   path.close();
  //   canvas.drawPath(path, paint_1);
  //   canvas.drawCircle(dotPoint, 6, paint_2);
  // }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}