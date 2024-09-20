import 'package:flutter/material.dart';
import 'package:fluttersepclass/Primary_Screen/Login_Screen/Screen/loginScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Login Page"),),
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
