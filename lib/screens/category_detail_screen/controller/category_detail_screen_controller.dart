import 'package:get/get.dart';
import 'package:neon_app_case/base/base_controller.dart';
import 'package:neon_app_case/main.dart';
import 'package:neon_app_case/screens/category_detail_screen/controller/category_detail_screen_repository.dart';
import 'package:neon_app_case/screens/home_screen/model/artifact.dart';

class CategoryDetailScreenController extends BaseController {
  final CategoryDetailScreenRepository repository =
      Get.find<CategoryDetailScreenRepository>();
  late final int categoryId;
  final Rx<List<HomeScreenArtifact>> artifactsList =
      Rx<List<HomeScreenArtifact>>([]);
  @override
  Future<bool> initController() async {
    categoryId = appRouter.current.params.getInt('categoryId');
    await getArtifacts();
    return super.initController();
  }

  Future<void> getArtifacts() async {
    var res = await repository.getArtifacts(categoryId);
    if (res.isNotEmpty) {
      artifactsList.value = res;
    }
  }
}
