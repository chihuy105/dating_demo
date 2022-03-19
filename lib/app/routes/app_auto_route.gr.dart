// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../all_file/all_file.dart' as _i1;
import '../modules/swipe/views/swipe_view.dart' as _i2;

class AppAutoRoute extends _i3.RootStackRouter {
  AppAutoRoute([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeView());
    },
    SwipeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SwipeView());
    },
    LikedListRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LikedListView());
    },
    SecondLookRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SecondLookView());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i3.RouteConfig(HomeRoute.name, path: '/home', children: [
          _i3.RouteConfig(SwipeRoute.name,
              path: 'swipe', parent: HomeRoute.name),
          _i3.RouteConfig(LikedListRoute.name,
              path: 'liked-list', parent: HomeRoute.name),
          _i3.RouteConfig(SecondLookRoute.name,
              path: 'second-look', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.SwipeView]
class SwipeRoute extends _i3.PageRouteInfo<void> {
  const SwipeRoute() : super(SwipeRoute.name, path: 'swipe');

  static const String name = 'SwipeRoute';
}

/// generated route for
/// [_i1.LikedListView]
class LikedListRoute extends _i3.PageRouteInfo<void> {
  const LikedListRoute() : super(LikedListRoute.name, path: 'liked-list');

  static const String name = 'LikedListRoute';
}

/// generated route for
/// [_i1.SecondLookView]
class SecondLookRoute extends _i3.PageRouteInfo<void> {
  const SecondLookRoute() : super(SecondLookRoute.name, path: 'second-look');

  static const String name = 'SecondLookRoute';
}
