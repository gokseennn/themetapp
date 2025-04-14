import 'package:get/get.dart';
import 'package:neon_app_case/base/base_controller.dart';
import 'package:neon_app_case/common/artifact_list.dart';
import 'package:neon_app_case/screens/home_screen/controller/home_screen_repository.dart';
import 'package:neon_app_case/screens/home_screen/model/artifact.dart';
import 'package:neon_app_case/screens/home_screen/model/category.dart';

class HomeScreenController extends BaseController {
  final HomeScreenRepository homeScreenRepository =
      Get.find<HomeScreenRepository>();
  final Rx<List<HomeScreenArtifact>> artifactsList =
      Rx<List<HomeScreenArtifact>>([]);
  final List<Category> categoriesList =
      categories; //burada aslında bir api çağrısı olmalı ve ana sayfada gösterilen başlıklar ve içerikleri dönmeliydi ama öyle bir api yok o yüzden varmış gibi davranıldı
  @override
  Future<bool> initController() async {
    await getArtifacts();
    return super.initController();
  }

  Future<void> getArtifacts() async {
    artifactsList.value = await homeScreenRepository.getArtifacts();
  }
}
