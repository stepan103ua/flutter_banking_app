import 'package:flutter/material.dart';

class PincodeSaveDialog extends StatefulWidget {
  const PincodeSaveDialog({super.key, required this.pincode});
  final String pincode;
  @override
  State<PincodeSaveDialog> createState() => _PincodeSaveDialogState();
}

class _PincodeSaveDialogState extends State<PincodeSaveDialog> {
  bool show = false;

  String get _pincode => show ? widget.pincode : '****';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceBetween,
      title: const Text(
        'Confirm pincode',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Pincode: $_pincode'),
          IconButton(
            onPressed: () => setState(() {
              show = !show;
            }),
            icon: Icon(
              show ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              size: 30,
            ),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'Cancel',
            style: TextStyle(fontSize: 16),
          ),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        TextButton(
          child: const Text(
            'Confirm',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}
