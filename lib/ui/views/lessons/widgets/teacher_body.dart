import 'package:flutter/material.dart';

class TeacherBody extends StatelessWidget {
  const TeacherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Bienvenido Maestro",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
