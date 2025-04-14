import 'package:neon_app_case/base/base_repository.dart';
import 'package:neon_app_case/screens/home_screen/model/department.dart';
import 'package:neon_app_case/services/api_service/api_service.dart';

class DepartmentsScreenRepository extends BaseRepository {
  Future<List<Department>?> getDepartments() => apiService
          .request(
        method: HttpMethod.get,
        path:
            'https://collectionapi.metmuseum.org/public/collection/v1/departments',
        showError: true,
      )
          .then(
        (response) {
          if (response.isOk) {
            return (response.data["departments"] as List)
                .map((e) => Department.fromJson(e))
                .toList();
          } else {
            return null;
          }
        },
      );
}
