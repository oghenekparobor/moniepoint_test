
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.white,
            context.theme.colorScheme.secondary.withOpacity(.3),
          ],
        ),
      ),
    );
  }
}
