import 'package:flutter/material.dart';

import '../Pages/RegisterPage.dart';
import '../Pages/login_page.dart';
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void togglescreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });

  }

  @override
  Widget build(BuildContext context) {
    //initially show thw login page
    if(showLoginPage = true){
      return LoginPage(showRegisterPage: togglescreens);
    }else{
      return RegisterPage(showLoginPage: togglescreens);
    }



  }
}
