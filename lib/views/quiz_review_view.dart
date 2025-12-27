import 'package:flutter/material.dart';
import '../models/assignment_model.dart';
// ignore: unused_import
import 'quiz_result_view.dart';

class QuizReviewView extends StatelessWidget {
  const QuizReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final assignment = ModalRoute.of(context)!.settings.arguments as AssignmentModel;

    // Dummy Questions Data
    final questions = [
      {
        'question': 'Apa kompleksitas waktu dari algoritma Binary Search?',
        'yourAnswer': 'O(log n)',
        'correctAnswer': 'O(log n)',
        'isCorrect': true,
      },
      {
        'question': 'Struktur data mana yang menggunakan prinsip LIFO?',
        'yourAnswer': 'Queue',
        'correctAnswer': 'Stack',
        'isCorrect': false,
      },
      {
        'question': 'Manakah yang bukan merupakan tipe data primitif di Java?',
        'yourAnswer': 'String',
        'correctAnswer': 'String',
        'isCorrect': true,
      },
      {
        'question': 'Apa kepanjangan dari OOP?',
        'yourAnswer': 'Object Oriented Programming',
        'correctAnswer': 'Object Oriented Programming',
        'isCorrect': true,
      },
      {
        'question': 'Metode sorting mana yang paling efisien untuk data yang sudah hampir terurut?',
        'yourAnswer': 'Quick Sort',
        'correctAnswer': 'Insertion Sort',
        'isCorrect': false,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Jawaban'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: questions.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final q = questions[index];
          final isCorrect = q['isCorrect'] as bool;

          return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.shade50,
                        ),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          q['question'] as String,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(
                        isCorrect ? Icons.check_circle : Icons.cancel,
                        color: isCorrect ? Colors.green : Colors.red,
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  _buildAnswerRow('Jawaban Kamu:', q['yourAnswer'] as String, isCorrect ? Colors.green : Colors.red),
                  if (!isCorrect) ...[
                    const SizedBox(height: 8),
                    _buildAnswerRow('Jawaban Benar:', q['correctAnswer'] as String, Colors.green),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnswerRow(String label, String answer, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ),
        Expanded(
          child: Text(
            answer,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
