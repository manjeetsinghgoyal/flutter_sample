class Customer {
  final String userId;
  final String role;
  final String apkVersion;

  Customer({
    required this.userId,
    required this.role,
    required this.apkVersion,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      userId: json['userId'] ?? '',
      role: json['role'] ?? '',
      apkVersion: json['APK_VERSION'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "role": role,
      "APK_VERSION": apkVersion,
    };
  }
}
