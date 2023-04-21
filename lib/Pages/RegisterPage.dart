import 'package:flutter/material.dart';

import '../UI Components/Textfield.dart';
import '../UI Components/button.dart';
class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key
    ,
    required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //text editing controllers
  final EmailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signUserUp() async{
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
                  'Register Below with your details!',
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
                  onTap: signUserUp,
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


                //Don't have an account? Register Now
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already Have an Account?"),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            color: Color(0xFF447604), fontWeight: FontWeight.bold),
                      ),
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
