import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ClassSchedule {
  ClassSchedule(
    this.pdf, {
    required this.courseTitle,
    required this.courseTecher,
    required this.brief,
  }) : id = uuid.v4();

  final String id;
  final String courseTitle;
  final String brief;
  final String courseTecher;
  final File pdf;
}
