// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Packages for backend
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:tnp_portal/widgets/custom_text_field.dart';
import 'package:tnp_portal/providers/user_provider.dart';

const List<String> genders = <String>['Male', 'Female', 'Other'];

class Register extends ConsumerStatefulWidget {
  const Register({super.key, required this.onToggle, required this.onRegister});

  final void Function() onToggle;
  final void Function() onRegister;

  @override
  ConsumerState<Register> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends ConsumerState<Register> {
  final url =
      Uri.https('tnp-portal-2023-default-rtdb.firebaseio.com', 'register.json');
  final nameHandler = TextEditingController();
  final emailHandler = TextEditingController();
  final passHandler = TextEditingController();
  final cPassHandler = TextEditingController();
  final dobHandler = TextEditingController();
  final genderHandler = TextEditingController();
  final sscHandler = TextEditingController();
  final sscYearHandler = TextEditingController();
  final hscHandler = TextEditingController();
  final hscYearHandler = TextEditingController();
  final gradHandler = TextEditingController();
  final gradYearHandler = TextEditingController();
  final sem1Handler = TextEditingController();
  final sem2Handler = TextEditingController();
  final sem3Handler = TextEditingController();
  final sem4Handler = TextEditingController();

  String? genderValue;

  void handleSubmit() async {
    var userName = nameHandler.text.trim();
    var userEmail = emailHandler.text.trim();
    var userPass = passHandler.text.trim();
    var userCpass = cPassHandler.text.trim();
    var userGender = genderHandler.text.trim();
    var userDob = dobHandler.text.trim();
    var userSsc = sscHandler.text.trim();
    var userSscYear = sscYearHandler.text.trim();
    var userHsc = hscHandler.text.trim();
    var userHscYear = hscYearHandler.text.trim();
    var userGrad = gradHandler.text.trim();
    var userGradYear = gradYearHandler.text.trim();
    var userSem1 = sem1Handler.text.trim();
    var userSem2 = sem2Handler.text.trim();
    var userSem3 = sem3Handler.text.trim();
    var userSem4 = sem4Handler.text.trim();

    final getResponse = await http.get(url);
    final List _mails = [];
    final Map allData = json.decode(getResponse.body);
    for (final i in allData.entries) {
      _mails.add(i.value['email']);
    }
    print(_mails);
    var flag = 0;
    for (final e in _mails) {
      if (userEmail == e) {
        flag = 1;
        break;
      }
    }
    print(flag);

    if (flag == 1) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Email'),
          content: const Text('Email already used! Use another mail.'),
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
    } else if (userName.isEmpty ||
        userEmail.isEmpty ||
        userPass.isEmpty ||
        userCpass.isEmpty ||
        userGender.isEmpty ||
        userDob.isEmpty ||
        userSsc.isEmpty ||
        userSscYear.isEmpty ||
        userHsc.isEmpty ||
        userHscYear.isEmpty ||
        userGrad.isEmpty ||
        userGradYear.isEmpty) {
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
    } else if (userPass.length < 6) {
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
    } else if (userPass != userCpass) {
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
    } else {
      final postResponse = await http.post(
        url,
        headers: {'Cotent-Type': 'application/json'},
        body: json.encode(
          {
            'name': userName,
            'email': userEmail,
            'password': userPass,
            'dob': userDob,
            'gender': userGender,
            'ssc': userSsc,
            'ssc_year': userSscYear,
            'hsc': userHsc,
            'hsc_year': userHscYear,
            'grad': userGrad,
            'grad_year': userGradYear,
            'sem1': userSem1,
            'sem2': userSem2,
            'sem3': userSem3,
            'sem4': userSem4
          },
        ),
      );

      widget.onRegister();
    }
  }

  @override
  Widget build(context) {
    final user = ref.watch(userProvider);
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
              height: 500,
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
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      padding: const EdgeInsets.all(0),
                      itemBuilder: (ctx, index) => Column(
                        children: [
                          CustomTextField(
                            'Name',
                            obscure: false,
                            cont: nameHandler,
                            keyboard: TextInputType.text,
                          ), // Using custom textfield widgets
                          CustomTextField(
                            'Email',
                            obscure: false,
                            cont: emailHandler,
                            keyboard: TextInputType.emailAddress,
                          ), // Using custom textfield widgets
                          CustomTextField(
                            'Password',
                            obscure: true,
                            cont: passHandler,
                            keyboard: TextInputType.text,
                          ),
                          CustomTextField(
                            'Confirm Password',
                            obscure: true,
                            cont: cPassHandler,
                            keyboard: TextInputType.text,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            child: TextFormField(
                              obscureText: false,
                              controller: dobHandler,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'DOB',
                              ),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1980),
                                    lastDate: DateTime.now());

                                if (pickedDate != null) {
                                  final user = ref.watch(userProvider);
                                  // print(pickedDate);
                                  String formattedDate =
                                      DateFormat('dd-MM-yyyy')
                                          .format(pickedDate);
                                  // print(formattedDate);
                                  user['dob'] = formattedDate;
                                  // print(dummyUser['dob']);
                                  // print(initialUser);
                                  dobHandler.text = formattedDate;
                                } else {}
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            child: DropdownButtonFormField<String>(
                              hint: const Text('Choose Gender'),
                              value: genderValue,
                              elevation: 16,
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  genderValue = value!;
                                  genderHandler.text = genderValue!;
                                });
                              },
                              items: genders.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          CustomTextField(
                            'SSC %',
                            obscure: false,
                            cont: sscHandler,
                            keyboard: TextInputType.number,
                          ),
                          CustomTextField(
                            'SSC Year',
                            obscure: false,
                            cont: sscYearHandler,
                            keyboard: TextInputType.number,
                          ),
                          CustomTextField(
                            'HSC %',
                            obscure: false,
                            cont: hscHandler,
                            keyboard: TextInputType.number,
                          ),
                          CustomTextField(
                            'HSC Year',
                            obscure: false,
                            cont: hscYearHandler,
                            keyboard: TextInputType.number,
                          ),
                          CustomTextField(
                            'Graduation %',
                            obscure: false,
                            cont: gradHandler,
                            keyboard: TextInputType.number,
                          ),
                          CustomTextField(
                            'Graduation Year',
                            obscure: false,
                            cont: gradYearHandler,
                            keyboard: TextInputType.number,
                          ),
                          CustomTextField(
                            'Sem-1 %',
                            obscure: false,
                            cont: sem1Handler,
                            keyboard: TextInputType.number,
                          ),
                          CustomTextField(
                            'Sem-2 %',
                            obscure: false,
                            cont: sem2Handler,
                            keyboard: TextInputType.number,
                          ),
                          CustomTextField(
                            'Sem-3 %',
                            obscure: false,
                            cont: sem3Handler,
                            keyboard: TextInputType.number,
                          ),
                          CustomTextField(
                            'Sem-4 %',
                            obscure: false,
                            cont: sem4Handler,
                            keyboard: TextInputType.number,
                          ),
                        ],
                      ),
                      // shrinkWrap: true,
                    ),
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
