import 'package:neon_app_case/base/base_repository.dart';
import 'package:neon_app_case/screens/artifact_info_screen/model/artifact.dart';
import 'package:neon_app_case/services/api_service/api_service.dart';

class ArtifactInfoScreenRepository extends BaseRepository {
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
