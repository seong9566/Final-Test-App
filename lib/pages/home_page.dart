import 'package:final_test_app/components/logo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 200),
          Logo(title: "Care Soft"),
          SizedBox(height: 50),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // 현재 화면에 쌓여있는 스택을 제거 해준다.
            },
            child: Text("Get Started"),
          )
        ],
      ),
    ));
  }
}
