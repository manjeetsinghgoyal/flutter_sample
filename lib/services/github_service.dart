import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/issue.dart';

class GitHubService {
  static const String baseUrl =
      "https://api.github.com/repositories/1300192/issues";

  Future<List<Issue>> fetchIssues(int page, {int perPage = 10}) async {
    final url = Uri.parse("$baseUrl?page=$page&per_page=$perPage");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((json) => Issue.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load issues (Status: ${response.statusCode})");
    }
  }
}
