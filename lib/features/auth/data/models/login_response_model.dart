class LoginResponseModel {
  final bool success;
  final String message;
  final LoginDataModel data;
  final DateTime timestamp;

  LoginResponseModel({
    required this.success,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: LoginDataModel.fromJson(json['data'] ?? {}),
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

class LoginDataModel {
  final String token;
  final String username;
  final String employeeId;
  final String fullName;
  final String role;
  final bool firstLogin;
  final LocationModel location;

  final String? timeIn;
  final String? timeOut;
  final double? totalHours;
  final String? attendanceType;
  final String? timeInDescription;
  final String? timeOutDescription;

  LoginDataModel({
    required this.token,
    required this.username,
    required this.employeeId,
    required this.fullName,
    required this.role,
    required this.firstLogin,
    required this.location,
    this.timeIn,
    this.timeOut,
    this.totalHours,
    this.attendanceType,
    this.timeInDescription,
    this.timeOutDescription,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) {
    return LoginDataModel(
      token: json['token'] ?? '',
      username: json['username'] ?? '',
      employeeId: json['employeeId'] ?? '',
      fullName: json['fullName'] ?? '',
      role: json['role'] ?? '',
      firstLogin: json['firstLogin'] ?? false,
      location: LocationModel.fromJson(
        json['location'] ?? {},
      ),
      timeIn: json['timeIn'],
      timeOut: json['timeOut'],
      totalHours: json['totalHours'] != null
          ? (json['totalHours'] as num).toDouble()
          : null,
      attendanceType: json['attendanceType'],
      timeInDescription: json['timeInDescription'],
      timeOutDescription: json['timeOutDescription'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'username': username,
      'employeeId': employeeId,
      'fullName': fullName,
      'role': role,
      'firstLogin': firstLogin,
      'location': location.toJson(),
      'timeIn': timeIn,
      'timeOut': timeOut,
      'totalHours': totalHours,
      'attendanceType': attendanceType,
      'timeInDescription': timeInDescription,
      'timeOutDescription': timeOutDescription,
    };
  }
}

class LocationModel {
  final int id;
  final String locationId;
  final String clientName;
  final String locationName;
  final String address;
  final double latitude;
  final double longitude;
  final double allowedRadius;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  LocationModel({
    required this.id,
    required this.locationId,
    required this.clientName,
    required this.locationName,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.allowedRadius,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'] ?? 0,
      locationId: json['locationId'] ?? '',
      clientName: json['clientName'] ?? '',
      locationName: json['locationName'] ?? '',
      address: json['address'] ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      allowedRadius: (json['allowedRadius'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'locationId': locationId,
      'clientName': clientName,
      'locationName': locationName,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'allowedRadius': allowedRadius,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
