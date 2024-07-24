class ClassNotes {
  ClassNotes(
      {required this.courseTitle,
      required this.courseTecher,
      required this.downloadURL});

  final String courseTitle;
  final String downloadURL;
  final String courseTecher;

  // Convert a ClassNotes instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'courseTitle': courseTitle,
      'downloadURL': downloadURL,
      'courseTecher': courseTecher,
    };
  }

  // Create a ClassNotes instance from a JSON map.
  factory ClassNotes.fromJSON(Map<String, dynamic> json) {
    return ClassNotes(
      courseTitle: json['courseTitle'],
      downloadURL: json['downloadURL'],
      courseTecher: json['courseTecher'],
    );
  }
}
