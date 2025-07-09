class Project {
  final String id;
  final String title;
  final String description;
  final String? createdBy;
  final String? submissionUrl;
  final double? grade;

  Project({
    required this.id,
    required this.title,
    required this.description,
    this.createdBy,
    this.submissionUrl,
    this.grade,
  });
}
