import 'package:flutter/material.dart';
import '../models/class_model.dart';
import '../models/class_material_model.dart';

class ClassDetailView extends StatelessWidget {
  const ClassDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final classModel = ModalRoute.of(context)!.settings.arguments as ClassModel;
    
    // Dummy Data for Materials
    final List<ClassMaterialModel> materials = [
      ClassMaterialModel(
        id: '1',
        title: 'Pengenalan Statistika',
        type: ClassMaterialType.material,
        isCompleted: true,
      ),
       ClassMaterialModel(
        id: '2',
        title: 'Konsep Probabilitas',
        type: ClassMaterialType.video,
        isCompleted: true,
      ),
      ClassMaterialModel(
        id: '3',
        title: 'Distribusi Frekuensi',
        type: ClassMaterialType.material,
        isCompleted: false,
      ),
      ClassMaterialModel(
        id: '4',
        title: 'Studi Kasus: Analisis Data Sensus',
        type: ClassMaterialType.advancedValue,
        isCompleted: false,
      ),
       ClassMaterialModel(
        id: '5',
        title: 'Tutorial SPSS Dasar',
        type: ClassMaterialType.video,
        isCompleted: false,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(classModel.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(classModel),
            const SizedBox(height: 24),
            _buildInfoSection(classModel),
            const SizedBox(height: 24),
            _buildDescriptionSection(classModel),
            const SizedBox(height: 24),
            _buildProgressSection(classModel),
            const SizedBox(height: 24),
            _buildMaterialsSection(materials),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ClassModel classModel) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue,
            child: Text(
              classModel.code.substring(0, 2),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            classModel.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            classModel.code,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(ClassModel classModel) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoRow(Icons.person, 'Instructor', classModel.instructor),
            const Divider(height: 24),
            _buildInfoRow(Icons.access_time, 'Schedule', classModel.schedule),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue, size: 28),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDescriptionSection(ClassModel classModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About this Class',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          classModel.description,
          style: TextStyle(
            fontSize: 14,
            height: 1.5,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressSection(ClassModel classModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Progress',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${(classModel.progress * 100).toInt()}%',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        LinearProgressIndicator(
          value: classModel.progress,
          backgroundColor: Colors.grey[200],
          minHeight: 10,
          borderRadius: BorderRadius.circular(5),
        ),
      ],
    );
  }

  Widget _buildMaterialsSection(List<ClassMaterialModel> materials) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Course Materials',
           style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: materials.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final material = materials[index];
            return _buildMaterialItem(material);
          },
        ),
      ],
    );
  }

  Widget _buildMaterialItem(ClassMaterialModel material) {
    IconData icon;
    Color color;

    switch (material.type) {
      case ClassMaterialType.material:
        icon = Icons.description;
        color = Colors.blue;
        break;
      case ClassMaterialType.advancedValue:
        icon = Icons.library_books;
        color = Colors.deepPurple;
        break;
      case ClassMaterialType.video:
        icon = Icons.play_circle_fill;
        color = Colors.red;
        break;
    }

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          material.title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          _getMaterialTypeLabel(material.type),
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        trailing: material.isCompleted
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.circle_outlined, color: Colors.grey),
        onTap: () {},
      ),
    );
  }

  String _getMaterialTypeLabel(ClassMaterialType type) {
    switch (type) {
      case ClassMaterialType.material:
        return 'Materi';
      case ClassMaterialType.advancedValue:
        return 'Materi Lanjutan';
      case ClassMaterialType.video:
        return 'Video';
    }
  }
}
