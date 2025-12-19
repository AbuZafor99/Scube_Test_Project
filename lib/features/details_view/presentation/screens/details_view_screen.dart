import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';
import 'package:scube_task_app/core/theme/app_colors.dart';
import 'package:scube_task_app/features/details_view/presentation/controller/details_view_controller.dart';
import 'package:scube_task_app/features/details_view/presentation/widgets/circular_gauge_widget.dart';
import 'package:scube_task_app/features/details_view/presentation/widgets/date_selection_widget.dart';
import 'package:scube_task_app/features/details_view/presentation/widgets/energy_chart_card_widget.dart';
import 'package:scube_task_app/features/details_view/presentation/widgets/view_toggle_widget.dart';

import '../widgets/data_cost_info_widget.dart';

class DetailsViewScreen extends StatelessWidget {
  const DetailsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailsViewController());

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          AppTexts.scm,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined, color: Colors.black),
                onPressed: () {
                  Get.snackbar(
                    'Notifications',
                    'No new notifications',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // View toggle (Data View / Revenue View)
            ViewToggleWidget(controller: controller),
            
            // Circular gauge
            Obx(() => CircularGaugeWidget(
              value: controller.gaugeValueStr.value,
              unit: controller.gaugeUnit.value,
            )),
            
            const SizedBox(height: 20),
            
            // Conditional Rendering based on View Type
            Obx(() {
              if (controller.isDataView.value) {
                return Column(
                  children: [
                     // Date selection (Today Data / Custom Date Data)
                    DateSelectionWidget(controller: controller),
                    
                    const SizedBox(height: 16),
                    
                    // Energy chart(s)
                    Obx(() {
                      if (controller.isTodayData.value) {
                        // Today Data mode: Show single energy chart
                        return EnergyChartCardWidget(
                          energyValue: controller.energyChartValue.value,
                        );
                      } else {
                        // Custom Date Data mode: Show two energy charts
                        return Column(
                          children: [
                            EnergyChartCardWidget(
                              energyValue: controller.energyChartValue.value,
                            ),
                            const EnergyChartCardWidget(
                              energyValue: '5.53 kw',
                            ),
                          ],
                        );
                      }
                    }),
                  ],
                );
              } else {
                // Revenue View: Show Collapsible Data & Cost Info
                return DataCostInfoWidget(controller: controller);
              }
            }),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
