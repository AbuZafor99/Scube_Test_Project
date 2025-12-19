import 'package:flutter/material.dart';
import 'package:scube_task_app/core/theme/app_colors.dart';

class CircularGaugeWidget extends StatelessWidget {
  final String value;
  final String unit;

  const CircularGaugeWidget({
    super.key,
    required this.value,
    required this.unit,
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
                value,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 28, // Reduced slightly to fit larger numbers
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                unit,
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
  final String value;

  _GaugePainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 15;

    // Background arc (light blue)
    final backgroundPaint = Paint()
      ..color = const Color(0xFFE1F0FF) // Light blue background track
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

    // Calculate progress (try to parse double, otherwise default to full or 0)
    double progressValue = 0.0;
    try {
      // Remove any non-numeric characters except dot (simple parsing)
      String numericString = value.replaceAll(RegExp(r'[^0-9.]'), '');
      if (numericString.isNotEmpty) {
        double parsed = double.parse(numericString);
        // Normalize: if > 100, assume it's a large number and show mostly full/dynamic
        // For this demo, let's map 0-100 normally, and large numbers to ~75%
        if (parsed > 100) {
           progressValue = 75.0; 
        } else {
           progressValue = parsed;
        }
      }
    } catch (e) {
      progressValue = 0.0;
    }

    final progress = (progressValue / 100) * 3.6;

    if (progress > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -2.4, // Start angle
        progress, // Sweep angle based on value
        false,
        foregroundPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
