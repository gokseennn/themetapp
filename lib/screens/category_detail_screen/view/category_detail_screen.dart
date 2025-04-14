import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:neon_app_case/common/widget/common_screen.dart';
import 'package:neon_app_case/screens/category_detail_screen/controller/category_detail_screen_binding.dart';
import 'package:neon_app_case/screens/category_detail_screen/controller/category_detail_screen_controller.dart';
import 'package:neon_app_case/screens/category_detail_screen/view/component/category_detail_body.dart';

@RoutePage()
class CategoryDetailScreen
    extends CommonScreen<CategoryDetailScreenController> {
  final int categoryId;
  final String categoryName;
  CategoryDetailScreen({
    super.key,
    @pathParam required this.categoryId,
    @pathParam required this.categoryName,
  }) : super(
          showAppBar: true,
          appBarTitle: categoryName,
          bindingFactory: () => CategoryDetailScreenBinding(),
          body: (context, controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: CategoryDetailBody(controller: controller),
                ),
              ],
            );
          },
        );
}
