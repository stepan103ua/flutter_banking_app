import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/config/routes.dart';
import 'package:flutter_banking/src/features/auth/presentation/bloc/pincode_cubit/pincode_cubit.dart';
import 'package:flutter_banking/src/features/auth/presentation/bloc/pincode_screen_bloc/pincode_screen_bloc.dart';
import 'package:flutter_banking/src/features/auth/presentation/widgets/pincode/pincode_header.dart';
import 'package:flutter_banking/src/features/auth/presentation/widgets/pincode/pincode_keyboard.dart';
import 'package:flutter_banking/src/features/auth/presentation/widgets/pincode/pincode_loading.dart';
import 'package:flutter_banking/src/features/auth/presentation/widgets/pincode/pincode_output.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PincodeScreen extends StatelessWidget {
  const PincodeScreen({super.key});

  bool isLoading(PincodeScreenState state) => state is PincodeScreenLoading;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PincodeCubit(),
        ),
        BlocProvider(
          create: (context) =>
              PincodeScreenBloc()..add(PincodeScreenCheckStateEvent()),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<PincodeScreenBloc, PincodeScreenState>(
          builder: (context, state) {
            return SafeArea(
              child: isLoading(state)
                  ? const PincodeLoading()
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        return SizedBox(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              PincodeHeader(
                                  height: constraints.maxHeight * 0.1),
                              Container(
                                alignment: Alignment.center,
                                height: constraints.maxHeight * 0.1,
                                child: const PincodeOutput(),
                              ),
                              SizedBox(
                                height: constraints.maxHeight * 0.55,
                                child: FittedBox(
                                  child: PincodeKeyboard(
                                    width: constraints.maxWidth,
                                    height: constraints.maxHeight,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: constraints.maxHeight * 0.07,
                              ),
                              SizedBox(
                                height: constraints.maxHeight * 0.1,
                                child: FittedBox(
                                  child: TextButton(
                                    onPressed: () => {
                                      Navigator.of(context)
                                          .pushReplacementNamed(AppRoutes.auth)
                                    },
                                    child: const Text(
                                      'Login with password',
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
            );
          },
        ),
      ),
    );
  }
}
