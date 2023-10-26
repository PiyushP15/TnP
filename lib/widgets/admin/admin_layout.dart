import 'package:flutter/material.dart';
import 'package:tnp_portal/providers/user_provider.dart';
import 'package:tnp_portal/widgets/admin/admin_dashboard.dart';
import 'package:tnp_portal/widgets/admin/all_users.dart';
import 'package:tnp_portal/widgets/display.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";


import 'package:tnp_portal/widgets/admin/add_job.dart';
import 'package:tnp_portal/widgets/homepage.dart';

class AdminLayout extends ConsumerStatefulWidget {
  const AdminLayout({super.key});

  @override
  ConsumerState<AdminLayout> createState() {
    return _AdminLayout();
  }
}

class _AdminLayout extends ConsumerState<AdminLayout> {
  Widget _currentPage = const AdminDashboard();

  void changePage(String page) {
    if (page == 'homepage') {
      setState(() {
        _currentPage = const AdminDashboard();
        Navigator.pop(context);
      });
    }
    if (page == 'addjob') {
      setState(() {
        _currentPage = const AddJob();
        Navigator.pop(context);
      });
    }
    if (page == 'alljobs') {
      setState(() {
        _currentPage = const Homepage();
        Navigator.pop(context);
      });
    }
    if (page == 'allusers') {
      setState(() {
        _currentPage = const AllUsers();
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
              title: const Text('Add Job'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                changePage('addjob');
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const MyApplications()));
              },
            ),
            ListTile(
              title: const Text('All Jobs'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                changePage('alljobs');
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => const Profile()));
              },
            ),
            ListTile(
              title: const Text('All Users'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                changePage('allusers');
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => const Display()));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
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
