class User {
  final String id;
  final String fullName;
  final String nimNidn;
  final String email;
  final String role;

  User({
    required this.id,
    required this.fullName,
    required this.nimNidn,
    required this.email,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['fullName'],
      nimNidn: json['nimNidn'],
      email: json['email'],
      role: json['role'],
    );
  }
}
