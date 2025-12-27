import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/assignment_model.dart';

class AssignmentsView extends StatelessWidget {
  const AssignmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy Data
    final List<AssignmentModel> assignments = [
      AssignmentModel(
        id: '1',
        title: 'Tugas Kalkulus II',
        type: AssignmentType.tugas,
        deadline: DateTime.now().add(const Duration(days: 2)),
        courseName: 'Matematika Dasar',
      ),
      AssignmentModel(
        id: '2',
        title: 'Kuis Struktur Data',
        type: AssignmentType.kuis,
        deadline: DateTime.now().add(const Duration(hours: 5)),
        courseName: 'Algoritma & Pemrograman',
      ),
      AssignmentModel(
        id: '3',
        title: 'Laporan Praktikum Fisika',
        type: AssignmentType.tugas,
        deadline: DateTime.now().add(const Duration(days: 5)),
        courseName: 'Fisika Dasar',
      ),
      AssignmentModel(
        id: '4',
        title: 'Ujian Tengah Semester',
        type: AssignmentType.kuis,
        deadline: DateTime.now().add(const Duration(days: 7)),
        courseName: 'Bahasa Indonesia',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Tugas & Kuis'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: assignments.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = assignments[index];
          return _buildAssignmentCard(item);
        },
      ),
    );
  }

  Widget _buildAssignmentCard(AssignmentModel item) {
    // Calculate days remaining
    final daysLeft = item.deadline.difference(DateTime.now()).inDays;
    final hoursLeft = item.deadline.difference(DateTime.now()).inHours;
    
    String timeRemaining;
    Color timeColor;
    
    if (daysLeft > 0) {
      timeRemaining = '$daysLeft hari lagi';
      timeColor = Colors.grey.shade600;
    } else if (hoursLeft > 0) {
      timeRemaining = '$hoursLeft jam lagi';
      timeColor = Colors.orange;
    } else {
      timeRemaining = 'Terlambat';
      timeColor = Colors.red;
    }

    IconData icon;
    Color iconColor;
    String typeLabel;

    if (item.type == AssignmentType.tugas) {
      icon = Icons.assignment;
      iconColor = Colors.orange;
      typeLabel = 'Tugas';
    } else {
      icon = Icons.timer;
      iconColor = Colors.purple;
      typeLabel = 'Kuis';
    }

    return Card(
      elevation: 0,
       shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          typeLabel,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        timeRemaining,
                        style: TextStyle(
                          fontSize: 12,
                          color: timeColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.courseName,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Deadline: ${DateFormat('EEE, d MMM y, HH:mm').format(item.deadline)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
