import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neon_app_case/base/base_controller.dart';
import 'package:neon_app_case/main.dart';
import 'package:neon_app_case/router/app_router.gr.dart';
import 'package:neon_app_case/screens/departments_screen/controller/departments_screen_repository.dart';
import 'package:neon_app_case/screens/home_screen/model/department.dart';

class DepartmentsScreenController extends BaseController {
  final DepartmentsScreenRepository _repository =
      Get.find<DepartmentsScreenRepository>();

  final Rx<List<Department>> departments = Rx<List<Department>>([]);
  final RxBool isSearchFocused = false.obs;
  final TextEditingController searchController = TextEditingController();

  @override
  Future<bool> initController() async {
    await getDepartments();
    return super.initController();
  }

  Future<void> getDepartments() async {
    final list = await _repository.getDepartments();
    if (list != null) {
      departments.value = list;
    }
  }

  Future<void> onEditingComplate() async {
    appRouter.push(
      SearchRoute(
        query: searchController.text,
      ),
    );
  }
}
