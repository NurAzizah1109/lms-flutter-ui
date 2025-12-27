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
        description: 'Materi ini mencakup konsep dasar statistika, termasuk pengertian, sejarah, dan aplikasinya dalam berbagai bidang. Anda akan mempelajari perbedaan antara statistika deskriptif dan inferensial.',
        type: ClassMaterialType.material,
        isCompleted: true,
      ),
       ClassMaterialModel(
        id: '2',
        title: 'Konsep Probabilitas',
        description: 'Pelajari dasar-dasar teori peluang yang menjadi landasan statistika. Video ini menjelaskan konsep ruang sampel, kejadian, dan aksioma probabilitas.',
        type: ClassMaterialType.video,
        isCompleted: true,
        videoUrl: 'https://example.com/video1',
      ),
      ClassMaterialModel(
        id: '3',
        title: 'Distribusi Frekuensi',
        description: 'Memahami cara mengorganisir data mentah ke dalam tabel distribusi frekuensi. Materi ini juga dilengkapi dengan tugas untuk membuat histogram dari data yang diberikan.',
        type: ClassMaterialType.material,
        isCompleted: false,
        assignmentId: 'assign-001',
      ),
      ClassMaterialModel(
        id: '4',
        title: 'Studi Kasus: Analisis Data Sensus',
        description: 'Analisis mendalam mengenai data sensus penduduk menggunakan teknik statistika yang telah dipelajari. Silakan baca studi kasus ini sebagai bahan materi lanjutan.',
        type: ClassMaterialType.advancedValue,
        isCompleted: false,
      ),
       ClassMaterialModel(
        id: '5',
        title: 'Tutorial SPSS Dasar',
        description: 'Video tutorial praktis penggunaan software SPSS untuk analisis data dasar. Di akhir sesi, Anda diminta mengikuti kuis singkat untuk menguji pemahaman.',
        type: ClassMaterialType.video,
        isCompleted: false,
        videoUrl: 'https://example.com/video-spss',
        quizId: 'quiz-001',
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
            _buildMaterialsSection(context, materials),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // ... (Header, Info, Description, Progress Sections remain same)

  Widget _buildMaterialsSection(BuildContext context, List<ClassMaterialModel> materials) {
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
            return _buildMaterialItem(context, material);
          },
        ),
      ],
    );
  }

  Widget _buildMaterialItem(BuildContext context, ClassMaterialModel material) {
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
        onTap: () {
          Navigator.pushNamed(
            context,
            '/material-detail',
            arguments: material,
          );
        },
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
