import 'package:flutter/material.dart';
import '../controllers/class_controller.dart';
import '../models/class_model.dart';
// Ensure this import is correct based on how we will navigate. 
// If using named routes with arguments, we might navigate differently.
// For now, I will use Navigator.push directly or named route with arguments.
import '../models/class_model.dart';

class ClassesView extends StatelessWidget {
  const ClassesView({super.key});

  @override
  Widget build(BuildContext context) {
    final ClassController controller = ClassController();
    final List<ClassModel> classes = controller.getClasses();

    return Scaffold(
      appBar: AppBar(title: const Text('My Classes')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: classes.length,
        itemBuilder: (context, index) {
          final clazz = classes[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              onTap: () {
                // Navigate to detail view
                Navigator.pushNamed(
                  context, 
                  '/class-detail',
                  arguments: clazz,
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          clazz.code.substring(0, min(3, clazz.code.length)), // Safe substring
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            clazz.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            clazz.instructor,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                           LinearProgressIndicator(
                            value: clazz.progress,
                            backgroundColor: Colors.grey[200],
                            minHeight: 4,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  int min(int a, int b) => a < b ? a : b;
}
