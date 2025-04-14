import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:neon_app_case/screens/search_screen/controller/search_screen_controller.dart';
import 'package:neon_app_case/screens/search_screen/controller/search_screen_repository.dart';

class SearchScreenBinding extends Binding {
  @override
  List<Bind> dependencies() => [
        Bind.lazyPut(() => SearchScreenController()),
        Bind.lazyPut(() => SearchScreenRepository()),
      ];
}
