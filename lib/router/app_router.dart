import 'package:auto_route/auto_route.dart';
import 'package:neon_app_case/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter({super.navigatorKey});
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: HomeRoute.page,
          initial: true,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: DepartmentsRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        AutoRoute(
          page: CategoryDetailRoute.page,
          path: '/category/:categoryId',
        ),
        AutoRoute(
          page: ArtifactInfoRoute.page,
          path: '/artifact/:artifactId',
        ),
        AutoRoute(
          page: SearchRoute.page,
          path: '/search/:query',
        ),
        CustomRoute(
          page: InfoRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
      ];
}
