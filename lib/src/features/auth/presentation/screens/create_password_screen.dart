import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/widgets/app_text_form_field.dart';
import 'package:flutter_banking/src/features/auth/models/register_model.dart';
import 'package:flutter_banking/src/features/auth/presentation/widgets/auth_header.dart';
import 'package:flutter_banking/src/features/auth/services/auth_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  void createAccount(Map<String, dynamic>? formData) async {
    if (formData == null) {
      return;
    }

    final formState = formKey.currentState;

    if (formState == null) {
      return;
    }

    formState.save();

    final registerModel = RegisterModel.fromJson(formData);
    final errorMessage = await AuthService().register(registerModel);

    if (errorMessage != null) {
      Fluttertoast.showToast(msg: errorMessage);
      return;
    }

    if (!mounted) return;

    Navigator.of(context).pushReplacementNamed('/');
  }

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
              ),
              const SizedBox(height: 20),
              const AppTextFormField(
                labelText: 'Confirm password',
                isPassword: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => createAccount(formData),
                child: const Text('Create account'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
