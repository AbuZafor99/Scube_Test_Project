import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsViewController extends GetxController {
  // View type: Data View or Revenue View
  final RxBool isDataView = true.obs;

  // Date mode: Today or Custom
  final RxBool isTodayData = true.obs;

  // Date values
  final Rx<DateTime?> fromDate = Rx<DateTime?>(null);
  final Rx<DateTime?> toDate = Rx<DateTime?>(null);

  // Gauge value (now string to support formatted numbers/placeholders)
  final RxString gaugeValueStr = '55.00'.obs;
  final RxString gaugeUnit = 'kWh/Sqft'.obs;

  // Revenue card expanded state
  final RxBool isRevenueCardExpanded = true.obs;

  // Energy chart value
  final RxString energyChartValue = '5.53 kw'.obs;

  void toggleView(bool isData) {
    isDataView.value = isData;
    // Update gauge value based on view type
    if (isData) {
      gaugeValueStr.value = '55.00';
      gaugeUnit.value = 'kWh/Sqft';
    } else {
      gaugeValueStr.value = '8897455';
      gaugeUnit.value = 'tk';
    }
  }

  void toggleRevenueCard() {
    isRevenueCardExpanded.value = !isRevenueCardExpanded.value;
  }

  void toggleDateMode(bool isToday) {
    isTodayData.value = isToday;
    if (isToday) {
      fromDate.value = null;
      toDate.value = null;
    }
  }

  Future<void> selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fromDate.value ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      fromDate.value = picked;
    }
  }

  Future<void> selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: toDate.value ?? DateTime.now(),
      firstDate: fromDate.value ?? DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      toDate.value = picked;
    }
  }

  void onSearch() {
    if (fromDate.value != null && toDate.value != null) {
      // Update energy chart value for custom date
      energyChartValue.value = '20.05 kw';
      
      Get.snackbar(
        'Search',
        'Searching data from ${_formatDate(fromDate.value!)} to ${_formatDate(toDate.value!)}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Error',
        'Please select both From Date and To Date',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String getFormattedFromDate() {
    return fromDate.value != null ? _formatDate(fromDate.value!) : '';
  }

  String getFormattedToDate() {
    return toDate.value != null ? _formatDate(toDate.value!) : '';
  }
}
