import 'package:flutter/material.dart';
import 'package:fluttersepclass/Primary_Screen/Register_Screen/Screen/register_Screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
