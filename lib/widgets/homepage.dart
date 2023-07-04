import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tnp_portal/models/all_jobs.dart';
import 'package:tnp_portal/widgets/all_jobs_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() {
    return _Homepage();
  }
}

//After login its not working... user must click on homepage from navigation to get data
class _Homepage extends ConsumerState<Homepage> {
  List<AllJobs> jobs = [];
  @override
  void initState() {
    super.initState();
    getjobs();
  }

  Future<void> getjobs() async {
    final url =
        Uri.https('tnp-portal-2023-default-rtdb.firebaseio.com', 'jobs.json');
    final getResponse = await http.get(url);
    final Map getData = json.decode(getResponse.body);
    for (final x in getData.entries) {
      final cname = x.value['cname'];
      final des = x.value['description'];
      final pos = x.value['position'];
      jobs.add(AllJobs(companyName: cname, title: des, desc: pos));
    }
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
