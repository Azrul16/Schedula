// ignore: constant_identifier_names
enum Semester { First, Second, Third, Fourth, Fifth, Sixth, Seventh, Eighth }

class UserModel {
  final String fname;
  final String lname;
  final String dept;
  final String id;
  final String reg;
  final String varsity;
  final String email;
  final Semester semister;
  final String phoneNumber;

  UserModel(
      {required this.lname,
      required this.dept,
      required this.id,
      required this.reg,
      required this.varsity,
      required this.fname,
      required this.semister,
      required this.email,
      required this.phoneNumber});

  // Convert a JSON object to an UserModel instance
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fname: json['fname'],
      lname: json['lname'],
      dept: json['dept'],
      varsity: json['varsity'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      semister: Semester.values.firstWhere(
        (e) => e.name == json['semister'],
      ),
      id: 'ID',
      reg: 'Registration',
    );
  }

  // Convert an UserModel instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'fname': fname,
      'lname': lname,
      'dept': dept,
      'ID': id,
      'Registration': reg,
      'varsity': varsity,
      'email': email,
      'semister': semister.name,
      'phoneNumber': phoneNumber,
    };
  }
}
