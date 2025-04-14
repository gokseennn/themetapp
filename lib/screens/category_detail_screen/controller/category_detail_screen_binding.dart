import 'package:get/get.dart';
import 'package:neon_app_case/screens/category_detail_screen/controller/category_detail_screen_controller.dart';
import 'package:neon_app_case/screens/category_detail_screen/controller/category_detail_screen_repository.dart';

class CategoryDetailScreenBinding extends Binding {
  @override
  List<Bind> dependencies() => [
        Bind.lazyPut(() => CategoryDetailScreenController()),
        Bind.lazyPut(() => CategoryDetailScreenRepository()),
      ];
}
