import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tnp_portal/models/all_students.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tnp_portal/widgets/all_students_list.dart';

class AllUsers extends ConsumerStatefulWidget {
  const AllUsers({super.key});

  @override
  ConsumerState<AllUsers> createState() {
    return _AllUsersState();
  }
}

//After login its not working... user must click on homepage from navigation to get data
class _AllUsersState extends ConsumerState<AllUsers> {
  List<AllStudents> students = [];

  @override
  void initState() {
    super.initState();
    getstudents();
  }

  Future<void> getstudents() async {
    List<AllStudents> temp = [];
    final url = Uri.https(
        'tnp-portal-2023-default-rtdb.firebaseio.com', 'register.json');
    final getResponse = await http.get(url);
    final Map getData = json.decode(getResponse.body);
    for (final x in getData.entries) {
      final name = x.value['name'];
      final email = x.value['email'];
      final gender = x.value['gender'];
      final dob = x.value['dob'];
      final ssc = x.value['ssc'];
      final ssc_year = x.value['ssc_year'];
      final hsc_year = x.value['hsc_year'];
      final hsc = x.value['hsc'];
      final grad = x.value['grad'];
      final grad_year = x.value['grad_year'];
      final sem1 = x.value['sem1'];
      final sem2 = x.value['sem2'];
      final sem3 = x.value['sem3'];
      final sem4 = x.value['sem4'];
      if (email == 'admin.tnp@gmail.com') {
        continue;
      }
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
      ));
    }

    setState(() {
      students = temp;
    });
  }

  @override
  Widget build(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: AllStudentsList(allStuds: students));
  }
}
