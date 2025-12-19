import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';
import 'package:scube_task_app/core/theme/app_colors.dart';
import 'package:scube_task_app/features/details_view/presentation/controller/details_view_controller.dart';

class ViewToggleWidget extends StatelessWidget {
  final DetailsViewController controller;

  const ViewToggleWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppColors.homeCardBorder, width: 2),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildToggleOption(
              AppTexts.dataView,
              controller.isDataView.value,
              () => controller.toggleView(true),
            ),
          ),
          Expanded(
            child: _buildToggleOption(
              AppTexts.revenueView,
              !controller.isDataView.value,
              () => controller.toggleView(false),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _buildToggleOption(String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.transparent : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.homeTabActive : Colors.grey[400]!,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.homeTabActive,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? AppColors.homeTabActive : Colors.grey[600],
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
