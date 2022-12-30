import 'package:flutter/material.dart';

class food extends StatelessWidget {
  const food({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.greenAccent, borderRadius: BorderRadius.circular(6)
          // border: const BoxBorder()
          ),
    );
  }
}
