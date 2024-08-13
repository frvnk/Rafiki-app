import 'package:flutter/material.dart';
import 'package:rafi/home/screens/login.dart';
import 'package:rafi/home/screens/register.dart';
class LoginorRegister extends StatefulWidget {
  const LoginorRegister({super.key});

  @override
  State<LoginorRegister> createState() => _LoginorRegisterState();
}

class _LoginorRegisterState extends State<LoginorRegister> {
  bool showLoginPage= true;
  void togglePages(){
    setState(() {
      showLoginPage =! showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return SignIn(onTap: togglePages);
    }else{
      return SignUp(onTap: togglePages,);
    }
  }
}
