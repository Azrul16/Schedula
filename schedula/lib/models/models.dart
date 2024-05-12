import 'package:uuid/uuid.dart';

const uuid = Uuid();

// ignore: camel_case_types, constant_identifier_names
enum Category { Sobuj_sir, Chinmoy_sir, Mahabub_sir }

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
  final Category courseTecher;
  final DateTime date;
  final DateTime time;
}
