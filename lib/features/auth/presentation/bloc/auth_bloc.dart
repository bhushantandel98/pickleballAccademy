import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failures.dart';
import '../../domain/usecases/login.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;

  AuthBloc(this.login) : super(const AuthState()) {
    on<LoginRequested>(_onLoginRequested);
    on<AuthReset>(_onAuthReset);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
      status: AuthStatus.loading,
      clearError: true,
    ));

    try {
      final user = await login(
        username: event.username,
        deviceId: event.deviceId,
        deviceModel: event.deviceModel,
        operatingSystem: event.operatingSystem,
        password: event.password,
      );

      emit(state.copyWith(
        status: AuthStatus.success,
        user: user,
        clearError: true,
      ));
    } on Failure catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onAuthReset(
    AuthReset event,
    Emitter<AuthState> emit,
  ) {
    emit(const AuthState());
  }
}
