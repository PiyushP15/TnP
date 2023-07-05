import 'package:uuid/uuid.dart';

const uuid = Uuid();

class AllStudents{

  AllStudents({required this.name, required this.email}): id = uuid.v4();

  final String id;
  final String name;
  final String email;
}