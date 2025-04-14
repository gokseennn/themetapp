import 'package:get/get.dart';
import 'package:neon_app_case/base/base_controller.dart';
import 'package:neon_app_case/main.dart';
import 'package:neon_app_case/screens/artifact_info_screen/model/artifact.dart';
import 'package:neon_app_case/screens/search_screen/controller/search_screen_repository.dart';

class SearchScreenController extends BaseController {
  final SearchScreenRepository repository = Get.find<SearchScreenRepository>();
  late final String query;
  final Rx<List<Artifact>> artifactList = Rx<List<Artifact>>([]);
  @override
  Future<bool> initController() async {
    query = appRouter.current.params.getString('query');
    await initObject();
    return super.initController();
  }

  Future<void> initObject() async {
    var searchResponse = await repository.getSearchIds(query);
    if (searchResponse != null) {
      for (var artifactId in searchResponse.artifactIds.take(10)) {
        //burda ilk 10 tanesini alıp onlar için object apisine istek atıyorum ama aslında bana searchde ui tasarımında istenilen bilgileri dönmeliydi
        var res = await repository.getArtifactInfo(artifactId);
        if (res != null) {
          artifactList.value.add(res);
        }
      }
    }
  }
}
