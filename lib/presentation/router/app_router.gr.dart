// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:myapp/presentation/components/dashboard.dart' as _i3;
import 'package:myapp/presentation/screens/history/history_page.dart' as _i2;
import 'package:myapp/presentation/screens/home/home_page.dart' as _i1;
import 'package:myapp/presentation/screens/photo/photo_page.dart' as _i6;
import 'package:myapp/presentation/screens/splash/splash_page.dart' as _i4;
import 'package:myapp/presentation/screens/viewer/viewer_page.dart' as _i5;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomePage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    HistoryPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HistoryPage(),
      );
    },
    Dashboard.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Dashboard(),
      );
    },
    SplashPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashPage(),
      );
    },
    ViewerPage.name: (routeData) {
      final args = routeData.argsAs<ViewerPageArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ViewerPage(
          key: args.key,
          index: args.index,
        ),
      );
    },
    PhotoPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.PhotoPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomePage extends _i7.PageRouteInfo<void> {
  const HomePage({List<_i7.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HistoryPage]
class HistoryPage extends _i7.PageRouteInfo<void> {
  const HistoryPage({List<_i7.PageRouteInfo>? children})
      : super(
          HistoryPage.name,
          initialChildren: children,
        );

  static const String name = 'HistoryPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Dashboard]
class Dashboard extends _i7.PageRouteInfo<void> {
  const Dashboard({List<_i7.PageRouteInfo>? children})
      : super(
          Dashboard.name,
          initialChildren: children,
        );

  static const String name = 'Dashboard';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashPage]
class SplashPage extends _i7.PageRouteInfo<void> {
  const SplashPage({List<_i7.PageRouteInfo>? children})
      : super(
          SplashPage.name,
          initialChildren: children,
        );

  static const String name = 'SplashPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ViewerPage]
class ViewerPage extends _i7.PageRouteInfo<ViewerPageArgs> {
  ViewerPage({
    _i8.Key? key,
    required int index,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ViewerPage.name,
          args: ViewerPageArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewerPage';

  static const _i7.PageInfo<ViewerPageArgs> page =
      _i7.PageInfo<ViewerPageArgs>(name);
}

class ViewerPageArgs {
  const ViewerPageArgs({
    this.key,
    required this.index,
  });

  final _i8.Key? key;

  final int index;

  @override
  String toString() {
    return 'ViewerPageArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i6.PhotoPage]
class PhotoPage extends _i7.PageRouteInfo<void> {
  const PhotoPage({List<_i7.PageRouteInfo>? children})
      : super(
          PhotoPage.name,
          initialChildren: children,
        );

  static const String name = 'PhotoPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
