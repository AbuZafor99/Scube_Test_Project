import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';
import 'package:scube_task_app/core/theme/app_colors.dart';
import 'package:scube_task_app/features/home/presentation/controller/home_controller.dart';

class HomeTabBarWidget extends StatelessWidget {
  final HomeController controller;

  const HomeTabBarWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.homeCardBorder, width: 2),
      ),
      child: Row(
        children: [
          _buildTab(AppTexts.summery, 0),
          _buildTab(AppTexts.sld, 1),
          _buildTab(AppTexts.data, 2),
        ],
      ),
    ));
  }

  Widget _buildTab(String title, int index) {
    final isSelected = controller.selectedTabIndex.value == index;
    
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.selectTab(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.homeTabActive : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.homeInactiveStatus,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
