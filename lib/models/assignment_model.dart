enum AssignmentType {
  tugas,
  kuis,
}

class AssignmentModel {
  final String id;
  final String title;
  final String description; // New field
  final AssignmentType type;
  final DateTime deadline;
  final String courseName;
  final bool isCompleted;

  AssignmentModel({
    required this.id,
    required this.title,
    required this.description, // Required
    required this.type,
    required this.deadline,
    required this.courseName,
    this.isCompleted = false,
  });
}
