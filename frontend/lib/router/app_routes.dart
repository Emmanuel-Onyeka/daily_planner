enum AppRoutes {
  splash('/'),
  gettingStarted('/getting-started'),
  userInformation('/user-information'),
  dashboard('/dashboard');

  final String path;
  const AppRoutes(this.path);
}
