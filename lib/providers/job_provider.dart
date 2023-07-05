import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tnp_portal/models/all_jobs.dart';

class JobNotifier extends StateNotifier<List<AllJobs>>{
  JobNotifier() : super([]); 
}

final jobProvider = StateNotifierProvider<JobNotifier,List<AllJobs>>((ref){
  return JobNotifier();
});