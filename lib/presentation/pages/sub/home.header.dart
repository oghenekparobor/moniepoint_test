import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/core/extensions/context.dart';

class HomeHeaderText extends StatefulWidget {
  const HomeHeaderText({
    super.key,
  });

  @override
  State<HomeHeaderText> createState() => _HomeHeaderTextState();
}

class _HomeHeaderTextState extends State<HomeHeaderText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _topAnimation;
  late Animation<double> _bottomAnimation;

  bool isControllerInitialized = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Durations.extralong2,
      vsync: this,
    );
    isControllerInitialized = true;

    _topAnimation = Tween<double>(begin: 43, end: 0).animate(_controller);
    _bottomAnimation = Tween<double>(begin: 0, end: 35).animate(_controller);

    Future.delayed((Durations.extralong4 * 2), () {
      if (mounted && isControllerInitialized) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    if (isControllerInitialized) {
      _controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                top: _topAnimation.value,
                child: Text(
                  'let\'s select your',
                  style: context.textTheme.displayLarge,
                ),
              );
            },
          ),
          Positioned(
            top: 50,
            child: Container(
              width: context.mediaQuery.size.width,
              height: 40.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFFF8F8F7),
                    Color(0xFFF8F3EC),
                    Color(0xFFF9EEE1),
                  ],
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                bottom: _bottomAnimation.value,
                child: Text(
                  'perfect place',
                  style: context.textTheme.displayLarge,
                ),
              );
            },
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: context.mediaQuery.size.width,
              height: 40.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFFF8F8F7),
                    Color(0xFFF8F3EC),
                    Color(0xFFF9EEE1),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
