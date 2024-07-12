import 'package:cloud_firestore/cloud_firestore.dart';
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

  factory ClassSchedule.fromJSON(Map<String, dynamic> json) {
    return ClassSchedule(
      courseTitle: json['course_title'],
      courseTecher: json['course_teacher'],
      date: (json['date'] as Timestamp).toDate(),
      time: (json['time'] as Timestamp).toDate(),
      courseCode: json['course_code'],
    );
  }

  toJSON() {
    return {
      'id': id,
      'course_title': courseTitle,
      'course_teacher': courseTecher,
      'date': date,
      'time': time,
      'course_code': courseCode,
    };
  }
}
