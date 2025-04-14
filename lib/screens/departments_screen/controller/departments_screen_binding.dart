import 'package:get/get.dart';
import 'package:neon_app_case/screens/departments_screen/controller/departments_screen_controller.dart';
import 'package:neon_app_case/screens/departments_screen/controller/departments_screen_repository.dart';

class DepartmentsScreenBinding extends Binding {
  @override
  List<Bind> dependencies() => [
        Bind.lazyPut(() => DepartmentsScreenController()),
        Bind.lazyPut(() => DepartmentsScreenRepository()),
      ];
}
