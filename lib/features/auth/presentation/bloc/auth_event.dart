import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginRequested extends AuthEvent {
  final String username;
  final String deviceId;
  final String deviceModel;
  final String operatingSystem;
  final String password;

  const LoginRequested({
    required this.username,
    required this.deviceId,
    required this.deviceModel,
    required this.operatingSystem,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [username, deviceId, deviceModel, operatingSystem, password];
}

class AuthReset extends AuthEvent {
  const AuthReset();
}
