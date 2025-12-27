import '../models/notification_model.dart';

class NotificationController {
  List<NotificationModel> getNotifications() {
    return [
      NotificationModel(
        id: '1',
        title: 'Tugas Matematika Diskrit',
        content: 'Kerjakan soal halaman 120-125. Deadline besok jam 23:59.',
        date: DateTime.now().subtract(const Duration(hours: 1)),
        type: NotificationType.tugas,
        isRead: false,
      ),
      NotificationModel(
        id: '2',
        title: 'Kuis Pemrograman Dasar',
        content: 'Persiapkan diri untuk kuis dadakan materi Loop dan Function.',
        date: DateTime.now().subtract(const Duration(hours: 5)),
        type: NotificationType.kuis,
        isRead: false,
      ),
      NotificationModel(
        id: '3',
        title: 'Pengumuman Libur Nasional',
        content: 'Kampus akan diliburkan pada tanggal 17 Agustus memperingati hari kemerdekaan.',
        date: DateTime.now().subtract(const Duration(days: 1)),
        type: NotificationType.pengumuman,
        isRead: true,
      ),
      NotificationModel(
        id: '4',
        title: 'Tugas Besar Basis Data',
        content: 'Kumpulkan proposal proyek akhir paling lambat minggu depan.',
        date: DateTime.now().subtract(const Duration(days: 2)),
        type: NotificationType.tugas,
        isRead: true,
      ),
       NotificationModel(
        id: '5',
        title: 'Kuis Algoritma',
        content: 'Nilai kuis 1 sudah keluar, silakan cek di portal akademik.',
        date: DateTime.now().subtract(const Duration(days: 3)),
        type: NotificationType.kuis,
        isRead: true,
      ),
    ];
  }
}
