import 'package:neon_app_case/base/base_repository.dart';
import 'package:neon_app_case/common/artifact_list.dart';
import 'package:neon_app_case/screens/home_screen/model/artifact.dart';

class HomeScreenRepository extends BaseRepository {
  Future<List<HomeScreenArtifact>> getArtifacts() async {
    return artifacts; //apisi yok o yüzden statik yapıldı
  }
}
