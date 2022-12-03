import 'package:flutter/material.dart';
import 'package:flutter_banking/src/features/home/presentation/widgets/frequently_used_functions/frequently_used_function_item.dart';
import 'package:flutter_banking/src/features/home/presentation/widgets/frequently_used_functions/models/frequently_used_model.dart';

class FrequentlyUsedFunctions extends StatelessWidget {
  FrequentlyUsedFunctions(
      {super.key, required this.padding, required this.height});
  final EdgeInsets padding;
  final double height;

  final List<FrequentlyUsedModel> functions = [
    FrequentlyUsedModel(
      title: 'Money\nTransfer',
      routeName: '/moneyTransfer',
      iconData: Icons.send_rounded,
      backgroundColor: Colors.green,
    ),
    FrequentlyUsedModel(
      title: 'Payments\nBills',
      routeName: '/paymentsBills',
      iconData: Icons.payments_rounded,
      backgroundColor: Colors.red,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Frequently Used',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: functions.length,
              itemBuilder: (context, index) => FrequentlyUsedFunctionItem(
                title: functions[index].title,
                iconData: functions[index].iconData,
                backgroundColor: functions[index].backgroundColor,
                routeName: functions[index].routeName,
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
