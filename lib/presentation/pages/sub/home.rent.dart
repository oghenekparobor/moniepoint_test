import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/core/extensions/context.dart';
import 'package:moniepoint_test/core/extensions/string.dart';

class RentWidget extends StatefulWidget {
  const RentWidget({
    super.key,
  });

  @override
  State<RentWidget> createState() => _RentWidgetState();
}

class _RentWidgetState extends State<RentWidget> {
  Timer? timer;
  int current = 100;
  int maxExtent = 2212;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(milliseconds: 6), (timer) {
      if (mounted) {
        setState(() {
          if (current < maxExtent) {
            current += 4;
          } else {
            timer.cancel();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ZoomIn(
        delay: Durations.extralong4 * 3,
        child: Container(
          width: context.mediaQuery.size.width * .5,
          height: (context.mediaQuery.size.width * .5) - 16.w,
          margin: EdgeInsets.only(left: 4.w, right: 4.w),
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Colors.white10,
                Colors.white70,
                Colors.white54,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'RENT',
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.theme.colorScheme.tertiary,
                ),
              ),
              const Spacer(),
              Text(
                '$current'.addSpaceBetweenFirstAndFourthDigit,
                style: context.textTheme.displayLarge!.copyWith(
                  color: context.theme.colorScheme.tertiary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              4.verticalSpace,
              Text(
                'offers',
                style: context.textTheme.bodySmall!.copyWith(
                  color: context.theme.colorScheme.tertiary,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
