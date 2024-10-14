class Announcements {
  Announcements({
    required this.title,
    required this.description,
    required this.downloadURL,
  });

  final String title;
  final String downloadURL;
  final String description;

  // Convert a Announcements instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'downloadURL': downloadURL,
      'description': description,
    };
  }

  // Create a Announcements instance from a JSON map.
  factory Announcements.fromJSON(Map<String, dynamic> json) {
    return Announcements(
      title: json['title'],
      downloadURL: json['downloadURL'],
      description: json['description'],
    );
  }
}
