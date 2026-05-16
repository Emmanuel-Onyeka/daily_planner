// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:dialy_planner/UI/features/getting_started/views/getting_started_view.dart'
    as _i1;
import 'package:dialy_planner/UI/features/getting_started/views/user_information_view.dart'
    as _i3;
import 'package:dialy_planner/UI/features/onboarding/splash_view.dart' as _i2;

/// generated route for
/// [_i1.GettingStartedView]
class GettingStartedRoute extends _i4.PageRouteInfo<void> {
  const GettingStartedRoute({List<_i4.PageRouteInfo>? children})
    : super(GettingStartedRoute.name, initialChildren: children);

  static const String name = 'GettingStartedRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.GettingStartedView();
    },
  );
}

/// generated route for
/// [_i2.SplashView]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.SplashView();
    },
  );
}

/// generated route for
/// [_i3.UserInformationView]
class UserInformationRoute extends _i4.PageRouteInfo<void> {
  const UserInformationRoute({List<_i4.PageRouteInfo>? children})
    : super(UserInformationRoute.name, initialChildren: children);

  static const String name = 'UserInformationRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.UserInformationView();
    },
  );
}
