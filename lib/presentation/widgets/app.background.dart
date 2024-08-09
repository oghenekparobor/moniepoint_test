import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/extensions/context.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mediaQuery.size.width,
      height: context.mediaQuery.size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFF8F8F7),
            Color(0xFFF8F3EC),
            Color(0xFFFAE8D4),
          ],
        ),
      ),
    );
  }
}
