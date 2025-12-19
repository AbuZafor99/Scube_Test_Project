import 'package:flutter/material.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';
import 'package:scube_task_app/core/theme/app_colors.dart';
import 'package:scube_task_app/features/details_view/presentation/widgets/data_row_widget.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppTexts.energyChart,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                energyValue,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Data rows
          const DataRowWidget(
            label: AppTexts.dataA,
            indicatorColor: AppColors.dataIndicatorA,
            dataValue: '2798.50',
            dataPercentage: '29.53%',
            costValue: '35689 ৳',
          ),
          const DataRowWidget(
            label: AppTexts.dataB,
            indicatorColor: AppColors.dataIndicatorB,
            dataValue: '72598.50',
            dataPercentage: '35.39%',
            costValue: '5259689 ৳',
          ),
          const DataRowWidget(
            label: AppTexts.dataC,
            indicatorColor: AppColors.dataIndicatorC,
            dataValue: '6598.36',
            dataPercentage: '83.90%',
            costValue: '5698756 ৳',
          ),
          const DataRowWidget(
            label: AppTexts.dataD,
            indicatorColor: AppColors.dataIndicatorD,
            dataValue: '6598.26',
            dataPercentage: '36.59%',
            costValue: '356987 ৳',
          ),
        ],
      ),
    );
  }
}
