import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/theme/app_text_styles.dart';
import '../../../../common/widgets/app_dialog.dart';
import '../../../../core/di/injection.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == AuthStatus.success) {
              AppDialog.show(
                context: context,
                title: 'Login Successful',
                message:
                    'Welcome ${state.user?.name.isNotEmpty == true ? state.user?.name : 'User'}',
              );
            }

            if (state.status == AuthStatus.failure) {
              AppDialog.show(
                context: context,
                title: 'Login Failed',
                message: state.errorMessage ?? 'Unable to login',
              );
            }
          },
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Text('Welcome Back', style: AppTextStyles.title),
                    SizedBox(height: 8),
                    Text(
                      'Login to continue',
                      style: AppTextStyles.subtitle,
                    ),
                    SizedBox(height: 32),
                    LoginForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
