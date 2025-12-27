class AnnouncementModel {
  final String id;
  final String title;
  final String content;
  final DateTime date;
  final String author;
  final bool isRead;

  AnnouncementModel({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.author,
    this.isRead = false,
  });
}
