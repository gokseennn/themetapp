import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:neon_app_case/common/widget/common_screen.dart';
import 'package:neon_app_case/screens/home_screen/controller/home_screen_binding.dart';
import 'package:neon_app_case/screens/home_screen/controller/home_screen_controller.dart';
import 'package:neon_app_case/screens/home_screen/view/component/home_screen_body.dart';
import 'package:neon_app_case/screens/home_screen/view/component/home_screen_header.dart';

@RoutePage()
class HomeScreen extends CommonScreen<HomeScreenController> {
  HomeScreen({super.key})
      : super(
          showAppBar: false,
          bindingFactory: () => HomeScreenBinding(),
          body: (context, controller) => Column(
            children: [
              HomeScreenHeader(),
              HomeScreenBody(controller: controller),
            ],
          ),
        );
}
