



import 'package:flutter/material.dart';

InputDecoration customPrefixDecoration(String lableText, Icon icon){
  bool _isclicked = true;
  return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      prefixIcon: icon,
      // hintText: "Fullname",
      labelText: lableText,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50)
      )
  );
}