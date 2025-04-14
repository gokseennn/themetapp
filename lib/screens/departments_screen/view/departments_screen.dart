import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:neon_app_case/common/widget/common_screen.dart';
import 'package:neon_app_case/screens/departments_screen/controller/departments_screen_binding.dart';
import 'package:neon_app_case/screens/departments_screen/controller/departments_screen_controller.dart';
import 'package:neon_app_case/screens/departments_screen/view/component/departments_screen_body.dart';

@RoutePage()
class DepartmentsScreen extends CommonScreen<DepartmentsScreenController> {
  DepartmentsScreen({super.key})
      : super(
          showAppBar: false,
          bindingFactory: () => DepartmentsScreenBinding(),
          body: (context, controller) => SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                DepartmentsScreenBody(controller: controller),
              ],
            ),
          ),
        );
}
