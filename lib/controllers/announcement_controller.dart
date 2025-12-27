import '../models/announcement_model.dart';

class AnnouncementController {
  List<AnnouncementModel> getAnnouncements() {
    return [
      AnnouncementModel(
        id: '1',
        title: 'Welcome to the new Semester!',
        content: 'We are excited to welcome you back for the new academic year. Please check your schedule and updated course materials.',
        date: DateTime.now().subtract(const Duration(hours: 2)),
        author: 'Admin',
        isRead: false,
      ),
      AnnouncementModel(
        id: '2',
        title: 'Maintenance Schedule',
        content: 'The LMS system will undergo maintenance this Sunday from 2 AM to 4 AM. Please save your work appropriately.',
        date: DateTime.now().subtract(const Duration(days: 1)),
        author: 'IT Support',
        isRead: true,
      ),
      AnnouncementModel(
        id: '3',
        title: 'Library Hours Update',
        content: 'The library will remain open until 10 PM during exam week starting next Monday.',
        date: DateTime.now().subtract(const Duration(days: 3)),
        author: 'Librarian',
        isRead: true,
      ),
       AnnouncementModel(
        id: '4',
        title: 'Guest Lecture: AI Trends',
        content: 'Join us for a special lecture on AI Trends by Dr. Alan Turing on Friday at the Main Hall.',
        date: DateTime.now().subtract(const Duration(days: 5)),
        author: 'Computer Science Dept',
        isRead: true,
      ),
    ];
  }
}
