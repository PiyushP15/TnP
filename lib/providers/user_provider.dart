import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<Map<String, String>> {
  UserNotifier()
      : super({
          'name': '',
          'email': '',
          'password': '',
          'dob': '',
          'gender': 'Male',
          'ssc': '',
          'ssc_year': '',
          'hsc': '',
          'hsc_year': '',
          'grad': '',
          'grad_year': '',
          'sem1': '',
          'sem2': '',
          'sem3': '',
          'sem4': '',
        });

  void resetState() {
    state = {
      'name': '',
      'email': '',
      'password': '',
      'dob': '',
      'gender': 'Male',
      'ssc': '',
      'ssc_year': '',
      'hsc': '',
      'hsc_year': '',
      'grad': '',
      'grad_year': '',
      'sem1': '',
      'sem2': '',
      'sem3': '',
      'sem4': ''
    };
  }
}

final userProvider =
    StateNotifierProvider<UserNotifier, Map<String, String>>((ref) {
  return UserNotifier();
});
