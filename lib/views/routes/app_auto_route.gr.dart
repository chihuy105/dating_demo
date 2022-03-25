// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../all_file/all_file.dart' as _i1;
import '../screens/auth/views/login_page.dart' as _i2;
import '../screens/swipe/views/swipe_page.dart' as _i3;

class AppAutoRoute extends _i4.RootStackRouter {
  AppAutoRoute([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    SwipeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SwipePage());
    },
    LikedListRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LikedListPage());
    },
    SecondLookRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SecondLookPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        _i4.RouteConfig(HomeRoute.name, path: '/home', children: [
          _i4.RouteConfig(SwipeRoute.name,
              path: 'swipe', parent: HomeRoute.name),
          _i4.RouteConfig(LikedListRoute.name,
              path: 'liked-list', parent: HomeRoute.name),
          _i4.RouteConfig(SecondLookRoute.name,
              path: 'second-look', parent: HomeRoute.name)
        ]),
        _i4.RouteConfig(LoginRoute.name, path: '/login')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.SwipePage]
class SwipeRoute extends _i4.PageRouteInfo<void> {
  const SwipeRoute() : super(SwipeRoute.name, path: 'swipe');

  static const String name = 'SwipeRoute';
}

/// generated route for
/// [_i1.LikedListPage]
class LikedListRoute extends _i4.PageRouteInfo<void> {
  const LikedListRoute() : super(LikedListRoute.name, path: 'liked-list');

  static const String name = 'LikedListRoute';
}

/// generated route for
/// [_i1.SecondLookPage]
class SecondLookRoute extends _i4.PageRouteInfo<void> {
  const SecondLookRoute() : super(SecondLookRoute.name, path: 'second-look');

  static const String name = 'SecondLookRoute';
}
