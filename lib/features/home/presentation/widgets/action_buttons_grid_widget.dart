import 'package:flutter/material.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';
import 'package:scube_task_app/core/theme/app_colors.dart';

class ActionButtonsGridWidget extends StatelessWidget {
  final Function(String) onButtonTap;

  const ActionButtonsGridWidget({
    super.key,
    required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.5,
        children: [
          _buildActionButton(
            'assets/icons/chart_490605.png',
            AppTexts.analysisPro,
            () => onButtonTap(AppTexts.analysisPro),
          ),
          _buildActionButton(
            'assets/icons/generator_8789846.png',
            AppTexts.gGenerator,
            () => onButtonTap(AppTexts.gGenerator),
          ),
          _buildActionButton(
            'assets/icons/power_15679163 1.png',
            AppTexts.plantSummery,
            () => onButtonTap(AppTexts.plantSummery),
          ),
          _buildActionButton(
            'assets/icons/fire_3900509 1.png',
            AppTexts.naturalGas,
            () => onButtonTap(AppTexts.naturalGas),
          ),
          _buildActionButton(
            'assets/icons/generator_8789846 (1).png',
            AppTexts.dGenerator,
            () => onButtonTap(AppTexts.dGenerator),
          ),
          _buildActionButton(
            'assets/icons/faucet_1078798.png',
            AppTexts.waterProcess,
            () => onButtonTap(AppTexts.waterProcess),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String imagePath, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.homeCardBorder, width: 2),
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 24,
              height: 24,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 24),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
