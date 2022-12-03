import 'package:flutter/material.dart';

class FrequentlyUsedFunctionItem extends StatelessWidget {
  const FrequentlyUsedFunctionItem({
    super.key,
    required this.title,
    required this.iconData,
    required this.backgroundColor,
    required this.routeName,
  });

  final String title;
  final IconData iconData;
  final Color backgroundColor;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.maxHeight * 0.6;

        return SizedBox(
          width: size,
          height: constraints.maxHeight,
          child: Column(
            children: [
              InkWell(
                onTap: () => Navigator.of(context).pushNamed(routeName),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: backgroundColor.withOpacity(0.08),
                  ),
                  child: Icon(
                    iconData,
                    color: backgroundColor,
                    size: size * 0.4,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.1,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.3,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
