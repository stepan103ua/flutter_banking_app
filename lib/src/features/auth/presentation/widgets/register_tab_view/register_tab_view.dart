import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/config/routes.dart';
import 'package:flutter_banking/src/core/constants/validation.dart';
import 'package:flutter_banking/src/features/auth/presentation/widgets/auth_button.dart';

import '../../../../../core/widgets/app_text_form_field.dart';
import '../auth_header.dart';

class RegisterTabView extends StatelessWidget {
  RegisterTabView({super.key});

  final Map<String, dynamic> formData = {};

  final formKey = GlobalKey<FormState>();

  void _handleNextButton(BuildContext context) {
    final formState = formKey.currentState;
    if (formState == null) {
      return;
    }
    if (!formState.validate()) {
      return;
    }

    formState.save();
    Navigator.of(context).pushNamed(
      AppRoutes.createPassword,
      arguments: {
        'data': formData,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AuthHeader(
                title: 'Create an account',
                fontSize: 24,
              ),
              const SizedBox(height: 20),
              AppTextFormField(
                data: formData,
                labelText: 'Name',
                dataKey: 'name',
                validator: AppValidation.credentialsValidation,
              ),
              const SizedBox(height: 20),
              AppTextFormField(
                data: formData,
                labelText: 'Surname',
                dataKey: 'surname',
                validator: AppValidation.credentialsValidation,
              ),
              const SizedBox(height: 20),
              AppTextFormField(
                data: formData,
                labelText: 'Phone number',
                dataKey: 'phone',
                validator: AppValidation.phoneNumberValidation,
              ),
              const SizedBox(height: 20),
              AppTextFormField(
                data: formData,
                labelText: 'IPN',
                dataKey: 'ipn',
                validator: AppValidation.ipnValidation,
              ),
              const SizedBox(height: 20),
              AppTextFormField(
                data: formData,
                labelText: 'Passport number',
                dataKey: 'passport',
                validator: AppValidation.passportValidation,
              ),
              const SizedBox(height: 20),
              AuthButton(
                title: 'Next',
                onPress: () => _handleNextButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
