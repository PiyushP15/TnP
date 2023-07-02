import 'package:flutter/material.dart';
import 'package:tnp_portal/widgets/admin/admin_layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tnp_portal/widgets/login.dart';
import 'package:tnp_portal/widgets/register.dart';
import 'package:tnp_portal/widgets/shared_layout.dart';

import '../providers/user_provider.dart';

class Display extends ConsumerStatefulWidget {
  const Display({super.key});

  @override
  ConsumerState<Display> createState() {
    return _DisplayState();
  }
}

class _DisplayState extends ConsumerState<Display> {
  var activeScreen = 'login';

  void switchScreen() {
    setState(() {
      if (activeScreen == 'login') {
        activeScreen = 'register';
      } else {
        activeScreen = 'login';
      }
    });
  }

  void handleLogin(String email) {
    if (email == 'admin.tnp@gmail.com') {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const AdminLayout()));
    } else {
      final user = ref.watch(userProvider);
      user['email'] = email;
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SharedLayout()));
    }
  }

  void handleRegister() {
    switchScreen();
  }

  @override
  Widget build(context) {
    return activeScreen == 'login'
        ? Login(
            onToggle: switchScreen,
            onLogin: handleLogin,
          )
        : Register(
            onToggle: switchScreen,
            onRegister: handleRegister,
          );
  }
}
