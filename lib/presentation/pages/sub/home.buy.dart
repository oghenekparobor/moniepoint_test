import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/core/extensions/context.dart';
import 'package:moniepoint_test/core/extensions/string.dart';

class BuyWidget extends StatefulWidget {
  const BuyWidget({
    super.key,
  });

  @override
  State<BuyWidget> createState() => _BuyWidgetState();
}

class _BuyWidgetState extends State<BuyWidget> {
  Timer? timer;
  int current = 100;
  int maxExtent = 1034;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(milliseconds: 6), (timer) {
      if (mounted) {
        setState(() {
          if (current < maxExtent) {
            current += 2;
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
          height: context.mediaQuery.size.width * .5,
          margin: EdgeInsets.only(left: 4.w, right: 4.w),
          padding: EdgeInsets.all(30.sp),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.secondary,
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BUY',
                style: context.textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Text(
                '$current'.addSpaceBetweenFirstAndFourthDigit,
                style: context.textTheme.displayLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              4.verticalSpace,
              Text(
                'offers',
                style: context.textTheme.bodySmall!.copyWith(
                  color: Colors.white70,
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
