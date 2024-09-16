
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttersepclass/Primary_Screen/Constant/urls.dart';
import 'package:fluttersepclass/productlistpage.dart';
import 'package:http/http.dart'as http;

class RegisterService {
  Future<void>registerUser({
    required String name,
    required String mobilenumber,
    required String email,
    required String password,
    required context,
}) async{

    Map<String,dynamic> body = {
        "mobile_number":mobilenumber,
        "full_name": name,
        "email": email,
        "password":password,
        "is_visitor": "false",
        "organization_type":"public",
        "organization_name": "msk pvt ltd",
        "is_organization":"true"
    };
     final response = await http.post(Uri.parse(ApiUrls.registerUrls),
       headers: {"Content-Type":"application/json"},
       body: json.encode(body)
     );
     if (response.statusCode==201){
       print("*************");
       print("******");
       print("***");
       print(response.body);
       Navigator.push(
           context,
           MaterialPageRoute(builder: (context)=>ProductListPage(fullname: name,))
       );
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