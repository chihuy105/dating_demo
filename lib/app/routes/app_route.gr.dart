// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../../all_file/all_file.dart' as _i1;

class AppRoute extends _i2.RootStackRouter {
  AppRoute([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeView());
    },
    LikedListRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LikedListView());
    },
    SecondLookRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SecondLookView());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i2.RouteConfig(HomeRoute.name, path: '/home', children: [
          _i2.RouteConfig(LikedListRoute.name,
              path: 'liked', parent: HomeRoute.name),
          _i2.RouteConfig(SecondLookRoute.name,
              path: 'second-look', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute({List<_i2.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.LikedListView]
class LikedListRoute extends _i2.PageRouteInfo<void> {
  const LikedListRoute() : super(LikedListRoute.name, path: 'liked');

  static const String name = 'LikedListRoute';
}

/// generated route for
/// [_i1.SecondLookView]
class SecondLookRoute extends _i2.PageRouteInfo<void> {
  const SecondLookRoute() : super(SecondLookRoute.name, path: 'second-look');

  static const String name = 'SecondLookRoute';
}
