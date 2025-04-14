import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:neon_app_case/screens/artifact_info_screen/controller/artifact_info_screen_controller.dart';
import 'package:neon_app_case/screens/artifact_info_screen/controller/artifact_info_screen_repository.dart';

class ArtifactInfoScreenBinding extends Binding {
  @override
  List<Bind> dependencies() => [
        Bind.lazyPut(
          () => ArtifactInfoScreenController(),
        ),
        Bind.lazyPut(
          () => ArtifactInfoScreenRepository(),
        ),
      ];
}
