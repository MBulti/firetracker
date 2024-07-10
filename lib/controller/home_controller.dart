import 'package:firetracker/utils/structures.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var obsSelectedIndex = TabItem.vehicles.obs;

  @override
  void onInit() {
    print("OnInit HomeController");
    super.onInit();
  }

  void setSelectedIndex(int index) {
    obsSelectedIndex.value = TabItem.values[index];
  }
}