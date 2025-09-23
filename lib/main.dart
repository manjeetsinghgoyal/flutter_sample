import 'package:flutter/material.dart';
import 'pages/issue_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub Pagination Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: IssueListPage(),
    );
  }
}
