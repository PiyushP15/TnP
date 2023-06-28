import 'package:flutter/material.dart';

class MyApplications extends StatelessWidget {
  const MyApplications({super.key});

  @override
  Widget build(context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'My Applications',
                  style: TextStyle(
                      fontSize: screenWidth>1080?32:24,
                      color: const Color(0xFF96031A),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
              const SizedBox(height: 20),
              DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xFF96031A),
                ),
                border: TableBorder.all(
                  width: 1,
                  color: const Color(0xFF96031A),
                ),
                columns: [
                  DataColumn(
                    label: Expanded(
                      child: Center(
                        child: Text(
                          'Company Name',
                          style: TextStyle(
                            fontSize: screenWidth>1080?24:18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFFAA916),
                          ),
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Center(
                        child: Text(
                          'Status',
                          style: TextStyle(
                              fontSize: screenWidth>1080?24:18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFFAA916),
                              
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            'CompanyName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'StatusName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            'CompanyName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'StatusName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            'CompanyName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'StatusName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            'CompanyName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'StatusName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            'CompanyName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'StatusName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            'CompanyName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'StatusName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            'CompanyName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'StatusName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            'CompanyName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'StatusName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            'CompanyName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'StatusName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            'CompanyName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'StatusName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            'CompanyName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'StatusName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            'CompanyName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'StatusName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            'CompanyName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'StatusName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            'CompanyName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'StatusName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            'CompanyName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'StatusName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            'CompanyName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'StatusName',
                            style: TextStyle(
                                fontSize: screenWidth > 1080 ? 18 : 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
