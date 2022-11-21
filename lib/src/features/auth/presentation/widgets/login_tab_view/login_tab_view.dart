import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/constants/validation.dart';
import 'package:flutter_banking/src/core/widgets/app_text_form_field.dart';
import 'package:flutter_banking/src/features/auth/presentation/bloc/cubit/login_mode_cubit.dart';
import 'package:flutter_banking/src/features/auth/presentation/widgets/auth_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../models/login_model.dart';
import '../../../services/auth_service.dart';
import 'login_mode_selector.dart';

class LoginTabView extends StatefulWidget {
  const LoginTabView({super.key});

  @override
  State<LoginTabView> createState() => _LoginTabViewState();
}

class _LoginTabViewState extends State<LoginTabView> {
  final Map<String, dynamic> formData = {};

  final formKey = GlobalKey<FormState>();

  String loginLabelText(LoginModeState state) =>
      state is LoginPhoneMode ? 'Phone number' : 'IPN';

  void handleLogin(LoginModeState state) async {
    final formState = formKey.currentState;

    if (formState == null) {
      return;
    }
    if (!formState.validate()) return;
    formState.save();

    final loginModel = LoginModel.fromJson(formData);

    final authService = AuthService();
    final errorMessage = state is LoginPhoneMode
        ? await authService.loginWithPhone(loginModel)
        : await authService.loginWithIpn(loginModel);

    if (errorMessage != null) {
      Fluttertoast.showToast(msg: errorMessage);
      return;
    }

    if (!mounted) return;

    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: BlocProvider(
          create: (context) => LoginModeCubit(),
          child: BlocBuilder<LoginModeCubit, LoginModeState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AuthHeader(
                    title: 'Log In to your account',
                    fontSize: 24,
                  ),
                  const SizedBox(height: 20),
                  const LoginModeSelector(),
                  const SizedBox(height: 40),
                  AppTextFormField(
                    data: formData,
                    labelText: loginLabelText(state),
                    dataKey: 'login',
                    validator: AppValidation.phoneNumberValidation,
                  ),
                  const SizedBox(height: 20),
                  AppTextFormField(
                    data: formData,
                    dataKey: 'password',
                    labelText: 'Password',
                    isPassword: true,
                    validator: AppValidation.passwordValidation,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => handleLogin(state),
                    child: const Text('Log In'),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
