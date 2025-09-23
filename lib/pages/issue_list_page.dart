import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_pagination_demo/models/IssueModel.dart';

class IssueListPage extends StatefulWidget {
  @override
  _IssueListPageState createState() => _IssueListPageState();
}

class _IssueListPageState extends State<IssueListPage> {
  List<Issue> allIssues = [];
  List<Issue> displayedIssues = [];
  int currentPage = 1;
  final int perPage = 10;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    loadIssues();
  }

  Future<void> loadIssues() async {
    final String response = await rootBundle.loadString('assets/issues.json');
    final data = json.decode(response) as List;
    allIssues = data.map((json) => Issue.fromJson(json)).toList();
    loadNextPage();
  }

  void loadNextPage() {
    if (isLoadingMore) return;

    setState(() {
      isLoadingMore = true;
    });

    Future.delayed(Duration(seconds: 1), () {
      int start = (currentPage - 1) * perPage;
      int end = start + perPage;

      if (start < allIssues.length) {
        setState(() {
          displayedIssues.addAll(allIssues.sublist(
            start,
            end > allIssues.length ? allIssues.length : end,
          ));
          currentPage++;
          isLoadingMore = false;
        });
      } else {
        setState(() {
          isLoadingMore = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GitHub Issues (Local JSON)")),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!isLoadingMore &&
              scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {
            loadNextPage();
          }
          return true;
        },
        child: ListView.builder(
          itemCount: displayedIssues.length + (isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == displayedIssues.length) {
              return Center(child: CircularProgressIndicator());
            }
            final issue = displayedIssues[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(issue.userAvatar),
              ),
              title: Text(issue.title),
              subtitle: Text(issue.body),
            );
          },
        ),
      ),
    );
  }
}
