import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neon_app_case/router/app_router.dart';
import 'package:neon_app_case/services/api_service/api_service.dart';
import 'package:neon_app_case/services/app_service/app_service.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final appRouter = AppRouter(navigatorKey: rootNavigatorKey);

Future<void> initiliazeService() async {
  Get.put(
    ApiService(
      requestTimeout: 5.seconds,
      appRouter: appRouter,
    ),
    permanent: true,
  );
  Get.put(
    AppService(),
    permanent: true,
  );
}

void main() async {
  await initiliazeService();
  runApp(App());
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Neon App',
      theme: AppService.to.lightTheme,
      //darkTheme: AppService.to.darkTheme,
      //  themeMode: ThemeMode.system,
      routerConfig: appRouter.config(),
    );
  }
}
