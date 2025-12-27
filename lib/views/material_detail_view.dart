import 'package:flutter/material.dart';
import '../models/class_material_model.dart';

class MaterialDetailView extends StatelessWidget {
  const MaterialDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final material = ModalRoute.of(context)!.settings.arguments as ClassMaterialModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Materi'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              material.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _getMaterialTypeLabel(material.type),
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Deskripsi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              material.description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 32),
            if (material.videoUrl != null)
              _buildActionCard(
                context,
                icon: Icons.play_circle_fill,
                label: 'Tonton Video',
                color: Colors.red,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Opening Video Player...')),
                  );
                },
              ),
             if (material.assignmentId != null)
              _buildActionCard(
                context,
                icon: Icons.assignment,
                label: 'Kerjakan Tugas',
                color: Colors.orange,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Opening Assignment...')),
                  );
                },
              ),
             if (material.quizId != null)
              _buildActionCard(
                context,
                icon: Icons.quiz,
                label: 'Mulai Kuis',
                color: Colors.purple,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Opening Quiz...')),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(BuildContext context, {required IconData icon, required String label, required Color color, required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
       shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 32),
        ),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Text('Ketuk untuk membuka'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
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
