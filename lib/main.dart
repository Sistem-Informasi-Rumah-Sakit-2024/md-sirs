import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sirs/app/controllers/auth_controller.dart';
import 'package:sirs/app/utils/loading.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final autC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<User?>(
    //   stream: autC.streamAuthStatus,
    //   builder: (context, snapshot) {
    //     print('SNAPSHOT ${snapshot.data}');
    //     if (snapshot.connectionState == ConnectionState.active) {
    //       return GetMaterialApp(
    //         title: "Application",
    //         initialRoute: snapshot.data != null ? Routes.HOME : Routes.LOGIN,
    //         getPages: AppPages.routes,
    //         // home: snapshot.data != null ? HomeView() : LoginView(),
    //       );
    //     }
    //     return const LoadingView();
    //   },
    // );
    return GetMaterialApp(
      title: "Application",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
      // home: snapshot.data != null ? HomeView() : LoginView(),
    );
  }
}
