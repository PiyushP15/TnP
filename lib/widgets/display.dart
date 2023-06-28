import 'package:flutter/material.dart';

import 'package:tnp_portal/widgets/login.dart';
import 'package:tnp_portal/widgets/register.dart';
import 'package:tnp_portal/widgets/shared_layout.dart';

class Display extends StatefulWidget{
  const Display({super.key});
  
  @override
  State<Display> createState() {
    return _DisplayState();
  }
}

class _DisplayState extends State<Display>{
  var activeScreen = 'login';

  void switchScreen(){
    setState(() {
      if(activeScreen=='login'){
        activeScreen='register';
      }
      else{
        activeScreen = 'login';
      }
    });
  }

  void handleLogin(){
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context)=>const SharedLayout())
    );
  }
  void handleRegister(){
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context)=>const SharedLayout())
    );
  }

  @override
  Widget build(context){
    return activeScreen == 'login'? Login(onToggle: switchScreen,onLogin: handleLogin,) : Register(onToggle: switchScreen,onRegister:handleRegister,);
  }
}