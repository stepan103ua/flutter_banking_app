import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/widgets/shake_widget/shake_widget.dart';
import 'package:flutter_banking/src/features/auth/presentation/bloc/pincode_cubit/pincode_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PincodeOutput extends StatelessWidget {
  const PincodeOutput({super.key});

  List<_PincodeOutputItem> _pincodeOutputItems(String pincode) {
    int length = pincode.length;

    if (length > 4) {
      length = 4;
    }

    final pincodeItems = <_PincodeOutputItem>[];

    for (int i = 0; i < length; i++) {
      pincodeItems.add(_PincodeOutputItem(digit: pincode[i]));
    }

    for (int i = 0; i < 4 - length; i++) {
      pincodeItems.add(const _PincodeOutputItem());
    }

    return pincodeItems;
  }

  @override
  Widget build(BuildContext context) {
    return ShakeWidget(
      shakeOffset: 10,
      key: BlocProvider.of<PincodeCubit>(context).shakeKey,
      child: Container(
        alignment: Alignment.center,
        child: BlocBuilder<PincodeCubit, AbstractPincodeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: _pincodeOutputItems(state.pincode),
            );
          },
        ),
      ),
    );
  }
}

class _PincodeOutputItem extends StatelessWidget {
  const _PincodeOutputItem({this.digit});

  final String? digit;

  double get _opacity => digit == null ? 0.5 : 1;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      height: 13,
      width: 13,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(_opacity),
        borderRadius: BorderRadius.circular(60),
      ),
    );
  }
}
