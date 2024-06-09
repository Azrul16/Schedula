import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ClassSchedule {
  ClassSchedule({
    required this.courseTitle,
    required this.courseTecher,
    required this.date,
    required this.time,
    required this.courseCode,
  }) : id = uuid.v4();

  final String id;
  final String courseTitle;
  final String courseCode;
  final String courseTecher;
  final DateTime date;
  final DateTime time;
}
