import 'package:flutter/material.dart';
class goback extends StatelessWidget {

  final Function()? onTap;
  const goback({super.key, required this.onTap,});


  @override
  Widget build(BuildContext context, ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            "Go back <-",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,

            ),

          ),

        ),
      ),
    );
  }
}