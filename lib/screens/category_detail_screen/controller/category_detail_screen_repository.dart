import 'package:neon_app_case/base/base_repository.dart';
import 'package:neon_app_case/common/artifact_list.dart';
import 'package:neon_app_case/screens/home_screen/model/artifact.dart';

class CategoryDetailScreenRepository extends BaseRepository {
  Future<List<HomeScreenArtifact>> getArtifacts(int id) async {
    //normalde apiService ile istek olması lazım ancak endpointte yok o yüzden statik veriden çekildi
    return artifacts.where((element) => element.categoryId == id).toList();
    //burada aslında dönüş şu şekilde olmalıydı id ile api isteği
    /**
     * {
     * "categoryName": "Current Exhibitions",
     * "objects": [
     * {
     * "id": 1,
     * "title": "The Adoration of the Magi",
     * "artist": "Vincent van Gogh",
     * "image": "https://images.metmuseum.org/CRDImages/ep/original/DP875548.jpg"
     * }
     * ]
     * }
     */
  }
}
