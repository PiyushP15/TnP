// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tnp_portal/models/all_students.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tnp_portal/widgets/all_students_list.dart';

class Applicants extends ConsumerStatefulWidget {
  const Applicants({super.key, required this.cName});
  final String cName;

  @override
  ConsumerState<Applicants> createState() {
    return _ApplicantsState();
  }
}

//After login its not working... user must click on homepage from navigation to get data
class _ApplicantsState extends ConsumerState<Applicants> {
  List<AllStudents> students = [];

  @override
  void initState() {
    super.initState();
    getstudents();
  }

  Future<void> getstudents() async {
    List<AllStudents> temp = [];
    print('Process Started');
    final url = Uri.https(
        'tnp-portal-2023-default-rtdb.firebaseio.com', 'register.json');
    final urljob =
        Uri.https('tnp-portal-2023-default-rtdb.firebaseio.com', 'jobs.json');
    final getResponseJob = await http.get(urljob);
    // print('getResponseJob');
    final Map getDataJob = json.decode(getResponseJob.body);
    // print(getDataJob);
    final getResponse = await http.get(url);
    final Map getData = json.decode(getResponse.body);
    // print(getData);
    for (final x in getDataJob.entries) {
      print("All entries of jobs");
      if (widget.cName == x.value['cname']) {
        for (final a in x.value['applicants']) {
          print("Applicants list");
          var tempmail = a;
          print(a);
          for (final data in getData.entries) {
            print("User details");

            print("Storing user details");
            if (data.value['email'] == tempmail) {
              final name = data.value['name'];
              final email = data.value['email'];
              final gender = data.value['gender'];
              final dob = data.value['dob'];
              final ssc = data.value['ssc'];
              final ssc_year = data.value['ssc_year'];
              final hsc_year = data.value['hsc_year'];
              final hsc = data.value['hsc'];
              final grad = data.value['grad'];
              final grad_year = data.value['grad_year'];
              final sem1 = data.value['sem1'];
              final sem2 = data.value['sem2'];
              final sem3 = data.value['sem3'];
              final sem4 = data.value['sem4'];
              final isRestricted = data.value['isRestricted'];
              // if (email == 'admin.tnp@gmail.com') {
              //   continue;
              // }
              temp.add(AllStudents(
                name: name,
                email: email,
                dob: dob,
                gender: gender,
                ssc: ssc,
                ssc_year: ssc_year,
                hsc: hsc,
                hsc_year: hsc_year,
                grad: grad,
                grad_year: grad_year,
                sem1: sem1,
                sem2: sem2,
                sem3: sem3,
                sem4: sem4,
                isRestricted: isRestricted,
              ));
            }
          }
        }
      }
      print(temp);
    }
    setState(() {
      students = temp;
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TnP')),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: AllStudentsList(allStuds: students)),
    );
  }
}
