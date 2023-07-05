import 'package:flutter/material.dart';

class Job extends StatefulWidget{
  const Job({super.key, required this.id});

  final String id;
  
  @override
  State<Job> createState() {
    return _JobState();
  }
}

class _JobState extends State<Job>{
  @override
  Widget build(BuildContext context) {
    return const Text('Job Details');
  }

}