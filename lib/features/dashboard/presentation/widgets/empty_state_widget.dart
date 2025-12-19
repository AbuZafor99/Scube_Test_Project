import 'package:flutter/material.dart';
import 'package:scube_task_app/core/common/constants/app_images.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Dashboard image
          Image.asset(
            AppImages.dashboadrdImage,
            width: 250,
            height: 250,
            fit: BoxFit.contain,
          ),
          
          const SizedBox(height: 16),
          
          // Text message
          Text(
            AppTexts.dashboardText,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
