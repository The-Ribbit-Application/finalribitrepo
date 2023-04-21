import 'package:finalribitrepo/Pages/timerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../UI Components/goback.dart';
import '../UI Components/timerbutton.dart';
import '../UI Components/todobutton.dart';
import 'home.dart';
class buttonpage extends StatelessWidget {
  const buttonpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCFE795),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Great Grades are a hop away!',
                style: TextStyle(
                    color: Color(0xFF447604),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 200),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
              ),
              const SizedBox(height: 25),
              timerbutton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const timerpage()),
                  );
                },
              ),
              const SizedBox(height: 25),
              todobutton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
              const SizedBox(height: 200),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
              ),
              const SizedBox(height: 25),



              goback(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}