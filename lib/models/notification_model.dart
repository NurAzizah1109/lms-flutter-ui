enum NotificationType {
  tugas,
  kuis,
  pengumuman,
}

class NotificationModel {
  final String id;
  final String title;
  final String content;
  final DateTime date;
  final NotificationType type;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.type,
    this.isRead = false,
  });
}
