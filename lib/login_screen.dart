import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("id"),
          Text('pw'),
          Row(
            children: [Text('로그인'), Text('횐가입')],
          ),
        ],
      ),
    );
  }
}
