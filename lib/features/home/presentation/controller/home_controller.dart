import 'package:get/get.dart';
import 'package:scube_task_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:scube_task_app/features/details_view/presentation/screens/details_view_screen.dart';

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
    Get.to(() => const DetailsViewScreen());
  }

  void onActionButtonTap(String buttonName) {
    Get.to(() => const DashboardScreen());
  }
}
