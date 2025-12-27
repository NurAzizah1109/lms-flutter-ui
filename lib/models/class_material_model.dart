enum ClassMaterialType {
  material,
  advancedValue, // video pembelajaran or materi lanjutan
  video,
}

class ClassMaterialModel {
  final String id;
  final String title;
  final ClassMaterialType type;
  final bool isCompleted;

  ClassMaterialModel({
    required this.id,
    required this.title,
    required this.type,
    this.isCompleted = false,
  });
}
