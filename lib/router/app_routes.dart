import 'package:flutter/material.dart';
import '../Screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'welcome';

  static Map<String, Widget Function(BuildContext)> routes = {
    'welcome': (context) => const WelcomeScreen(),
    'home': (context) => const HomePage(),
    'login': (context) => const LoginScreen(),
    'register': (context) => const SignUpScreen(),
    'guides': (context) => const GuideScreen(),
    'test': (context) => const TestScreen(),
    'detail_screen': (context) => const GuideDetailScreen(),
    'victory': (context) => const VictoryScreen(),
    'fail': (context) => const FailScreen()
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const HomePage(),
    );
  }
}
