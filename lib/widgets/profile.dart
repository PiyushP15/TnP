import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'custom_text_field.dart';

final dummyUser = {
  'name':'Sarvesh',
  'email':'sarvesh@gmail.com',
  'dob':'19-Nov-2000',
  'gender':'Male',
  'ssc':83,
  'ssc_year':2017,
  'hsc':72,
  'hsc_year':2019,
  'grad':93.50,
  'grad_year':2022,
  'sem1':90,
  'sem2':'-',
  'sem3':'-',
  'sem4':'-',
};

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final user = dummyUser.entries.toList();
    final nameHandler = TextEditingController(text: '${user[0].value}');
    final emailHandler = TextEditingController(text: '${user[1].value}');
    final dobHandler = TextEditingController(text: '${user[2].value}');
    final genderHandler = TextEditingController(text: '${user[3].value}');
    final sscHandler = TextEditingController(text: '${user[4].value}');
    final sscYearHandler = TextEditingController(text: '${user[5].value}');
    final hscHandler = TextEditingController(text: '${user[6].value}');
    final hscYearHandler = TextEditingController(text: '${user[7].value}');
    final gradHandler = TextEditingController(text: '${user[8].value}');
    final gradYearHandler = TextEditingController(text: '${user[9].value}');
    final sem1Handler = TextEditingController(text: '${user[10].value}');
    final sem2Handler = TextEditingController(text: '${user[11].value}');
    final sem3Handler = TextEditingController(text: '${user[12].value}');
    final sem4Handler = TextEditingController(text: '${user[13].value}');
    // var _list = dummyUser.values.toList();
    // print(user[0].value);
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
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              'Email',
                              obscure: false,
                              cont: emailHandler,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              'DOB',
                              obscure: false,
                              cont: dobHandler,
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              'Gender',
                              obscure: false,
                              cont: genderHandler,
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0,30,0,0),
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
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              'Year',
                              obscure: false,
                              cont: sscYearHandler,
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
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              'Year',
                              obscure: false,
                              cont: hscYearHandler,
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
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              'Year',
                              obscure: false,
                              cont: gradYearHandler,
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
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              'Sem 2',
                              obscure: false,
                              cont: sem2Handler,
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
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              'Sem 4',
                              obscure: false,
                              cont: sem4Handler,
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
