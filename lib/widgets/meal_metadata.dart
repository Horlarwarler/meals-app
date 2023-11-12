import 'package:flutter/material.dart';

class MealMetaData extends StatelessWidget {
  const MealMetaData({super.key, required this.icon, required this.info});

  final IconData icon;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 17,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          info,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        )
      ],
    );
  }
}
