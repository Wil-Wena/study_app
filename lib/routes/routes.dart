import 'package:get/get.dart';
import 'package:study_app/screens/splash/splash_screen.dart';
import 'package:study_app/screens/welcome/welcome.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/welcome", page: () => WelcomeScreen())
      ];
}
