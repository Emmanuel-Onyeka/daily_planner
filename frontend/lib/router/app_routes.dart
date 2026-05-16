enum AppRoutes {
  splash('/'),
  gettingStarted('/getting-started'),
  userInformation('/user-information');

  final String path;
  const AppRoutes(this.path);
}
