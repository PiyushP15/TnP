// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tnp_portal/models/all_jobs.dart';
import 'package:http/http.dart' as http;
import 'package:tnp_portal/providers/user_provider.dart';

class AllJobsList extends ConsumerWidget {
  const AllJobsList({super.key, required this.allJobs});

  final List<AllJobs> allJobs;

  @override
  Widget build(context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final displayWords = screenWidth > 1080 ? 400 : 100;

    void applicationfailed() {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error'),
          content: const Text('You have already applied for this job post.'),
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
      return;
    }

    Future<void> apply(String cName) async {
      var flag = 0;
      List temp = [];
      final url = Uri.https(
          'tnp-portal-63ea2-default-rtdb.firebaseio.com', 'jobs.json');

      final getResponse = await http.get(url);

      final Map allData = json.decode(getResponse.body);
      for (final i in allData.entries) {
        if (cName == i.value['cname']) {
          for (final x in i.value['applicants']) {
            temp.add(x);
          }
        }
      }
      for (final i in allData.entries) {
        if (cName == i.value['cname']) {
          final id = i.key;
          final user = ref.watch(userProvider);
          for (final a in temp) {
            if (user['email'] == a) {
              flag = 1;
              //Applicant already applied
              applicationfailed();

              break;
            }
          }
          if (flag == 0) {
            final urlupdate = Uri.https(
                'tnp-portal-63ea2-default-rtdb.firebaseio.com',
                'jobs/$id.json');
            temp.add(user['email']);
            var check = await http.patch(urlupdate,
                body: json.encode({
                  'applicants': temp,
                }));
                
            if (check.statusCode == 200) {
              return showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Success'),
                  content: const Text('Succesfully applied for this job role'),
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
        }
      }
    }

    if (allJobs.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'No Jobs To Display As Of Now',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 50, color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: allJobs.length,
      itemBuilder: (ctx, index) => Card(
        color: const Color(0XFFFAA916),
        margin: screenWidth > 1080
            ? const EdgeInsets.fromLTRB(150, 5, 150, 5)
            : const EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  allJobs[index].companyName,
                  style: const TextStyle(
                    color: Color(0xFF96031A),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  allJobs[index].title.length > 40
                      ? '${allJobs[index].title.substring(0, 40)}...'
                      : allJobs[index].title,
                  style:
                      const TextStyle(color: Color(0xFF96031A), fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  allJobs[index].desc.length > displayWords
                      ? '${allJobs[index].desc.substring(0, displayWords)}...'
                      : allJobs[index].desc,
                  style: const TextStyle(
                    color: Color(0XFF304C89),
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0E6BA8),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: const Color(0XFFFAA916),
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: double.infinity,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Company Name:',
                                      style: TextStyle(
                                          color: Color(0xFF96031A),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      allJobs[index].companyName,
                                      style: const TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'Position:',
                                      style: TextStyle(
                                          color: Color(0xFF96031A),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      allJobs[index].title,
                                      style: const TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'Job Description:',
                                      style: TextStyle(
                                          color: Color(0xFF96031A),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Text(
                                          allJobs[index].desc,
                                          style: const TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          child: const Text('Close'),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        ElevatedButton(
                                            style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.green)),
                                            child: const Text('Apply'),
                                            onPressed: () {
                                              apply(allJobs[index].companyName);
                                              Navigator.pop(context);
                                            }),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      'View Details',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
