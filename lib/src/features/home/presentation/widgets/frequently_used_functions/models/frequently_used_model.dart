import 'package:flutter/cupertino.dart';

class FrequentlyUsedModel {
  final String title;
  final IconData iconData;
  final Color backgroundColor;
  final String routeName;

  FrequentlyUsedModel({
    required this.title,
    required this.routeName,
    required this.iconData,
    required this.backgroundColor,
  });
}
