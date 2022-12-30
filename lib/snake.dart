import 'package:flutter/material.dart';

class snake extends StatelessWidget {
  const snake({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)
          // border: const BoxBorder()
          ),
    );
  }
}
