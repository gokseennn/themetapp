import 'package:get/get.dart';
import 'package:neon_app_case/screens/info_screen/controller/info_screen_controller.dart';
import 'package:neon_app_case/screens/info_screen/controller/info_screen_repository.dart';

class InfoScreenBinding extends Binding {
  @override
  List<Bind> dependencies() => [
        Bind.lazyPut(
          () => InfoScreenController(),
        ),
        Bind.lazyPut(
          () => InfoScreenRepository(),
        ),
      ];
}
