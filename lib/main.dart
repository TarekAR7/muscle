import 'package:flutter/material.dart';
import 'package:muscle/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:muscle/pages/home_page.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/auth': (context) => const AuthPage(),
        '/home': (context) => const HomePage(),
      },
      title: 'Flutter Demo',
      home: const AuthPage(),
    );
  }
}
