import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobNotifier extends StateNotifier<List<Map<String,String>>>{
  JobNotifier() : super([]); 
}

final jobProvider = StateNotifierProvider<JobNotifier,List<Map<String,String>>>((ref){
  return JobNotifier();
});