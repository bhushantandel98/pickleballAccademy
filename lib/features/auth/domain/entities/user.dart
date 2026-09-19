class User {
  final String id;
  final String name;
  final String deviceToken;
  final String attendanceType;
  final String timeInDescription;

  const User({
    required this.id,
    required this.name,
    required this.deviceToken,
    required this.attendanceType,
    required this.timeInDescription,
  });
}
