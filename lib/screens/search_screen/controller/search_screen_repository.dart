import 'package:neon_app_case/base/base_repository.dart';
import 'package:neon_app_case/screens/artifact_info_screen/model/artifact.dart';
import 'package:neon_app_case/screens/search_screen/model/search_response.dart';
import 'package:neon_app_case/services/api_service/api_service.dart';

class SearchScreenRepository extends BaseRepository {
  Future<SearchResponse?> getSearchIds(String query) => apiService
          .request(
        method: HttpMethod.get,
        path:
            "https://collectionapi.metmuseum.org/public/collection/v1/search?hasImages=true&q=$query", //farklı şekilde arama filtreleri eklenebilir aslında
        showError: true,
      )
          .then(
        (res) {
          if (res.isOk) {
            return SearchResponse.fromJson(res.data);
          }
          return null;
        },
      );
  Future<Artifact?> getArtifactInfo(int artifactId) => apiService
          .request(
        method: HttpMethod.get,
        path:
            "https://collectionapi.metmuseum.org/public/collection/v1/objects/$artifactId",
        showError: true,
      )
          .then(
        (res) {
          if (res.isOk) {
            return Artifact.fromJson(res.data);
          }
          return null;
        },
      );
}
