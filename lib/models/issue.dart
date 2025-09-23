class Issue {
  final int number;
  final String title;
  final String state;

  Issue({
    required this.number,
    required this.title,
    required this.state,
  });

  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue(
      number: json['number'],
      title: json['title'] ?? "No Title",
      state: json['state'] ?? "unknown",
    );
  }
}
