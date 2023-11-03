import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String userName;
  final String id;

  // ignore: use_key_in_widget_constructors
  const MyDrawer({required this.userName, required this.id});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(id),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.person),
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
        ],
      ),
    );
  }
}
