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

    // Start from 135 degrees (2.356 radians)
    // Sweep 270 degrees (4.712 radians)
    const double startAngle = 135 * 3.14159 / 180;
    const double sweepAngle = 270 * 3.14159 / 180;

    // Background arc (light blue)
    final backgroundPaint = Paint()
      ..color = const Color(0xFFE1F0FF) // Light blue background track
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      backgroundPaint,
    );

    // Foreground arc (blue)
    // Using a slightly more vibrant blue to match image 1 if needed, 
    // or sticking to the active tab color. 
    // Image 1 looks like a solid standard blue (e.g. 0xFF4285F4). 
    // Let's use Color(0xFF3B82F6) which is a nice vibrant blue, or stick to theme.
    final foregroundPaint = Paint()
      ..color = const Color(0xFF3B82F6) // Vibrant Blue matching Image 1
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
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

    final progressSweep = (progressValue / 100) * sweepAngle;

    if (progressSweep > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        progressSweep, // Sweep based on value
        false,
        foregroundPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
