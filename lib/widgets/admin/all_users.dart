import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tnp_portal/models/all_students.dart';
import 'package:tnp_portal/providers/job_provider.dart';
import 'package:tnp_portal/providers/user_provider.dart';
import 'package:tnp_portal/models/all_jobs.dart';
import 'package:tnp_portal/widgets/admin/admin_job_list.dart';
import 'package:tnp_portal/widgets/all_jobs_list.dart';
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
    // getjobs();
  }

  final List<AllStudents> allStuds =[AllStudents(name: 'Sarvesh', email: 'TMKC')];

  // Future<void> getjobs() async {
  //   List<AllStudents> temp=[];
  //   final url =
  //       Uri.https('tnp-portal-2023-default-rtdb.firebaseio.com', 'jobs.json');
  //   final getResponse = await http.get(url);
  //   final Map getData = json.decode(getResponse.body);
  //   for (final x in getData.entries) {
  //     final cname = x.value['cname'];
  //     final des = x.value['description'];
  //     final pos = x.value['position'];
  //     temp.add(AllJobs(companyName: cname, title: pos, desc: des));
  //   }
  //   print(temp);
  //   setState(() {
  //     jobs=temp;
  //   });
  // }

  @override
  Widget build(context){
    //Made to set the 
    final user = ref.watch(userProvider);
    // final global_jobs = ref.watch(jobProvider);
    // Here we will set jobs equal to the fetched jobs

    // Fetch All Jobs As A List Here In allJobs (You Can Do It Above As Well, Must Be triggered Everytime The Widget Is Called.)
    // final List<Map<String,String>> fetchedJobs = []; 
    print('jobs in homepage $students');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: AllStudentsList(allStuds: allStuds)
    );
    // ListView.builder(itemCount: _jobs.length , itemBuilder: (ctx, index)=> Text(_jobs[index].title));
  }
}