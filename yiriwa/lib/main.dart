import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:provider/provider.dart';
import 'package:yiriwa/providers/user_providers.dart';
import 'package:yiriwa/responsive/mobile_screen.dart';
import 'package:yiriwa/responsive/responsive_layout.dart';
import 'package:yiriwa/responsive/web_screen.dart';
import 'package:yiriwa/screen/acceuil.dart';
import 'package:yiriwa/screen/admin_screen.dart';
import 'package:yiriwa/screen/categories.dart';
import 'package:yiriwa/screen/connexion.dart';
import 'package:yiriwa/screen/inscription.dart';
import 'package:yiriwa/screen/test.dart';
import 'package:yiriwa/screen/welcome.dart';
import 'package:yiriwa/service/Auth_Service.dart';
import 'package:yiriwa/utils/colors.dart';

void main() async {
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

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget currentPage = inscription();
  AuthClass authClass = AuthClass();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    String? token = await authClass.getToken();
    if (token != null) {
      setState(() {
        currentPage = mobileScreenLayout();
      });
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yiriwa',
        // theme: ThemeData.dark().copyWith(
        //   scaffoldBackgroundColor: mobileBackgroundColor,
        // ),
        home: StreamBuilder(
          stream: firebase_auth.FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponveLayout(
                  webScreenLayout: testScreen(),
                  mobileScreenLayout: mobileScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            return const welcomeScreen();
          },
        ),
      ),
    );
  }
}
