import 'package:flutter/material.dart';
import 'package:tnp_portal/models/all_jobs.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tnp_portal/widgets/admin/admin_layout.dart';
import 'package:tnp_portal/widgets/admin/applicants.dart';

class AdminJobsList extends StatelessWidget {
  const AdminJobsList({super.key, required this.allJobs});
  final List<AllJobs> allJobs;
  @override
  Widget build(context) {
    // ignore: unused_local_variable
    var flag = 0;
    final screenWidth = MediaQuery.of(context).size.width;
    final displayWords = screenWidth > 1080 ? 400 : 100;
    Future<void> handleDelete(String cName, String pos) async {
      final url = Uri.https(
          'tnp-portal-63ea2-default-rtdb.firebaseio.com', 'jobs.json');
      final getResponse = await http.get(url);
      final Map allData = json.decode(getResponse.body);
      for (final i in allData.entries) {
        if ((cName == i.value['cname']) && (pos == i.value['position'])) {
          final id = i.key;
          final urldelete = Uri.https(
              'tnp-portal-63ea2-default-rtdb.firebaseio.com', 'jobs/$id.json');
          final delResponse = await http.delete(urldelete);
          print(delResponse.statusCode);
          if (delResponse.statusCode == 200) {
            flag = 1;
            break;
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
                                        
                                        screenWidth < 1080
                                            ? const Spacer()
                                            : const SizedBox(width: 10),
                                        ElevatedButton(
                                          child: const Text('See Applicants'),
                                          onPressed: () {
                                            print(allJobs[index].applicants);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Applicants(
                                                            cName: allJobs[
                                                                    index]
                                                                .companyName)));
                                          },
                                        ),
                                       
                                        screenWidth < 1080
                                            ? const Spacer()
                                            : const SizedBox(width: 10),
                                        ElevatedButton(
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Color(0xFF96031A))),
                                          child: const Text('Delete Job'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            handleDelete(
                                                allJobs[index].companyName,
                                                allJobs[index].title);
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AdminLayout()));
                                          },
                                        ),
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
