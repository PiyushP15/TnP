import 'package:flutter/material.dart';
import 'package:tnp_portal/models/all_students.dart';

class AllStudentsList extends StatelessWidget {
  const AllStudentsList({super.key, required this.allStuds});

  final List<AllStudents> allStuds;

  @override
  Widget build(context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (allStuds.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'No Students Yet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 50, color: Colors.grey.withOpacity(0.5)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return Expanded(
      child: ListView.builder(
        itemCount: allStuds.length,
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        allStuds[index].name,
                        style: const TextStyle(
                          color: Color(0xFF96031A),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Spacer(),
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
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              'Name:            ',
                                              style: TextStyle(
                                                  color: Color(0xFF96031A),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              allStuds[index].name,
                                              style: const TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Flexible(
                                              child: Text(
                                                'Email:            ',
                                                style: TextStyle(
                                                    color: Color(0xFF96031A),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                            Text(
                                              allStuds[index].email,
                                              style: const TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Gender:         ',
                                              style: TextStyle(
                                                  color: Color(0xFF96031A),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              allStuds[index].gender,
                                              style: const TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'DOB:              ',
                                              style: TextStyle(
                                                  color: Color(0xFF96031A),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              allStuds[index].dob,
                                              style: const TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'SSC:              ',
                                              style: TextStyle(
                                                  color: Color(0xFF96031A),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              allStuds[index].ssc,
                                              style: const TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'SSC Year:     ',
                                              style: TextStyle(
                                                  color: Color(0xFF96031A),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              allStuds[index].ssc_year,
                                              style: const TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'HSC:              ',
                                              style: TextStyle(
                                                  color: Color(0xFF96031A),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              allStuds[index].hsc,
                                              style: const TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'HSC Year:     ',
                                              style: TextStyle(
                                                  color: Color(0xFF96031A),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              allStuds[index].hsc_year,
                                              style: const TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Grad:             ',
                                              style: TextStyle(
                                                  color: Color(0xFF96031A),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              allStuds[index].grad,
                                              style: const TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Grad Year:    ',
                                              style: TextStyle(
                                                  color: Color(0xFF96031A),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              allStuds[index].grad_year,
                                              style: const TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Sem 1:         ',
                                              style: TextStyle(
                                                  color: Color(0xFF96031A),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              allStuds[index].sem1,
                                              style: const TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Sem 2:         ',
                                              style: TextStyle(
                                                  color: Color(0xFF96031A),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              allStuds[index].sem2,
                                              style: const TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Sem 3:         ',
                                              style: TextStyle(
                                                  color: Color(0xFF96031A),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              allStuds[index].sem3,
                                              style: const TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Sem 4:         ',
                                              style: TextStyle(
                                                  color: Color(0xFF96031A),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              allStuds[index].sem4,
                                              style: const TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
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
                                              child: const Text('Restrict User'),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
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
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
