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
            '📊',
            AppTexts.analysisPro,
            () => onButtonTap(AppTexts.analysisPro),
          ),
          _buildActionButton(
            '⚡',
            AppTexts.gGenerator,
            () => onButtonTap(AppTexts.gGenerator),
          ),
          _buildActionButton(
            '🔌',
            AppTexts.plantSummery,
            () => onButtonTap(AppTexts.plantSummery),
          ),
          _buildActionButton(
            '🔥',
            AppTexts.naturalGas,
            () => onButtonTap(AppTexts.naturalGas),
          ),
          _buildActionButton(
            '🔋',
            AppTexts.dGenerator,
            () => onButtonTap(AppTexts.dGenerator),
          ),
          _buildActionButton(
            '💧',
            AppTexts.waterProcess,
            () => onButtonTap(AppTexts.waterProcess),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String emoji, String title, VoidCallback onTap) {
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
            Text(
              emoji,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 6),
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
