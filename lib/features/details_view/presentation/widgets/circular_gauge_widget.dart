import 'package:flutter/material.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';
import 'package:scube_task_app/core/theme/app_colors.dart';

class CircularGaugeWidget extends StatelessWidget {
  final double value;

  const CircularGaugeWidget({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: CustomPaint(
        painter: _GaugePainter(value: value),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value.toStringAsFixed(2),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                AppTexts.kwhSqft,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  final double value;

  _GaugePainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 15;

    // Background arc (light blue)
    final backgroundPaint = Paint()
      ..color = AppColors.homeTabInactive
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -2.4, // Start angle (top left)
      3.6, // Sweep angle (about 200 degrees)
      false,
      backgroundPaint,
    );

    // Foreground arc (blue)
    final foregroundPaint = Paint()
      ..color = AppColors.homeTabActive
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25
      ..strokeCap = StrokeCap.round;

    // Calculate progress (assuming value is between 0-100)
    final progress = (value / 100) * 3.6;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -2.4, // Start angle
      progress, // Sweep angle based on value
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
