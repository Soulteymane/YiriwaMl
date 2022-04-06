import 'package:admin/constants.dart';
import 'package:admin/screens/admin.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBwiLSLaW0NgmW6BZvHV-kBZrb92AOo5ZI",
            authDomain: "yiriwa-7836a.firebaseapp.com",
            projectId: "yiriwa-7836a",
            storageBucket: "yiriwa-7836a.appspot.com",
            messagingSenderId: "465674302312",
            appId: "1:465674302312:web:b1c4e042814b1cbd48dcdd",
            measurementId: "G-SQ05GLQ2K7"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yiriwa Dashboard',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: MainScreen(),
      ),
    );
  }
}
