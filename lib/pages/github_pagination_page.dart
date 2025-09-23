import 'package:flutter/material.dart';
import '../models/issue.dart';
import '../services/github_service.dart';

class GithubPaginationPage extends StatefulWidget {
  const GithubPaginationPage({super.key});

  @override
  State<GithubPaginationPage> createState() => _GithubPaginationPageState();
}

class _GithubPaginationPageState extends State<GithubPaginationPage> {
  final GitHubService _service = GitHubService();
  List<Issue> issues = [];
  int currentPage = 1;
  bool isLoading = false;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    _loadIssues();
  }

  Future<void> _loadIssues() async {
    if (isLoading || !hasMore) return;

    setState(() => isLoading = true);

    try {
      final newIssues = await _service.fetchIssues(currentPage);
      setState(() {
        issues.addAll(newIssues);
        currentPage++;
        if (newIssues.isEmpty) {
          hasMore = false;
        }
      });
    } catch (e) {
      debugPrint("Error: $e");
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GitHub Issues Pagination")),
      body: ListView.builder(
        itemCount: issues.length + 1,
        itemBuilder: (context, index) {
          if (index == issues.length) {
            if (hasMore) {
              _loadIssues();
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: Text("No more issues")),
              );
            }
          }

          final issue = issues[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor:
              issue.state == "open" ? Colors.green : Colors.red,
              child: Text("#${issue.number}"),
            ),
            title: Text(issue.title),
            subtitle: Text("State: ${issue.state}"),
          );
        },
      ),
    );
  }
}
