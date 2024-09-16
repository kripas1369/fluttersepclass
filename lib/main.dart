import 'package:flutter/material.dart';
import 'package:fluttersepclass/Primary_Screen/Register_Screen/body.dart';
import 'package:fluttersepclass/productlistpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.red)),
      home: RegisterScreen()
    );
  }
}

