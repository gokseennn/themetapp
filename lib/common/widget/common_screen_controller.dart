import 'package:get/get.dart';
import 'package:neon_app_case/base/base_controller.dart';
import 'package:neon_app_case/common/model/nav_bar_enum.dart';

class CommonScreenController extends BaseController {
  final Rx<NavBarEnum> selectedIndex = NavBarEnum.home.obs;

  void changeIndex(NavBarEnum index) {
    selectedIndex.value = index;
  }
}
