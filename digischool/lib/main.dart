import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:digischool/APIs/firebase_api.dart';
import 'package:digischool/Components/notify_page.dart';
import 'package:digischool/screens/welcome_page.dart';
import 'package:digischool/themes/dark_theme.dart';
import 'package:digischool/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: AnimatedSplashScreen(
        splash: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: Image.asset(
              'lib/digiAppIcons/eduIcon.png',
            ),
          ),
        ),  
        splashTransition: SplashTransition.rotationTransition,
        duration: 3000,
        nextScreen: const WelcomeScreen(),
      ),
      navigatorKey: navigatorKey,
      routes: {
        '/notification_screen':(context) => const NotificationPage()
      },
    );
  }
}
