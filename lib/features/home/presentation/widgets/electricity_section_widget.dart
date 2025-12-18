import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';
import 'package:scube_task_app/core/theme/app_colors.dart';
import 'package:scube_task_app/features/home/presentation/controller/home_controller.dart';
import 'package:scube_task_app/features/home/presentation/widgets/circular_power_display_widget.dart';

class ElectricitySectionWidget extends StatelessWidget {
  final HomeController controller;

  const ElectricitySectionWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.homeCardBorder, width: 2),
      ),
      child: Column(
        children: [
          // Electricity title
          Text(
            AppTexts.electricity,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          
          // Circular power display
          const CircularPowerDisplayWidget(),
          
          const SizedBox(height: 24),
          
          // Source/Load toggle buttons
          Obx(() => Row(
            children: [
              Expanded(
                child: _buildToggleButton(
                  AppTexts.source,
                  controller.isSourceSelected.value,
                  () => controller.toggleSourceLoad(),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildToggleButton(
                  AppTexts.load,
                  !controller.isSourceSelected.value,
                  () => controller.toggleSourceLoad(),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.homeTabActive : AppColors.homeTabInactive,
          borderRadius: BorderRadius.circular(8),
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
    );
  }
}
