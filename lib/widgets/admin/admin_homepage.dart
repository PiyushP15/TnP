import 'package:flutter/material.dart';

class AdminHomepage extends StatelessWidget {
  const AdminHomepage({super.key});

  final students = 69;
  final jobs = 10;
  final applications = 690;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text('Dashboard',
                  style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700, color: Color(0xFF96031A)),
                  ),
                ),
              ],
            ),
          Text('Total Number Of Registered Users: $students'),
          Text('Total Number Of Jobs Posted: $jobs'),
          Text('Total Number Of Applications: $applications'),
        ]),
      );
  }
}
