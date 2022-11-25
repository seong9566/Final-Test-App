import 'package:final_test_app/components/custom_text_form_field.dart';
import 'package:final_test_app/size.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // 글로벌 key

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // 해당 키로 Form의 상태를 관리 한다.
      child: Column(
        children: [
          CustomTextFormField(text: "아이디"),
          SizedBox(height: small_gap),
          CustomTextFormField(text: "비밀번호"),
          SizedBox(height: small_gap),
          CustomTextFormField(text: "이메일"),
          TextButton(
            onPressed: () {
              //Form에서 현재의 상태 값이 null이 아니라면 /home로 push 해준다.
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, "/home");
              }
            },
            child: Text("로그인"),
          )
        ],
      ),
    );
  }
}
