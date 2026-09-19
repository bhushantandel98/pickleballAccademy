import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/dio_client.dart';
import '../models/login_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login({
    required String deviceId,
    required String deviceModel,
    required String operatingSystem,
    required String username,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl(this.dioClient);

  @override
  Future<LoginResponseModel> login({
    required String deviceId,
    required String deviceModel,
    required String operatingSystem,
    required String username,
    required String password,
  }) async {
    try {
      final response = await dioClient.dio.post(
        ApiConstants.login,
        data: {
          "username": username,
          "password": password,
          "deviceId": deviceId,
          "deviceModel": deviceModel,
          "operatingSystem": operatingSystem
        },
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return LoginResponseModel.fromJson(
          Map<String, dynamic>.from(response.data as Map),
        );
      }

      throw ServerException(
        message: 'Login failed',
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final data = e.response?.data;
      String message = 'Something went wrong';

      if (data is Map && data['message'] != null) {
        message = data['message'].toString();
      } else if (e.message != null) {
        message = e.message!;
      }

      if (statusCode != null) {
        throw ServerException(message: message, statusCode: statusCode);
      }

      throw NetworkException(message: message);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
