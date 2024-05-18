import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vnheritage/pages/signin_signup/option_page.dart';

import 'common/routes/names.dart';
import 'common/routes/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseOptions firebaseOptions = const FirebaseOptions(
      apiKey: 'AIzaSyC93SrzISeinXLpqMCoIB8KLRMzeYeOhh8',
      appId: '1:355313154575:android:89e8b0e80cac2daa24017a',
      messagingSenderId: '355313154575',
      projectId: 'vnheriatge',
      storageBucket: "vnheriatge.appspot.com"
  );
  await Firebase.initializeApp(options:firebaseOptions);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'JobPilot App',
      theme: ThemeData(
        //fontFamily: 'Roboto Regular',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: OptionPage(),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
    );
  }
}
