import 'package:get/get.dart';
import 'package:neon_app_case/common/model/nav_bar_enum.dart';
import 'package:neon_app_case/common/theme/app_theme.dart';

class AppService extends GetxService {
  final lightTheme = AppTheme().lightTheme;
  final darkTheme = AppTheme().darkTheme; //TODO
  final Rx<NavBarEnum> selectedIndex = NavBarEnum.home.obs;
  static AppService get to => Get.find();
}
