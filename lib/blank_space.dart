import 'package:flutter/material.dart';

class blankspace extends StatelessWidget {
  const blankspace({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[900], borderRadius: BorderRadius.circular(6)
          // border: const BoxBorder()
          ),
    );
  }
}
