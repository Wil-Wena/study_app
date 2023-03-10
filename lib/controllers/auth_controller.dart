import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  Future<void> initAuth() async {
    await Future.delayed(const Duration(
        seconds: 2)); //Delays the splash screen for a specific time interval
    navigateToWelcome();
  }

  void navigateToWelcome() {
    Get.offAllNamed("/welcome");
  }
}
