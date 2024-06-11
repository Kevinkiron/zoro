import 'package:flutter/material.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(
        Icons.add,
        size: 30,
      ),
    );
  }
}
