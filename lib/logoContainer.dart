import 'package:flutter/material.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 17, 167, 0),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 200,
        child: Image.asset("img/icons/logo.png", height: 200,),
      ),
    );
  }
}