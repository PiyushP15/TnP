import 'package:flutter/material.dart';
import 'package:tnp_portal/models/all_jobs.dart';

class AllJobsList extends StatelessWidget {
  const AllJobsList({super.key, required this.allJobs});

  final List<AllJobs> allJobs;

  @override
  Widget build(context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final displayWords = screenWidth>1080 ? 400:100;
    return ListView.builder(
      itemCount: allJobs.length,
      itemBuilder: (ctx, index) => Card(
        color: const Color(0XFFFAA916),
        margin: screenWidth > 1080 ? const EdgeInsets.fromLTRB(150, 5, 150, 5): const EdgeInsets.fromLTRB(20, 5, 20, 5),
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
                      fontSize: 24, fontWeight: FontWeight.w500,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  allJobs[index].title.length > 40
                      ? '${allJobs[index].title.substring(0, 40)}...'
                      : allJobs[index].title,
                  style: const TextStyle(
                    color: Color(0xFF96031A),
                    fontSize: 18),
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
                    onPressed: () {}, 
                    child: const Text(
                      'View Details',
                      style: TextStyle(fontSize: 12),
                    ),
                    ),
                ],
              ),
              const SizedBox(height: 5,)
            ],
          ),
        ),
      ),
    );
  }
}
