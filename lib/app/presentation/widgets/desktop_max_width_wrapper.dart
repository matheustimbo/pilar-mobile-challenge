import 'package:flutter/material.dart';

class DesktopMaxWidthWrapper extends StatelessWidget {
  final Widget child;

  const DesktopMaxWidthWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1300),
        child: child,
      ),
    );
  }
}
