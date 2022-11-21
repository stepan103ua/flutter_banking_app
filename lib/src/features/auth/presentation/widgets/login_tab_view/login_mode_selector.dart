import 'package:flutter/cupertino.dart';
import 'package:flutter_banking/src/features/auth/presentation/bloc/cubit/login_mode_cubit.dart';

import 'login_mode_selector_item.dart';

class LoginModeSelector extends StatelessWidget {
  const LoginModeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      LoginModeSelectorItem(title: 'Phone', loginModeState: LoginPhoneMode()),
      LoginModeSelectorItem(title: 'IPN', loginModeState: LoginIpnMode())
    ]);
  }
}
