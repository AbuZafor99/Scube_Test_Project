import 'package:flutter/material.dart';
import 'package:scube_task_app/core/common/constants/app_images.dart';
import 'package:scube_task_app/core/common/widgets/app_logo.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';

import '../../../../core/theme/app_colors.dart';

class LoginHeaderWidget extends StatelessWidget {
  final double screenHeight;

  const LoginHeaderWidget({
    super.key,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.40,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.loginScreenBG,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppLogo(
            images: AppImages.appLogo,
            height: 120,
            width: 120,
          ),
          const SizedBox(height: 24),
          
          Text(
            AppTexts.appName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          
          // Subtitle
          Text(
            AppTexts.appTagline,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
