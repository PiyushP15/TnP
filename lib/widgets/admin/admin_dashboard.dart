import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  final students = 69;
  final jobs = 10;
  final applications = 690;

  @override
  Widget build(context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final List dummyData = [
      {'name': 'TCS', 'applicants': 42, 'placed': 09},
      {'name': 'Cognizant', 'applicants': 42, 'placed': 09}
    ];
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Dashboard',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF96031A)),
                    ),
                  ),
                ],
              ),
              // Text(
              //   'NOTE',
              //   style: TextStyle(fontSize: 42, fontWeight: FontWeight.w700,color: Colors.grey.withOpacity(0.4)),

              // ),
              // Text(
              //   'The Admin Dashboard is disabled as off now!',
              //   style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700,color: Colors.grey.withOpacity(0.4)),

              // ),
            ],
          ),
        ),
        Flexible(
          child: Row(
            children: [
              Column(
                children: [
                  Card(
                    color: const Color(0XFFFAA916),
                    margin: screenWidth > 1080
                        ? const EdgeInsets.fromLTRB(150, 5, 150, 5)
                        : const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 50,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: Text(
                                        "TCS",
                                        style: TextStyle(
                                          color: Color(0xFF96031A),
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      "69",
                                      style: TextStyle(
                                        color: Color(0xFF96031A),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                      ),
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
                ],
              ),
            ],
          ),
        ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: dummyData.length,
            itemBuilder: (ctx, index) => Card(
              color: const Color(0XFFFAA916),
              margin: screenWidth > 1080
                  ? const EdgeInsets.fromLTRB(150, 5, 150, 5)
                  : const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 50,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "TCS",
                                  style: TextStyle(
                                    color: Color(0xFF96031A),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "69",
                            style: TextStyle(
                              color: Color(0xFF96031A),
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "7",
                            style: TextStyle(
                              color: Color(0xFF96031A),
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
