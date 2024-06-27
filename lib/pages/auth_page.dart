import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muscle/pages/home_page.dart';
import 'package:muscle/pages/register_or_login.dart';
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else if (snapshot.hasError) {
            return const Center(child: Text('*********************************************************'));
          } else {
            return const RegisterOrLogin();
          }
        },
      ),
    );
  }
}