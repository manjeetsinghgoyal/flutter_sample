import 'package:flutter/material.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Refreshing data...")),
              );
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Text(
                  "CMM 2.0",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            _drawerItem(context, Icons.assignment, "Van Audit"),
            _drawerItem(context, Icons.article, "Protocol Sheet"),
            _drawerItem(context, Icons.history, "History"),
            _drawerItem(context, Icons.download, "APK Download"),
            _drawerItem(context, Icons.map, "Tapogaman"),
            const Divider(),
            _drawerItem(context, Icons.logout, "Logout", logout: true),
          ],
        ),
      ),
      body: const Center(
        child: Text("Welcome to Dashboard!"),
      ),
    );
  }


  ListTile _drawerItem(BuildContext context, IconData icon, String title,
      {bool logout = false}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        if (logout) {
          Navigator.pushReplacementNamed(context, '/login_bloc');
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("$title clicked")));
        }
      },
    );
  }
}