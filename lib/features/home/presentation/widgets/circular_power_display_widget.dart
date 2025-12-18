import 'package:flutter/material.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';
import 'package:scube_task_app/core/theme/app_colors.dart';

class CircularPowerDisplayWidget extends StatelessWidget {
  final String powerValue;

  const CircularPowerDisplayWidget({
    super.key,
    this.powerValue = '5.53 kw',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Circular progress indicator
          SizedBox(
            width: 150,
            height: 150,
            child: CircularProgressIndicator(
              value: 0.65,
              strokeWidth: 20,
              backgroundColor: AppColors.homeTabInactive,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.homeTabActive,
              ),
            ),
          ),
          // Center text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppTexts.totalPower,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                powerValue,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
