import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/assignment_model.dart';

class AssignmentDetailView extends StatefulWidget {
  const AssignmentDetailView({super.key});

  @override
  State<AssignmentDetailView> createState() => _AssignmentDetailViewState();
}

class _AssignmentDetailViewState extends State<AssignmentDetailView> {
  bool _isSubmitted = false;
  bool _isUploading = false;
  String? _submittedFileName;
  DateTime? _submissionDate;

  import 'dart:math';

  void _handleSubmission() async {
    final assignment = ModalRoute.of(context)!.settings.arguments as AssignmentModel;

    if (_isSubmitted && assignment.type == AssignmentType.kuis) {
      // If already submitted and is quiz, show result
      Navigator.pushNamed(
        context, 
        '/quiz-result',
        arguments: {
          'score': 85, // Dummy static score or random
          'assignment': assignment,
        }
      );
      return;
    }

    setState(() {
      _isUploading = true;
    });

    // Simulate network delay / Quiz duration
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _isUploading = false;
        _isSubmitted = true;
        _submittedFileName = assignment.type == AssignmentType.tugas
            ? 'tugas_${DateTime.now().millisecondsSinceEpoch}.pdf'
            : null;
        _submissionDate = DateTime.now();
      });

      if (assignment.type == AssignmentType.kuis) {
         Navigator.pushNamed(
          context, 
          '/quiz-result',
          arguments: {
            'score': Random().nextInt(30) + 70, // Random score 70-100
            'assignment': assignment,
          }
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tugas berhasil diupload!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  String _getButtonLabel(AssignmentType type) {
    if (_isUploading) return 'Memproses...';
    if (_isSubmitted) {
      return type == AssignmentType.tugas ? 'Ganti File' : 'Lihat Hasil Kuis';
    }
    return type == AssignmentType.tugas ? 'Upload Tugas' : 'Mulai Kuis';
  }

  IconData _getIcon(AssignmentType type) {
    if (_isSubmitted) {
      return type == AssignmentType.tugas ? Icons.edit : Icons.bar_chart;
    }
    return type == AssignmentType.tugas ? Icons.upload_file : Icons.play_arrow;
  }

  Color _getButtonColor(AssignmentType type) {
    if (_isSubmitted && type == AssignmentType.kuis) return Colors.green;
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    final assignment = ModalRoute.of(context)!.settings.arguments as AssignmentModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(assignment),
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
              assignment.description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 32),
            _buildSubmissionSection(assignment),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(AssignmentModel assignment) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                assignment.type == AssignmentType.tugas ? Icons.assignment : Icons.timer,
                color: Colors.blue,
                size: 32,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      assignment.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      assignment.courseName,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildDeadlineRow(assignment.deadline),
        ],
      ),
    );
  }

  Widget _buildDeadlineRow(DateTime deadline) {
    final daysLeft = deadline.difference(DateTime.now()).inDays;
    Color color = daysLeft > 0 ? Colors.black : Colors.red;

    return Row(
      children: [
        const Icon(Icons.access_time, size: 20, color: Colors.grey),
        const SizedBox(width: 8),
        Text(
          'Deadline: ${DateFormat('EEE, d MMM y, HH:mm').format(deadline)}',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildSubmissionSection(AssignmentModel assignment) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Status Pengumpulan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _isSubmitted ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _isSubmitted ? 'Dikumpulkan' : 'Belum dikumpulkan',
                  style: TextStyle(
                    color: _isSubmitted ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_isSubmitted) ...[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.description, color: Colors.blue),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _submittedFileName ?? 'file.pdf',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Dikumpulkan pada ${DateFormat('d MMM, HH:mm').format(_submissionDate!)}',
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.check_circle, color: Colors.green),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _isUploading ? null : _uploadFile,
              icon: _isUploading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Icon(_isSubmitted ? Icons.edit : Icons.upload_file),
              label: Text(_isUploading
                  ? 'Mengupload...'
                  : _isSubmitted
                      ? 'Ganti File'
                      : 'Upload Tugas'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
