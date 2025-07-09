class Material {
  final String id;
  final String title;
  final String filePath;
  final String type; // 'pdf' or 'video'
  final String? uploadedBy;

  Material({
    required this.id,
    required this.title,
    required this.filePath,
    required this.type,
    this.uploadedBy,
  });

  factory Material.fromJson(Map<String, dynamic> json) {
    return Material(
      id: json['id'],
      title: json['title'],
      filePath: json['filePath'],
      type: json['type'],
      uploadedBy: json['uploadedBy'],
    );
  }
}
