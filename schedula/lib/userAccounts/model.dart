// ignore: constant_identifier_names
enum Semester { First, Second, Third, Fourth, Fifth, Sixth, Seventh, Eighth }

class Accounts {
  final String fname;
  final String lname;
  final String Dept;
  final String varsity;
  final Semester semister;

  Accounts({
    required this.lname,
    required this.Dept,
    required this.varsity,
    required this.fname,
    required this.semister,
  });
}
