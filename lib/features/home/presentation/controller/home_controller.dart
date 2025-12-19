import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt selectedTabIndex = 0.obs;
  final RxBool isSourceSelected = true.obs;

  void selectTab(int index) {
    selectedTabIndex.value = index;
  }

  void toggleSourceLoad() {
    isSourceSelected.value = !isSourceSelected.value;
  }

  void onDataViewCardTap(String cardTitle) {
    Get.toNamed('/details-view');
  }

  void onActionButtonTap(String buttonName) {
    Get.snackbar(
      'Info',
      '$buttonName tapped',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
