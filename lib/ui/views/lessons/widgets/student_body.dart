import 'package:flutter/material.dart';

class StudentBody extends StatelessWidget {
  const StudentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Bienvenido estudiante",
        style: TextStyle(
          fontSize: 30,
        ),)
      ],
    );
  }
}
