import 'package:get/get.dart';
import 'package:neon_app_case/base/base_controller.dart';
import 'package:neon_app_case/main.dart';
import 'package:neon_app_case/screens/artifact_info_screen/controller/artifact_info_screen_repository.dart';
import 'package:neon_app_case/screens/artifact_info_screen/model/artifact.dart';

class ArtifactInfoScreenController extends BaseController {
  final ArtifactInfoScreenRepository _repository =
      Get.find<ArtifactInfoScreenRepository>();
  late final int artifactId;
  late final Rx<Artifact> artifact;

  @override
  Future<bool> initController() async {
    artifactId = appRouter.current.params.getInt('artifactId');
    await getArtifactInfo();
    return super.initController();
  }

  Future<void> getArtifactInfo() async {
    var res = await _repository.getArtifactInfo(artifactId);
    if (res != null) {
      artifact = Rx(res);
    }
  }
}
