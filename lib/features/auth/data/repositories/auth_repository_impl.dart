import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<User> login({
    required String username,
    required String deviceId,
    required String deviceModel,
    required String operatingSystem,
    required String password,
  }) async {
    try {
      if (!await networkInfo.isConnected) {
        throw const NetworkFailure('No internet connection');
      }

      final response = await remoteDataSource.login(
        deviceId: deviceId,
        deviceModel: deviceModel,
        operatingSystem: operatingSystem,
        username: username,
        password: password,
      );

      return User(
        id: response.data.employeeId,
        name: response.data.fullName,
        deviceToken: response.data.fullName,
        attendanceType: response.data.attendanceType ?? '',
        timeInDescription: response.data.timeInDescription ?? '',
      );
    } on NetworkException catch (e) {
      throw NetworkFailure(e.message);
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } on Failure {
      rethrow;
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
