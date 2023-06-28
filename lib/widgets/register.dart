import 'package:flutter/material.dart';

import 'package:tnp_portal/widgets/custom_text_field.dart';

class Register extends StatefulWidget {
  const Register({super.key, required this.onToggle, required this.onRegister});

  final void Function() onToggle;
  final void Function() onRegister;

  @override
  State<Register> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {
  final nameHandler = TextEditingController();
  final emailHandler = TextEditingController();
  final passHandler = TextEditingController();
  final cPassHandler = TextEditingController();

  void handleSubmit() {
    var userName = nameHandler.text.trim();
    var userEmail = emailHandler.text.trim();
    var userPass = passHandler.text.trim();
    var userCpass = cPassHandler.text.trim();
    if (userName.isEmpty || userEmail.isEmpty || userPass.isEmpty || userCpass.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Enter All Credentials!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }
    else if (userPass.length <6) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Password Too Short!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }
    else if(userPass != userCpass){
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Passwords Do Not Match!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }
    else{
      widget.onRegister();
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.blue.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(
            //   height: 225,
            // ),
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(5, 5),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/latestlogopccoe.png'),
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                  repeat: ImageRepeat.noRepeat,
                  opacity: 0.5,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              width: 400,
              // height: 350,
              margin: const EdgeInsets.fromLTRB(
                20,
                0,
                20,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Register',
                    style: TextStyle(
                      color: Color(0XFFA4243B),
                      fontSize: 42,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Divider(
                    color: Color(0XFF0E6BA8),
                    thickness: 2,
                  ),
                  CustomTextField(
                    'Name',
                    obscure:false,
                    cont: nameHandler,
                  ), // Using custom textfield widgets
                  CustomTextField(
                    'Email',
                    obscure:false,
                    cont: emailHandler,
                  ), // Using custom textfield widgets
                  CustomTextField(
                    'Password',
                    obscure:true,
                    cont: passHandler,
                  ),
                  CustomTextField(
                    'Confirm Password',
                    obscure:true,
                    cont: cPassHandler,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 20, 50, 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(30),
                      ),
                      onPressed: () => handleSubmit(),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already A User ?',
                          style: TextStyle(fontSize: 18),
                        ),
                        TextButton(
                          onPressed: widget.onToggle,
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
