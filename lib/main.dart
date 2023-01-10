import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/binding/initial_bindings.dart';
import 'package:study_app/data_uploader_screen.dart';
import 'package:study_app/firebase_options.dart';
import 'package:study_app/routes/routes.dart';
import 'package:study_app/screens/splash/splash_screen.dart';
import 'package:study_app/screens/welcome/welcome.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   runApp(GetMaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: DataUploaderScreen(),
//   ));
// }
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes(),
    );
  }
}
