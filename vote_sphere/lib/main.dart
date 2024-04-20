import 'package:flutter/material.dart';
import 'presentation/screens/landing_page.dart';
import 'presentation/screens/home.dart';
import 'presentation/screens/feedback.dart';
import 'presentation/screens/login.dart';
import 'presentation/screens/settings.dart';
import 'presentation/screens/signUp.dart';
import 'presentation/screens/member.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'landing',
      routes: {
        'landing': (context) => LandingPage(),
        'home': (context) => Home(),
        'signUp': (context) => SignUpPage(),
        'login': (context) => LoginPage(),
        'feedBack': (context) => FeedBackForm(),
        'settings': (context) => Settings(),
        'members': (context) => Members(),
      },
    );
  }
}
