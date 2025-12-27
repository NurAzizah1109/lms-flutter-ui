import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/notification_model.dart';
import '../controllers/notification_controller.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NotificationController();
    final notifications = controller.getNotifications();

    return Scaffold(
      appBar: AppBar(title: const Text('Notifikasi')),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            onTap: () {
              // Future: Navigate to specific detail based on type
              // For now just show a snackbar or no-op
            },
            leading: _buildIcon(notification.type, notification.isRead),
            title: Text(
              notification.title,
              style: TextStyle(
                fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  notification.content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  DateFormat('MMM d, h:mm a').format(notification.date),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            trailing: notification.isRead
                ? null
                : Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildIcon(NotificationType type, bool isRead) {
    IconData iconData;
    Color color;
    Color backgroundColor;

    switch (type) {
      case NotificationType.tugas:
        iconData = Icons.assignment;
        color = Colors.orange;
        backgroundColor = Colors.orange.shade100;
        break;
      case NotificationType.kuis:
        iconData = Icons.quiz;
        color = Colors.purple;
        backgroundColor = Colors.purple.shade100;
        break;
      case NotificationType.pengumuman:
        iconData = Icons.campaign; // Or Icons.notifications
        color = Colors.blue;
        backgroundColor = Colors.blue.shade100;
        break;
    }

    if (isRead) {
      color = Colors.grey;
      backgroundColor = Colors.grey.shade200;
    }

    return CircleAvatar(
      backgroundColor: backgroundColor,
      child: Icon(
        iconData,
        color: color,
      ),
    );
  }
}
