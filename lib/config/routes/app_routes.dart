enum AppRoutes {
  splashScreen(name: 'splash', path: '/splash'),
  loginScreen(name: 'login', path: '/login'),
  signUpScreen(name: 'signUp', path: '/signUp'),
  forgetPasswordScreen(name: 'forgetPassword', path: '/forgetPassword'),
  homeScreen(name: 'home', path: '/'),
  productScreen(name: 'product', path: '/product'),
  profileScreen(name: 'profile', path: '/profile'),
  walkthroughScreen(name: 'walkthrough', path: '/walkthrough');

  final String name;
  final String path;

  const AppRoutes({required this.name, required this.path});
}
