import 'package:get/get.dart';
import 'package:prompita/features/auth/screens/login_screen.dart';
import 'package:prompita/features/auth/screens/register_screen.dart';
import 'package:prompita/features/home/screens/home_screen.dart';
import 'package:prompita/features/profile/screens/profile_screen.dart';
import 'package:prompita/features/prompts/screens/add_prompts_screen.dart';

import 'package:prompita/route/route_names.dart';

class Routes {
  static final pages = [
    GetPage(
      name: RouteNames.logInScreen,
      page: () => const LoginScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: RouteNames.registerScreen,
      page: () => const RegisterScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteNames.homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RouteNames.profileScreen,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: RouteNames.addPromptsScreen,
      page: () => AddPromptsScreen(),
      transition: Transition.rightToLeftWithFade,
    )
  ];
}
