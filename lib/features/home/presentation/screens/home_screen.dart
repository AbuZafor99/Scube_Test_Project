import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';
import 'package:scube_task_app/core/theme/app_colors.dart';
import 'package:scube_task_app/features/home/presentation/controller/home_controller.dart';
import 'package:scube_task_app/features/home/presentation/widgets/action_buttons_grid_widget.dart';
import 'package:scube_task_app/features/home/presentation/widgets/data_view_card_widget.dart';
import 'package:scube_task_app/features/home/presentation/widgets/home_tab_bar_widget.dart';

import '../widgets/circular_power_display_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

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
            const SizedBox(height: 16),
            
            // Main white card containing tabs, electricity, and data cards
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.homeCardBorder, width: 2),
              ),
              child: Column(
                children: [
                  // Tab bar
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: HomeTabBarWidget(controller: controller),
                  ),
                  
                  // Divider
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: AppColors.homeCardBorder,
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Electricity title
                  Text(
                    AppTexts.electricity,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Circular power display
                  const CircularPowerDisplayWidget(),
                  
                  const SizedBox(height: 16),
                  
                  // Source/Load toggle buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Obx(() => Row(
                      children: [
                        Expanded(
                          child: _buildToggleButton(
                            controller,
                            AppTexts.source,
                            controller.isSourceSelected.value,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildToggleButton(
                            controller,
                            AppTexts.load,
                            !controller.isSourceSelected.value,
                          ),
                        ),
                      ],
                    )),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Divider
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: AppColors.homeCardBorder,
                  ),
                  
                  // Scrollable data view cards section with fixed height
                  SizedBox(
                    height: 280,
                    child: Scrollbar(
                      thickness: 6,
                      radius: const Radius.circular(3),
                      child: ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          DataViewCardWidget(
                            iconPath: 'assets/icons/icon1.png',
                            iconBackground: Colors.transparent, // Icons have their own colors
                            title: AppTexts.dataView,
                            status: AppTexts.active,
                            isActive: true, // Active status
                            data1Value: '55505.63',
                            data2Value: '58805.63',
                            backgroundColor: const Color(0xFFE1F0FF), // Light Blue
                            statusColor: const Color(0xFF0099FF), // Blue
                            onTap: () => controller.onDataViewCardTap(AppTexts.dataView),
                          ),
                          DataViewCardWidget(
                            iconPath: 'assets/icons/icon2.png',
                            iconBackground: Colors.transparent,
                            title: AppTexts.dataType2,
                            status: AppTexts.active,
                            isActive: true, 
                            data1Value: '55505.63',
                            data2Value: '58805.63',
                            backgroundColor: const Color(0xFFFFF4DE), // Light Orange/Yellow
                            statusColor: const Color(0xFFFF9E00), // Orange
                            onTap: () => controller.onDataViewCardTap(AppTexts.dataType2),
                          ),
                          DataViewCardWidget(
                            iconPath: 'assets/icons/icon3.png',
                            iconBackground: Colors.transparent,
                            title: AppTexts.dataType3,
                            status: AppTexts.inactive,
                            isActive: false,
                            data1Value: '55505.63',
                            data2Value: '58805.63',
                            backgroundColor: const Color(0xFFE1F0FF), // Light Blue
                            statusColor: Colors.red, // Inactive Red
                            onTap: () => controller.onDataViewCardTap(AppTexts.dataType3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Action buttons grid (outside the card)
            ActionButtonsGridWidget(
              onButtonTap: controller.onActionButtonTap,
            ),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(HomeController controller, String title, bool isSelected) {
    return GestureDetector(
      onTap: () => controller.toggleSourceLoad(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.homeTabActive : AppColors.homeTabInactive,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.homeInactiveStatus,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}