import '../models/class_model.dart';

class ClassController {
  List<ClassModel> getClasses() {
    return [
      ClassModel(
        id: '1',
        name: 'Mobile Programming',
        code: 'CS301',
        instructor: 'Dr. Smith',
        schedule: 'Mon, Wed 10:00 AM',
        description: 'Learn the fundamentals of mobile app development using Flutter.',
        progress: 0.75,
      ),
      ClassModel(
        id: '2',
        name: 'Web Development',
        code: 'CS302',
        instructor: 'Prof. Johnson',
        schedule: 'Tue, Thu 2:00 PM',
        description: 'Master modern web technologies including HTML5, CSS3, and JavaScript.',
        progress: 0.45,
      ),
      ClassModel(
        id: '3',
        name: 'Data Structures',
        code: 'CS201',
        instructor: 'Dr. Brown',
        schedule: 'Fri 9:00 AM',
        description: 'Deep dive into algorithmic efficiency and data organization.',
        progress: 0.90,
      ),
       ClassModel(
        id: '4',
        name: 'Database Systems',
        code: 'CS305',
        instructor: 'Prof. Davis',
        schedule: 'Mon, Wed 1:00 PM',
        description: 'Introduction to relational and NoSQL databases.',
        progress: 0.20,
      ),
    ];
  }
}
