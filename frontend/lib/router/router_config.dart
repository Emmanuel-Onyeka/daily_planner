import 'package:auto_route/auto_route.dart';
import 'package:dialy_planner/router/app_routes.dart';
import 'package:dialy_planner/router/router_config.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routerConfig = Provider<AppRouter>((ref) => AppRouter()); 

@AutoRouterConfig(replaceInRouteName: 'Screen|Page|View,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      path: AppRoutes.splash.path,
      initial: true,
    ),
    AutoRoute(
      page: GettingStartedRoute.page,
      path: AppRoutes.gettingStarted.path,
    ),
  ];

  @override
  List<AutoRouteGuard> get guards => [];
}
