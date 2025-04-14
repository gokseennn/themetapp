import 'package:get/get.dart';

class BaseController extends GetxController with StateMixin {
  @override
  void onInit() {
    futurize(() => initController());
    super.onInit();
  }

  Future<bool> initController() async {
    return true;
  }
}
