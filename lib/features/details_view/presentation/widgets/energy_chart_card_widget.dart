import 'package:flutter/material.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';
import 'package:scube_task_app/core/theme/app_colors.dart';

class EnergyChartCardWidget extends StatelessWidget {
  final String energyValue;

  const EnergyChartCardWidget({
    super.key,
    required this.energyValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.homeCardBorder, width: 2),
      ),
      child: Column(
        children: [
          // Header with title and energy value
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    AppTexts.energyChart,
                    style: const TextStyle(
                      color: Color(0xFF001F3F), // Dark Blue
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  energyValue,
                  style: const TextStyle(
                    color: Color(0xFF001F3F), // Dark Blue
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          
          // Data List Items
          _buildDataItem(
            AppTexts.dataA,
            const Color(0xFF0099FF), // Cyan/Blue
            '2798.50',
            '29.53%',
            '35689 ৳',
          ),
          const SizedBox(height: 10),
          _buildDataItem(
            AppTexts.dataB,
            const Color(0xFF6CF0FF), // Light Cyan
            '72598.50',
            '35.39%',
            '5259689 ৳',
          ),
          const SizedBox(height: 10),
          _buildDataItem(
            AppTexts.dataC,
            const Color(0xFF9D4EDD), // Purple
            '6598.36',
            '83.90%',
            '5698756 ৳',
          ),
          const SizedBox(height: 10),
          _buildDataItem(
            AppTexts.dataD,
            const Color(0xFFFF9E00), // Orange
            '6598.26',
            '36.59%',
            '356987 ৳',
          ),
        ],
      ),
    );
  }

  Widget _buildDataItem(String label, Color dotColor, String dataVal, String percent, String costVal) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF9CA3AF), width: 1), // Grey border
      ),
      child: Row(
        children: [
          // Left Section: Icon + Label
          SizedBox(
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF001F3F),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Divider
          Container(
            height: 30,
            width: 1,
            color: Colors.grey[300],
            margin: const EdgeInsets.symmetric(horizontal: 12),
          ),

          // Right Section: Data Rows
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: Text(
                        'Data',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ),
                    Text(
                      ' : ',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    Text(
                      '$dataVal ($percent)',
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
                    SizedBox(
                      width: 40,
                      child: Text(
                        'Cost',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ),
                    Text(
                      ' : ',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    Text(
                      costVal,
                      style: const TextStyle(
                        color: Color(0xFF001F3F),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
