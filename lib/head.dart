import 'package:flutter/material.dart';

class head extends StatelessWidget {
  const head({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.redAccent, borderRadius: BorderRadius.circular(12)
          // border: const BoxBorder()
          ),
    );
  }
}
