import 'package:flutter/material.dart';
import 'package:tnp_portal/providers/user_provider.dart';
import 'package:tnp_portal/widgets/display.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

import 'package:tnp_portal/widgets/homepage.dart';
import 'package:tnp_portal/widgets/my_applications.dart';
import 'package:tnp_portal/widgets/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SharedLayout extends ConsumerStatefulWidget {
  const SharedLayout({super.key});

  @override
  ConsumerState<SharedLayout> createState() {
    return _SharedLayout();
  }
}

class _SharedLayout extends ConsumerState<SharedLayout> {
  Widget _currentPage = const Homepage();

  void changePage(String page) {
    if (page == 'homepage') {
      setState(() {
        _currentPage = const Homepage();
        Navigator.pop(context);
      });
    }
    if (page == 'myapplications') {
      setState(() {
        _currentPage = const MyApplications();
        Navigator.pop(context);
      });
    }
    if (page == 'profile') {
      setState(() {
        _currentPage = const Profile();
        Navigator.pop(context);
      });
    }
    if (page == 'logout') {
      ref.read(userProvider.notifier).resetState();
      setState(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Display()));
      });
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TnP')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 28, color: Color(0XFFFFFFFF)),
              ),
            ),
            ListTile(
              title: const Text('Homepage'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                changePage('homepage');
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => const Homepage()));
              },
            ),
            ListTile(
              title: const Text('My Aplications'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                changePage('myapplications');
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const MyApplications()));
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                changePage('profile');
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => const Profile()));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                FirebaseAuth.instance.signOut();
                changePage('logout');
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => const Display()));
              },
            ),
          ],
        ),
      ),
      body: _currentPage,
    );
  }
}
