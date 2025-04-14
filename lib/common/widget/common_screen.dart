import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neon_app_case/base/base_controller.dart';
import 'package:neon_app_case/common/model/nav_bar_enum.dart';
import 'package:neon_app_case/common/widget/common_bottom_nav.dart';
import 'package:neon_app_case/common/widget/common_loader.dart';
import 'package:neon_app_case/common/widget/common_screen_base.dart';
import 'package:neon_app_case/main.dart';
import 'package:neon_app_case/router/app_router.gr.dart';
import 'package:neon_app_case/services/app_service/app_service.dart';

class CommonScreen<T extends BaseController> extends CommonScreenBase<T> {
  const CommonScreen({
    super.key,
    required super.bindingFactory,
    required super.body,
    this.showAppBar = true,
    this.appBarTitle,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  }) : assert(
          !(showAppBar && appBarTitle == null),
          'Title is required if AppBar is shown',
        );
  final bool showAppBar;
  final String? appBarTitle;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      tag: tag,
      initState: (state) => bindingFactory?.call().dependencies(),
      builder: (controller) => controller.obx(
        onLoading: Container(
          color: Colors.white,
          child: const CommonLoader(),
        ),
        (_) => Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: showAppBar
                  ? AppBar(
                      automaticallyImplyLeading: true,
                      leading: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            'assets/icons/btn_back@3x.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                      toolbarHeight: 50,
                      title: Text(appBarTitle!,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.black)),
                    )
                  : null,
              extendBody: true,
              backgroundColor: Colors.white,
              floatingActionButton: SizedBox(
                height: 75,
                width: 75,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  shape: const CircleBorder(),
                  onPressed: () {
                    AppService.to.selectedIndex.value = NavBarEnum.departments;
                    appRouter.pushAndPopUntil(DepartmentsRoute(),
                        predicate: (route) => false);
                  },
                  child: Obx(
                    () => Image.asset(
                      AppService.to.selectedIndex.value ==
                              NavBarEnum.departments
                          ? 'assets/icons/btn_tabbar_collection_selected@3x.png'
                          : 'assets/icons/btn_tabbar_collection_unselected@3x.png',
                      width: 45,
                      height: 45,
                    ),
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  const CustomFloatingActionButtonLocation(),
              bottomNavigationBar: const CommonBottomNavbar(),
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: padding!,
                    child: body(
                      context,
                      controller,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  const CustomFloatingActionButtonLocation();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width -
            scaffoldGeometry.floatingActionButtonSize.width) /
        2;

    // Y pozisyonunu ayarlayın - değer ne kadar büyük olursa o kadar aşağıya iner
    final double fabY = scaffoldGeometry.scaffoldSize.height -
        scaffoldGeometry.floatingActionButtonSize.height -
        60;

    return Offset(fabX, fabY);
  }
}
