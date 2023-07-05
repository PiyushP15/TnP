import 'package:uuid/uuid.dart';

const uuid = Uuid();

class AllJobs{

  AllJobs({required this.title, required this.companyName, required this.desc, required this.applicants}): id = uuid.v4();

  final String id;
  final String companyName;
  final String title;
  final String desc;
  final List<String> applicants;
}