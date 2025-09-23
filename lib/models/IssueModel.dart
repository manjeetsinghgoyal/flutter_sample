class Issue {
  final int id;
  final String title;
  final String body;
  final String userName;
  final String userAvatar;

  Issue({
    required this.id,
    required this.title,
    required this.body,
    required this.userName,
    required this.userAvatar,
  });

  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue(
      id: json['id'],
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      userName: json['user']?['login'] ?? '',
      userAvatar: json['user']?['avatar_url'] ?? '',
    );
  }
}
