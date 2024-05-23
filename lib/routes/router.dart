import 'package:go_router/go_router.dart';
import 'package:qrcode_bloc/pages/add_product.dart';
import 'package:qrcode_bloc/pages/home.dart';
import 'package:qrcode_bloc/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qrcode_bloc/pages/register.dart';
import 'package:qrcode_bloc/pages/settings.dart';

export 'package:go_router/go_router.dart';

part 'route_names.dart';

// GoRouter configuration
final router = GoRouter(
  redirect: (context, state) {
    //cek kondisi sedang terautentikasi atau tidak
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser == null) {
      return "/login";
    } else {
      return null;
    }
  },
  routes: [
    GoRoute(
        path: '/',
        name: RouteNames.home,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'add-product',
            name: RouteNames.addProduct,
            builder: (context, state) => const AddProductPage(),
          )
        ]),
    GoRoute(
      path: '/login',
      name: RouteNames.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      name: RouteNames.register,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/setting',
      name: RouteNames.setting,
      builder: (context, state) => const SettingPage(),
    ),
  ],
);
