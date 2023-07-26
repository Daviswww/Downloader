import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';
// part 'app_router.gr.dart';
// dart run build_runner build --delete-conflicting-output

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: SplashPage.page, initial: true),
        AutoRoute(path: '/viewer', page: ViewerPage.page),
        AutoRoute(
          path: '/dashboard',
          page: Dashboard.page,
          children: [
            AutoRoute(path: 'home', page: HomePage.page),
            AutoRoute(path: 'activity', page: HistoryPage.page),
            AutoRoute(path: 'photo', page: PhotoPage.page),
          ],
        ),
      ];
}
