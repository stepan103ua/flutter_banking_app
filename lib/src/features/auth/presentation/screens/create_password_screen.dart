import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/constants/validation.dart';
import 'package:flutter_banking/src/core/widgets/app_text_form_field.dart';
import 'package:flutter_banking/src/features/auth/models/register_model.dart';
import 'package:flutter_banking/src/features/auth/presentation/bloc/auth_screen_cubit/auth_screen_cubit.dart';
import 'package:flutter_banking/src/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter_banking/src/features/auth/presentation/widgets/auth_header.dart';
import 'package:flutter_banking/src/features/auth/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/blocs/auth_bloc/auth_bloc.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  void _createAccount(Map<String, dynamic>? formData) async {
    if (formData == null) {
      return;
    }

    final formState = formKey.currentState;

    if (formState == null) {
      return;
    }

    if (!formState.validate()) {
      return;
    }

    formState.save();
    final loading = BlocProvider.of<AuthScreenCubit>(context).loading;
    loading(true);

    final registerModel = RegisterModel.fromJson(formData);
    final errorMessage = await AuthService().register(registerModel);
    loading(false);

    if (errorMessage != null) {
      Fluttertoast.showToast(msg: errorMessage);
      return;
    }

    if (!mounted) return;

    BlocProvider.of<AuthBloc>(context).add(AuthLoginEvent());

    Navigator.of(context).pushReplacementNamed('/');
  }

  String? _handleConfirmPasswordValidation(String? value, String? password) =>
      AppValidation.confirmPasswordValidation(value, password);

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final Map<String, dynamic>? formData = routeArguments?['data'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Password'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          iconSize: 20,
          splashRadius: 25,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AuthHeader(title: 'Create a password', fontSize: 30),
              const SizedBox(height: 40),
              AppTextFormField(
                data: formData,
                dataKey: 'password',
                labelText: 'Password',
                isPassword: true,
                validator: AppValidation.passwordValidation,
              ),
              const SizedBox(height: 20),
              AppTextFormField(
                labelText: 'Confirm password',
                isPassword: true,
                validator: (value) => _handleConfirmPasswordValidation(
                  value,
                  formData?['password'],
                ),
              ),
              const SizedBox(height: 20),
              AuthButton(
                title: 'Create account',
                onPress: () => _createAccount(formData),
              )
            ],
          ),
        ),
      ),
    );
  }
}
