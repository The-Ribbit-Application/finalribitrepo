import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finalribitrepo/UI Components/SquareTile.dart';

import '../UI Components/Textfield.dart';
import '../UI Components/button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing controllers
  final EmailController = TextEditingController();
  final passwordController = TextEditingController();

//SignUserIn method
  Future signUserIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: EmailController.text.trim(),
        password: passwordController.text.trim()
    ).catchError((error) => print(error));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCFE795),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                //logo goes here
                Image.asset("lib/Images/img.png", height: 300),
                const Text(
                  'Great Grades are a hop away!',
                  style: TextStyle(
                      color: Color(0xFF447604),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 50),
                //Welcome text
                const Text(
                  'Log-In',
                  style: TextStyle(
                      color: Color(0xFF447604),
                      fontSize: 64,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 25),
                //username text-field
                Textfield(
                  controller: EmailController,
                  hintText: "Username",
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                //password text-field
                Textfield(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 25),

                //forgot password link
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Color(0xFF447604)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                button(
                  onTap: signUserIn,
                  buttonText: 'Sign In',
                ),

                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 1.0,
                        color: Colors.grey[400],
                      )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 1.0,
                        color: Colors.grey[400],
                      ))
                    ],
                  ),
                ),
                //google sign in + apple sign in
                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    //google button
                    SquareTile(
                        imagePath: "lib/Images/google logo.png", imageHeight: 60),
                    SizedBox(width: 50),

                    //apple button
                    SquareTile(
                        imagePath: "lib/Images/apple logo.png", imageHeight: 60),
                  ],
                ),

                //Don't have an account? Register Now
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Don't have an account?"),
                    SizedBox(width: 4),
                    Text(
                      "Sign up now!",
                      style: TextStyle(
                          color: Color(0xFF447604), fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

