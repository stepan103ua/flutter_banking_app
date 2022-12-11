import 'package:flutter/material.dart';

class AddBankCard extends StatelessWidget {
  const AddBankCard({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: height / 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Create a new card',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () => {},
            borderRadius: BorderRadius.circular(1000),
            child: Container(
              height: height / 2,
              width: height / 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withOpacity(0.08),
              ),
              child: Icon(
                Icons.add_rounded,
                size: height / 3,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
