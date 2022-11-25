import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SvgPicture.asset(
            "assets/login.svg",
            width: 70,
            height: 70,
          )
        ],
      ),
    );
  }
}
