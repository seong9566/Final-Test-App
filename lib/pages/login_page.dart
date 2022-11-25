import 'package:final_test_app/components/custom_text_form_field.dart';
import 'package:final_test_app/components/logo.dart';
import 'package:final_test_app/size.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Expanded(
          child: ListView(
            children: [
              SizedBox(height: xlarge_gap),
              Logo(title: "Login"),
              CustomTextFormField(text: "아이디"),
            ],
          ),
        ),
      ),
    );
  }
}
