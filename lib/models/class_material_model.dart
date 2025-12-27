enum ClassMaterialType {
  material,
  advancedValue, // video pembelajaran or materi lanjutan
  video,
}

class ClassMaterialModel {
  final String id;
  final String title;
  final String description; // New field
  final ClassMaterialType type;
  final bool isCompleted;
  final String? videoUrl; // New field
  final String? assignmentId; // New field
  final String? quizId; // New field

  ClassMaterialModel({
    required this.id,
    required this.title,
    required this.description, // Required
    required this.type,
    this.isCompleted = false,
    this.videoUrl,
    this.assignmentId,
    this.quizId,
  });
}
