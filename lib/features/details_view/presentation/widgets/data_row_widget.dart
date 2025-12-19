import 'package:flutter/material.dart';
import 'package:scube_task_app/core/theme/app_colors.dart';

class DataRowWidget extends StatelessWidget {
  final String label;
  final Color indicatorColor;
  final String dataValue;
  final String dataPercentage;
  final String costValue;

  const DataRowWidget({
    super.key,
    required this.label,
    required this.indicatorColor,
    required this.dataValue,
    required this.dataPercentage,
    required this.costValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.homeCardBorder, width: 1),
      ),
      child: Row(
        children: [
          // Colored indicator circle
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: indicatorColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          
          // Label
          SizedBox(
            width: 50,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          
          const SizedBox(width: 8),
          
          // Data section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Data',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      ': $dataValue ($dataPercentage)',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Cost',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      ': $costValue',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
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
