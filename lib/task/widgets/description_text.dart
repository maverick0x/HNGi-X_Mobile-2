import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  final String description;

  const DescriptionText({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 0.3,
          ),
        ),
      ),
      padding: const EdgeInsets.only(
        bottom: 2.0,
        right: 2.0,
      ),
      child: Text(
        description,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
      ),
    );
  }
}
