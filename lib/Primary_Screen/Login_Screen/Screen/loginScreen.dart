import 'package:flutter/material.dart';
import 'package:fluttersepclass/Primary_Screen/Login_Screen/Service/loginService.dart';
import 'package:fluttersepclass/Primary_Screen/Register_Screen/Widgets/textfield.dart';
import 'package:fluttersepclass/Secondary_Screen/Meetinglist_Screen/Service/Meetinghistory_service.dart';


class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController =TextEditingController(text: "9860486269");
  TextEditingController passwordController = TextEditingController(text: "Admin@12");
  @override
  Widget build(BuildContext context) {
    return Form(
      key:_formKey,
      child: Column(
        children: [
          SizedBox(height: 40,),
         TextFormField(
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
                    Loginservice().loginUser(
                        email: emailController.text,
                        password: passwordController.text, context: context);
                      MeetinghistoryService().fetchMeetingData();
                  }
                },
                child: Text("Login"),),
              // TextButton(onPressed: (){
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context)=>LoginScreen()));
              // },
              //     child: Text("Login"))
            ],
          )

        ],
      ),
    );
  }
}
