import 'package:flutter/material.dart';
import '../routes.dart';

class HomeScreen extends StatelessWidget {
  final List<String> items = ["Profile", "Orders", "Settings", "Logout"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(20),
        itemCount: items.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.circle, color: Colors.blue),
            title: Text(items[index],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            onTap: () {
              if (items[index] == "Logout") {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.login, (route) => false);
              }
            },
          );
        },
      ),
    );
  }
}
