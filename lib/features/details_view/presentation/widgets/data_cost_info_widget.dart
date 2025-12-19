import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/core/theme/app_colors.dart';
import 'package:scube_task_app/features/details_view/presentation/controller/details_view_controller.dart';

class DataCostInfoWidget extends StatelessWidget {
  final DetailsViewController controller;

  const DataCostInfoWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.homeCardBorder, width: 2),
      ),
      child: Obx(() => Column(
        children: [
          // Header
          GestureDetector(
            onTap: controller.toggleRevenueCard,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.transparent,
              child: Row(
                children: [
                  const Icon(Icons.bar_chart, color: Colors.grey, size: 24),
                  const SizedBox(width: 12),
                  const Text(
                    'Data & Cost Info',
                    style: TextStyle(
                      color: Color(0xFF001F3F), // Dark Blue
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: AppColors.homeIconBlue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      controller.isRevenueCardExpanded.value
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Divider (only show when expanded)
          if (controller.isRevenueCardExpanded.value)
            Divider(height: 1, thickness: 1, color: AppColors.homeCardBorder),
          
          // Content
          if (controller.isRevenueCardExpanded.value)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildDataRow('Data 1', '2798.50 (29.53%)', 'Cost 1', '35689 ৳'),
                  const SizedBox(height: 12),
                  _buildDataRow('Data 2', '2798.50 (29.53%)', 'Cost 2', '35689 ৳'),
                  const SizedBox(height: 12),
                  _buildDataRow('Data 3', '2798.50 (29.53%)', 'Cost 3', '35689 ৳'),
                  const SizedBox(height: 12),
                  _buildDataRow('Data 4', '2798.50 (29.53%)', 'Cost 4', '35689 ৳'),
                ],
              ),
            ),
        ],
      )),
    );
  }

  Widget _buildDataRow(String dataLabel, String dataValue, String costLabel, String costValue) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '$dataLabel : ',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            Text(
              dataValue,
              style: const TextStyle(
                color: Color(0xFF001F3F),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              '$costLabel : ',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            Text(
              costValue,
              style: const TextStyle(
                color: Color(0xFF001F3F),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
