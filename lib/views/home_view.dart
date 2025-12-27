import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header Section
              _buildHeader(),
              const SizedBox(height: 24),

              // 2. Shortcuts Section
              _buildShortcuts(context),
              const SizedBox(height: 24),

              // 3. Course Summary Section
              _buildSectionTitle('Your Courses', 'See All'),
              const SizedBox(height: 12),
              _buildCourseList(),
              const SizedBox(height: 24),

              // 4. Announcements Section
              _buildSectionTitle('Announcements', null),
              const SizedBox(height: 12),
              _buildAnnouncements(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hi, John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Welcome back to CeLoe LMS',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.person, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildShortcuts(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildShortcutItem(Icons.book, 'Classes', Colors.orange, () {
           // Basic navigation logic could be added here if needed, but Classes is in bottom nav usually
        }),
        _buildShortcutItem(Icons.assignment, 'Tasks', Colors.green, () {
           Navigator.pushNamed(context, '/assignments');
        }),
        _buildShortcutItem(Icons.notifications, 'Notice', Colors.red, () {
           // Notifies usually in bottom nav, but could nav there too
        }),
        _buildShortcutItem(Icons.calendar_today, 'Schedule', Colors.purple, () {}),
      ],
    );
  }

  Widget _buildShortcutItem(IconData icon, String label, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, String? actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (actionText != null)
          TextButton(
            onPressed: () {},
            child: Text(actionText),
          ),
      ],
    );
  }

  Widget _buildCourseList() {
    return SizedBox(
      height: 180, // Fixed height for horizontal list
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CourseCard(
            title: 'Flutter Basics',
            progress: 0.75,
            color: Colors.blue,
          ),
          SizedBox(width: 16),
          CourseCard(
            title: 'UI/UX Design',
            progress: 0.45,
            color: Colors.pink,
          ),
          SizedBox(width: 16),
          CourseCard(
            title: 'Dart Advanced',
            progress: 0.90,
            color: Colors.teal,
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncements() {
    return Column(
      children: const [
        AnnouncementCard(
          title: 'Exam Schedule Update',
          date: '2 hours ago',
          content: 'The final exam for Flutter Basics has been rescheduled.',
        ),
        SizedBox(height: 12),
        AnnouncementCard(
          title: 'New Course Available',
          date: 'Yesterday',
          content: 'Check out the new Advanced Dart course in the catalog.',
        ),
      ],
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final double progress;
  final Color color;

  const CourseCard({
    super.key,
    required this.title,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Ongoing',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              const Icon(Icons.more_horiz, color: Colors.white),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.white.withOpacity(0.3),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                '${(progress * 100).toInt()}% Completed',
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String date;
  final String content;

  const AnnouncementCard({
    super.key,
    required this.title,
    required this.date,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
