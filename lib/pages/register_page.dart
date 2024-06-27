import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muscle/components/my_button.dart'; 
import 'package:muscle/components/my_textfield.dart';
import 'package:muscle/components/square_tile.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:muscle/services/auth_service.dart';


class RegisterPage extends StatefulWidget {
  late final Function()? onPressed;
  RegisterPage({super.key,  required this.onPressed});

  @override
  State<RegisterPage> createState() => _RegisterPageState();

  
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //fonction d'inscription  avec email et mot de passe
  void signUp() async{
    try {
      showDialog(context: context, builder: (context) => Center(child: LoadingAnimationWidget.beat(
        color: Colors.blue,
        size: 50, 
      ),
      ));
      if(passwordController.text != confirmPasswordController.text){
        Navigator.pop(context);
        errorMessageConnexion('Passwords do not match');
        return;
      }
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      errorMessageConnexion(e.code);
    }

  }
  errorMessageConnexion(String text){
    showDialog(context: context, builder: (context)=> AlertDialog(
      title: const Text('Error'),
      content: Text(text),
      actions: [
        TextButton(onPressed: ()=>Navigator.pop(context), child: const Text('OK')),
      ],
    ));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:  SafeArea(
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.lock,
                size: 100,
                
              ),
              const SizedBox(height: 50),
              //Message de login 
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 25),
              //Champ de saisie de l'email
              MyTextField(controller: emailController, hintText: "Email",icon: Icons.email, obscureText: false),
              const SizedBox(height: 15),
              //Champ de saisie du mot de passe
              MyTextField(controller: passwordController, hintText: "Password", icon: Icons.lock, obscureText: true),
              const SizedBox(height: 15),
              //Champ de saisie du mot de passe
              MyTextField(controller: confirmPasswordController, hintText: " confirm Password", icon: Icons.lock, obscureText: true),
              const SizedBox(height: 10),
            
            
              const SizedBox(height: 25),
              
              //Bouton de connexion
              MyButton(text: "Sign Up", 
              onPressed: signUp
              ),
              const SizedBox(height: 50),
            
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 0.5,
                        indent: 25,
                        endIndent: 25,
                      ),
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Continue with',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 0.5,
                        indent: 25,
                        endIndent: 25,
                      ),
                      
                    ),
                    
                  ],
                ),
              ),
              const SizedBox(height: 50),
              //Bouton de connexion avec google
              SquareTile(onTap: ()=> AuthService().signInWithGoogle(), image_path: 'images/google.png'),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?', style: TextStyle(color: Colors.grey[700],),),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onPressed,
                    child: Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],),
          ),
        ),
      ),
    );
  }
}