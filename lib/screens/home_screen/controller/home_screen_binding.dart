import 'package:get/get.dart';
import 'package:neon_app_case/screens/home_screen/controller/home_screen_controller.dart';
import 'package:neon_app_case/screens/home_screen/controller/home_screen_repository.dart';

class HomeScreenBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<HomeScreenController>(
        () => HomeScreenController(),
      ),
      Bind.lazyPut<HomeScreenRepository>(
        () => HomeScreenRepository(),
      ),
    ];
  }
}
