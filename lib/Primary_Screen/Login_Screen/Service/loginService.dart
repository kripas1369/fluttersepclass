
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttersepclass/Primary_Screen/Constant/urls.dart';
import 'package:fluttersepclass/productlistpage.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

class Loginservice {
  Future<void>loginUser({
    required String email,
    required String password,
    required context,
  }) async{

    Map<String,dynamic> body = {
      "username":email,
      "password":password,
      "login_type":"mobile"
    };

    final response = await http.post(Uri.parse(ApiUrls.loginUrls),
        headers: {"Content-Type":"application/json"},
        body: json.encode(body)
    );
    if (response.statusCode==200){
      print("*************");
      print("******");
      print("***");
      print(email);
      print(email);
      print(email);
      print(email);
      print(response.body);
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>ProductListPage())
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('e', email);
      await prefs.setString('p', password);
    }else if (response.statusCode==400){
      print("mobilenumberr");
      print(response.body);
      final Map<String,dynamic> responseBody = json.decode(response.body);
      if (responseBody.containsKey("mobile_number")){
        final List<dynamic> mobilenumberError = responseBody['mobile_number'];
        if(mobilenumberError.isNotEmpty){
          final errorMessage = mobilenumberError.first;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:  Text(errorMessage),
              action: SnackBarAction(
                label: 'Action',
                onPressed: () {
                  // Code to execute.
                },
              ),
            ),
          );
          return;
        }
      }
    }else if (response.statusCode==404){
      print("Asdfasdfasdf");
    }
    else{
      print("#############");
      print("####");
      print("##");
      print(response.body);
    }
  }
}