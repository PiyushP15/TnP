import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tnp_portal/providers/job_provider.dart';
import 'package:tnp_portal/providers/user_provider.dart';
import 'package:tnp_portal/models/all_jobs.dart';
import 'package:tnp_portal/widgets/admin/admin_job_list.dart';
import 'package:tnp_portal/widgets/all_jobs_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApplications extends ConsumerStatefulWidget {
  const MyApplications({super.key});

  @override
  ConsumerState<MyApplications> createState() {
    return _MyApplicationsState();
  }
}

//After login its not working... user must click on MyApplications from navigation to get data
class _MyApplicationsState extends ConsumerState<MyApplications> {
  List<AllJobs> jobs = [];

  @override
  void initState() {
    super.initState();
    getjobs();
  }

  Future<void> getjobs() async {
    List<AllJobs> temp = [];

    final url =
        Uri.https('tnp-portal-2023-default-rtdb.firebaseio.com', 'jobs.json');
    final getResponse = await http.get(url);
    final Map getData = json.decode(getResponse.body);

    for (final x in getData.entries) {
      List l = x.value['applicants'];

      for (final applicant in l.sublist(2)) {
        final user = ref.watch(userProvider);

        if (user['email'] == applicant) {
          final cname = x.value['cname'];
          final des = x.value['description'];
          final pos = x.value['position'];
          temp.add(AllJobs(
              companyName: cname, title: pos, desc: des, applicants: []));
        }
      }
    }
    // print(temp);
    setState(() {
      jobs = temp;
    });
  }

  @override
  Widget build(context) { 
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: AllJobsList(allJobs: jobs),
    );
    // ListView.builder(itemCount: _jobs.length , itemBuilder: (ctx, index)=> Text(_jobs[index].title));
  }
}
