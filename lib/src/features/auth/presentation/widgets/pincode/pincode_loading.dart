import 'package:flutter/material.dart';
import 'package:flutter_banking/src/features/auth/presentation/widgets/auth_header.dart';

class PincodeLoading extends StatelessWidget {
  const PincodeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        AuthHeader(
          title: 'Checking pincode state',
          fontSize: 30,
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
        ),
        CircularProgressIndicator(),
      ],
    );
  }
}
