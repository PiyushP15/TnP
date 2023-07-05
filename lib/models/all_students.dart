import 'package:uuid/uuid.dart';

const uuid = Uuid();

class AllStudents {
  AllStudents(
      {required this.name,
      required this.email,
      required this.dob,
      required this.gender,
      required this.ssc,
      required this.ssc_year,
      required this.hsc,
      required this.hsc_year,
      required this.grad,
      required this.grad_year,
      required this.sem1,
      required this.sem2,
      required this.sem3,
      required this.sem4})
      : id = uuid.v4();

  final String id;
  final String name;
  final String dob;
  final String gender;
  final String ssc;
  final String ssc_year;
  final String hsc;
  final String hsc_year;
  final String grad;
  final String grad_year;
  final String sem1;
  final String sem2;
  final String sem3;
  final String sem4;
  final String email;
}
