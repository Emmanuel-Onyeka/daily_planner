// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:dialy_planner/UI/features/base/views/dashboard_view.dart'
    as _i1;
import 'package:dialy_planner/UI/features/getting_started/views/getting_started_view.dart'
    as _i2;
import 'package:dialy_planner/UI/features/getting_started/views/user_information_view.dart'
    as _i4;
import 'package:dialy_planner/UI/features/onboarding/splash_view.dart' as _i3;

/// generated route for
/// [_i1.DashboardView]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute({List<_i5.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.DashboardView();
    },
  );
}

/// generated route for
/// [_i2.GettingStartedView]
class GettingStartedRoute extends _i5.PageRouteInfo<void> {
  const GettingStartedRoute({List<_i5.PageRouteInfo>? children})
    : super(GettingStartedRoute.name, initialChildren: children);

  static const String name = 'GettingStartedRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.GettingStartedView();
    },
  );
}

/// generated route for
/// [_i3.SplashView]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.SplashView();
    },
  );
}

/// generated route for
/// [_i4.UserInformationView]
class UserInformationRoute extends _i5.PageRouteInfo<void> {
  const UserInformationRoute({List<_i5.PageRouteInfo>? children})
    : super(UserInformationRoute.name, initialChildren: children);

  static const String name = 'UserInformationRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.UserInformationView();
    },
  );
}
