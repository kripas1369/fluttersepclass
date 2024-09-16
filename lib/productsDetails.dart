import 'package:flutter/material.dart';
import 'package:fluttersepclass/productlistpage.dart';

class Productsdetails extends StatelessWidget {
   final Products product;
   Productsdetails(this.product);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        CircleAvatar(radius:40,backgroundImage: NetworkImage(product.image??"",),),
        Text(product.title??""),
        Text(product.category??""),
        Text(product.description??""),
        Text("Rs:${product.price??""}"),
      ],),
    );
  }
}
