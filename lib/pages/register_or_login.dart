import 'package:flutter/material.dart';
import 'package:muscle/pages/login_page.dart';
import 'package:muscle/pages/register_page.dart';

class RegisterOrLogin extends StatefulWidget {
  const RegisterOrLogin({super.key});

  @override
  State<RegisterOrLogin> createState() => _RegisterOrLoginState();
}

class _RegisterOrLoginState extends State<RegisterOrLogin> {
  bool _showLogin = true;
  //toggle entre login et register
  void togglePages(){
    setState(() {
      _showLogin = !_showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_showLogin){
      return LoginPage(onPressed: togglePages);
    } else {
      return RegisterPage(onPressed: togglePages);
    }
  }
}