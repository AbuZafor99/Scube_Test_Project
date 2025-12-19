import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';
import 'package:scube_task_app/core/theme/app_colors.dart';
import 'package:scube_task_app/features/details_view/presentation/controller/details_view_controller.dart';

class DateSelectionWidget extends StatelessWidget {
  final DetailsViewController controller;

  const DateSelectionWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        // Radio buttons for Today Data / Custom Date Data
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRadioOption(
                AppTexts.todayData,
                controller.isTodayData.value,
                () => controller.toggleDateMode(true),
              ),
              const SizedBox(width: 24),
              _buildRadioOption(
                AppTexts.customDateData,
                !controller.isTodayData.value,
                () => controller.toggleDateMode(false),
              ),
            ],
          ),
        ),
        
        // Date picker fields (only show when Custom Date Data is selected)
        if (!controller.isTodayData.value) ...[
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // From Date field
                Expanded(
                  child: _buildDateField(
                    context,
                    AppTexts.fromDate,
                    controller.getFormattedFromDate(),
                    () => controller.selectFromDate(context),
                  ),
                ),
                const SizedBox(width: 12),
                
                // To Date field
                Expanded(
                  child: _buildDateField(
                    context,
                    AppTexts.toDate,
                    controller.getFormattedToDate(),
                    () => controller.selectToDate(context),
                  ),
                ),
                const SizedBox(width: 12),
                
                // Search button
                GestureDetector(
                  onTap: controller.onSearch,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.homeTabActive,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.homeCardBorder, width: 2),
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    ));
  }

  Widget _buildRadioOption(String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
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
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(
    BuildContext context,
    String hint,
    String value,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.homeCardBorder, width: 2),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                value.isEmpty ? hint : value,
                style: TextStyle(
                  color: value.isEmpty ? Colors.grey[500] : Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.calendar_today,
              size: 18,
              color: Colors.grey[600],
            ),
          ],
        ),
      ),
    );
  }
}
