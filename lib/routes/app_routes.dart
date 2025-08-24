enum AppRoutes {
  onboardingScreen(name: 'onboarding', path: '/onboarding'),
  signInScreen(name: 'signIn', path: '/sign-in'),
  signUpScreen(name: 'signUp', path: '/sign-up'),
  forgetPasswordScreen(name: 'forgetPassword', path: '/forget-password'),
  homeScreen(name: 'home', path: '/'),
  profileScreen(name: 'profile', path: '/profile'),
  productDetailsScreen(name: 'productDetails', path: '/product/:id'),
  wishlistScreen(name: 'wishlistDetails', path: '/wishlist'),
  cartScreen(name: 'cartDetails', path: '/cart'),
  orderHistoryScreen(name: 'orderHistoryDetails', path: '/orderHistory');

  final String name;
  final String path;

  const AppRoutes({required this.name, required this.path});
}
