import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tnp_portal/providers/user_provider.dart';

import 'custom_text_field.dart';

// final dummyUser = {
//   'name': 'Sarvesh',
//   'email': 'sarvesh@gmail.com',
//   'dob': '19-11-2000',
//   'gender': 'Male',
//   'ssc': 83,
//   'ssc_year': 2017,
//   'hsc': 72,
//   'hsc_year': 2019,
//   'grad': 93.50,
//   'grad_year': 2022,
//   'sem1': 90,
//   'sem2': '-',
//   'sem3': '-',
//   'sem4': '-',
// };

const List<String> genders = <String>['Male', 'Female', 'Other'];

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends ConsumerState<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final nameHandler = TextEditingController(text: user['name']);
    final emailHandler = TextEditingController(text: user['email']);
    final dobHandler = TextEditingController(text: user['dob']);
    final genderHandler = TextEditingController(text: user['gender']);
    final sscHandler = TextEditingController(text: user['ssc']);
    final sscYearHandler = TextEditingController(text: user['ssc_year']);
    final hscHandler = TextEditingController(text: user['hsc']);
    final hscYearHandler = TextEditingController(text: user['hsc_year']);
    final gradHandler = TextEditingController(text: user['grad']);
    final gradYearHandler = TextEditingController(text: user['grad_year']);
    final sem1Handler = TextEditingController(text: user['sem1']);
    final sem2Handler = TextEditingController(text: user['sem2']);
    final sem3Handler = TextEditingController(text: user['sem3']);
    final sem4Handler = TextEditingController(text: user['sem4']);
    // var _list = dummyUser.values.toList();
    // print(user[0].value);
    // String genderValue = genders.first;

    void onUpdate() {
      var userName = nameHandler.text.trim();
      var userEmail = emailHandler.text.trim();
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
      if (userName.isEmpty ||
          userEmail.isEmpty ||
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
      } else {
        final user = ref.watch(userProvider);
        user['name'] = userName;
        user['email'] = userEmail;
        user['dob'] = userDob;
        user['gender'] = userGender;
        user['ssc'] = userSsc;
        user['ssc_year'] = userSscYear;
        user['hsc'] = userHsc;
        user['hsc_year'] = userHscYear;
        user['grad'] = userGrad;
        user['grad_year'] = userGradYear;
        user['sem1'] = userSem1;
        user['sem2'] = userSem2;
        user['sem3'] = userSem3;
        user['sem4'] = userSem4;
        // print(user);

        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Success!'),
            content: const Text('Profile Updated Successfully!'),
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
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: screenWidth > 1080
            ? const EdgeInsets.symmetric(horizontal: 50, vertical: 10)
            : const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(5),
          ),
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: screenWidth > 1080
                ? const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                : const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/images/userDp.png'),
                        height: 100,
                        width: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ElevatedButton(
                          onPressed: () async {
                            XFile? result = await ImagePicker.platform
                                .getImage(source: ImageSource.gallery);
                            if (result != null) {
                              // File file = File(result.files.single.path);
                              print('path is ${result.path}');
                            } else {
                              print("No file selected");
                            }
                          },
                          child: const Text('Change Picture'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Personal Details',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0XFF0E6BA8),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              'Name',
                              obscure: false,
                              cont: nameHandler,
                              keyboard: TextInputType.text,
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              'Email',
                              obscure: false,
                              cont: emailHandler,
                              keyboard: TextInputType.emailAddress,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
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
                                      initialDate: DateFormat('dd-MM-yyyy')
                                          .parse(user['dob'].toString()),
                                      firstDate: DateTime(1980),
                                      lastDate: DateTime.now());

                                  if (pickedDate != null) {
                                    // print(pickedDate);
                                    String formattedDate =
                                        DateFormat('dd-MM-yyyy')
                                            .format(pickedDate);
                                    // print(formattedDate);
                                    user['dob'] = formattedDate;
                                    // print(dummyUser['dob']);
                                    dobHandler.text = formattedDate;
                                  } else {}
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 0),
                              child: DropdownButtonFormField<String>(
                                value: user['gender'],
                                elevation: 16,
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    user['gender'] = value!;
                                    genderHandler.text = user['gender']!;
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
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Text(
                          'Educational Details',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0XFF0E6BA8),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              'SSC Marks',
                              obscure: false,
                              cont: sscHandler,
                              keyboard: TextInputType.number,
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              'Year',
                              obscure: false,
                              cont: sscYearHandler,
                              keyboard: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              'HSC Marks',
                              obscure: false,
                              cont: hscHandler,
                              keyboard: TextInputType.number,
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              'Year',
                              obscure: false,
                              cont: hscYearHandler,
                              keyboard: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              'Graduation Marks',
                              obscure: false,
                              cont: gradHandler,
                              keyboard: TextInputType.number,
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              'Year',
                              obscure: false,
                              cont: gradYearHandler,
                              keyboard: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              'Sem 1',
                              obscure: false,
                              cont: sem1Handler,
                              keyboard: TextInputType.number,
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              'Sem 2',
                              obscure: false,
                              cont: sem2Handler,
                              keyboard: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              'Sem 3',
                              obscure: false,
                              cont: sem3Handler,
                              keyboard: TextInputType.number,
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              'Sem 4',
                              obscure: false,
                              cont: sem4Handler,
                              keyboard: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: ElevatedButton(
                              onPressed: onUpdate,
                              child: const Text('Update Profile',
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
