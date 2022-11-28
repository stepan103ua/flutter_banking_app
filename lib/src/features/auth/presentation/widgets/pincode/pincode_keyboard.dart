import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_banking/src/features/auth/presentation/bloc/pincode_cubit/pincode_cubit.dart';
import 'package:flutter_banking/src/features/auth/presentation/bloc/pincode_screen_bloc/pincode_screen_bloc.dart';
import 'package:flutter_banking/src/features/auth/presentation/widgets/pincode/pincode_save_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PincodeKeyboard extends StatefulWidget {
  const PincodeKeyboard({
    super.key,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;

  @override
  State<PincodeKeyboard> createState() => _PincodeKeyboardState();
}

class _PincodeKeyboardState extends State<PincodeKeyboard> {
  void _handleAddDigit(BuildContext context, String digit) async {
    final pincodeCubit = BlocProvider.of<PincodeCubit>(context);
    pincodeCubit.addDigit(digit);

    if (pincodeCubit.state.pincode.length != 4) {
      return;
    }

    final pincodeScreenBloc = BlocProvider.of<PincodeScreenBloc>(context);

    if (pincodeScreenBloc.state is PincodeScreenCreate) {
      final result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => PincodeSaveDialog(
          pincode: pincodeCubit.state.pincode,
        ),
      );
      if (!result) {
        return;
      }

      await pincodeCubit.savePincode();
      await pincodeCubit.refreshToken();

      if (!mounted) {
        return;
      }

      BlocProvider.of<AuthBloc>(context).add(AuthLoginEvent());

      Navigator.pushReplacementNamed(context, '/');
    }

    final isCorrect = await pincodeCubit.checkIfCorrect();

    if (!isCorrect) return;

    await pincodeCubit.refreshToken();

    if (!mounted) return;

    BlocProvider.of<AuthBloc>(context).add(AuthLoginEvent());

    Navigator.pushReplacementNamed(context, '/');
  }

  void _handleDelete(BuildContext context) {
    BlocProvider.of<PincodeCubit>(context).deleteDigit();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PincodeKeyboardButton(
              title: '1',
              size: widget.height * 0.12,
              onPress: () => _handleAddDigit(context, '1'),
            ),
            SizedBox(width: widget.height * 0.03),
            _PincodeKeyboardButton(
              title: '2',
              size: widget.height * 0.12,
              onPress: () => _handleAddDigit(context, '2'),
            ),
            SizedBox(width: widget.height * 0.03),
            _PincodeKeyboardButton(
              title: '3',
              size: widget.height * 0.12,
              onPress: () => _handleAddDigit(context, '3'),
            ),
          ],
        ),
        SizedBox(height: widget.height * 0.03),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PincodeKeyboardButton(
              title: '4',
              size: widget.height * 0.12,
              onPress: () => _handleAddDigit(context, '4'),
            ),
            SizedBox(width: widget.height * 0.03),
            _PincodeKeyboardButton(
              title: '5',
              size: widget.height * 0.12,
              onPress: () => _handleAddDigit(context, '5'),
            ),
            SizedBox(width: widget.height * 0.03),
            _PincodeKeyboardButton(
              title: '6',
              size: widget.height * 0.12,
              onPress: () => _handleAddDigit(context, '6'),
            ),
          ],
        ),
        SizedBox(height: widget.height * 0.03),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PincodeKeyboardButton(
              title: '7',
              size: widget.height * 0.12,
              onPress: () => _handleAddDigit(context, '7'),
            ),
            SizedBox(width: widget.height * 0.03),
            _PincodeKeyboardButton(
              title: '8',
              size: widget.height * 0.12,
              onPress: () => _handleAddDigit(context, '8'),
            ),
            SizedBox(width: widget.height * 0.03),
            _PincodeKeyboardButton(
              title: '9',
              size: widget.height * 0.12,
              onPress: () => _handleAddDigit(context, '9'),
            ),
          ],
        ),
        SizedBox(height: widget.height * 0.03),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PincodeKeyboardButton(
              iconData: Icons.fingerprint,
              size: widget.height * 0.12,
              onPress: () => {},
            ),
            SizedBox(width: widget.height * 0.03),
            _PincodeKeyboardButton(
              title: '0',
              size: widget.height * 0.12,
              onPress: () => _handleAddDigit(context, '0'),
            ),
            SizedBox(width: widget.height * 0.03),
            _PincodeKeyboardButton(
              iconData: Icons.backspace,
              size: widget.height * 0.12,
              onPress: () => _handleDelete(context),
            ),
          ],
        )
      ],
    );
  }
}

class _PincodeKeyboardButton extends StatelessWidget {
  const _PincodeKeyboardButton(
      {this.title, this.iconData, required this.size, required this.onPress});
  final String? title;
  final IconData? iconData;
  final double size;
  final void Function() onPress;

  Widget _buildChild(BuildContext context) => title != null
      ? Text(
          title!,
          style: TextStyle(color: Theme.of(context).primaryColor),
        )
      : Icon(
          iconData,
          color: Theme.of(context).primaryColor,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(60),
      //splashColor: Colors.white,
      onTap: onPress,
      child: Container(
        height: size,
        width: size,
        padding: EdgeInsets.all(size * 0.2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          border: iconData == null
              ? Border.all(color: Theme.of(context).primaryColor, width: 3)
              : null,
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: _buildChild(context),
        ),
      ),
    );
  }
}
