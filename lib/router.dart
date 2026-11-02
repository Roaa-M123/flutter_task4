import 'package:full_shopping_app_4/signup_page.dart';
import 'package:go_router/go_router.dart';

import 'login_page.dart';
import 'home_page.dart';
import 'products_page.dart';
import 'test.dart';

final router = GoRouter(
  initialLocation: "/login",
  redirect: (context, state) {
    var path = state.matchedLocation;
    if (path.startsWith("/home") && !Database.isLoggedIn) {
      return "/login";
    }
    return null;
  },
  routes: [
    GoRoute(path: "/login", builder: (context, state) => const LoginPage()),
    GoRoute(path: "/signup", builder: (context, state) => const SignupPage()),
    GoRoute(
      path: "/home",
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(path: 'products', builder: (context, state) => ProductsPage()),
      ],
    ),
  ],
);
