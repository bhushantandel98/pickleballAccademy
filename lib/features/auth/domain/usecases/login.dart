import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<User> call({
    required String username,
    required String password,
    required String deviceId,
    required String deviceModel,
    required String operatingSystem,
  }) {
    return repository.login(
      username: username,
      password: password,
      deviceId: deviceId,
      deviceModel: deviceModel,
      operatingSystem: operatingSystem,
    );
  }
}
