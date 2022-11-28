import 'package:flutter/material.dart';
import 'package:flutter_banking/src/features/auth/presentation/bloc/pincode_screen_bloc/pincode_screen_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_header.dart';

class PincodeHeader extends StatelessWidget {
  const PincodeHeader({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: height,
      child: BlocBuilder<PincodeScreenBloc, PincodeScreenState>(
        builder: (context, state) {
          final title = state is PincodeScreenCreate
              ? 'Create pin code'
              : 'Enter pin code';

          return FittedBox(
            fit: BoxFit.scaleDown,
            child: AuthHeader(
              title: title,
              fontSize: 30,
              padding: EdgeInsets.zero,
            ),
          );
        },
      ),
    );
  }
}
