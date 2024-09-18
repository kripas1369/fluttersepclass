import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttersepclass/Primary_Screen/Login_Screen/body.dart';
import 'package:fluttersepclass/Primary_Screen/Register_Screen/Service/register_service.dart';
import 'package:fluttersepclass/Primary_Screen/Register_Screen/Widgets/textfield.dart';
import 'package:fluttersepclass/productlistpage.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullnameController =TextEditingController();
  TextEditingController mobilenumber =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key:_formKey,
      child: Column(
        children: [
          SizedBox(height: 40,),
          TextFormField(
            controller: fullnameController,
            textInputAction: TextInputAction.next,
            validator: (value){
              if(value == null || value.isEmpty){
                return "please enter your fullname";
              }
              return null;
            },
            decoration: customPrefixDecoration("Fullname",Icon(Icons.person))

          ),
          SizedBox(height: 30,),
          TextFormField(
              maxLength:10 ,
              controller: mobilenumber,
              keyboardType: TextInputType.number,
              validator: (value){
                if(value == null || value.isEmpty){
                  return "please enter your mobilenumber";
                }
                return null;
              },
              decoration: customPrefixDecoration("mobilenumber",Icon(Icons.call))
          ), TextFormField(
              // maxLength:10 ,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                if(value == null || value.isEmpty){
                  return "please enter your Email";
                }
                return null;
              },
              decoration: customPrefixDecoration("Email",Icon(Icons.call))
          ),
          SizedBox(height: 30,),

          TextFormField(
            // maxLength:10 ,
              controller: passwordController,
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                if(value == null || value.isEmpty){
                  return "please enter your Password";
                }
                return null;
              },
              decoration: customPrefixDecoration("Password",Icon(Icons.call))
          ),
        SizedBox(height: 30,),
          
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.blueAccent,
                onPressed: (){

                  if(_formKey.currentState!.validate() ){
                    RegisterService().registerUser(
                        name: fullnameController.text,
                        mobilenumber: mobilenumber.text,
                        email: emailController.text,
                        password: passwordController.text,
                        context: context
                    );
                  }
                },
                child: Text("Register"),),
              TextButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
                  child: Text("Login"))
            ],
          )

        ],
      ),
    );
  }
}
