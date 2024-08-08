import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/core/app_strings.dart';
import 'package:moniepoint_test/core/extensions/context.dart';

class HomeAppbar extends StatefulWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  GlobalKey key = GlobalKey();

  Timer? timer;
  double scale = 0;
  double maxScale = 170;

  @override
  void initState() {
    super.initState();

    Future.delayed(Durations.extralong4, () {
      timer = Timer.periodic(const Duration(milliseconds: 5), (timer) {
        if (mounted) {
          setState(() {
            if (scale < maxScale) {
              scale += 2;
            } else {
              timer.cancel();
            }
          });
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          key: key,
          width: scale.w,
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FadeIn(
              animate: scale == maxScale,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_pin,
                    color: context.theme.colorScheme.tertiary,
                  ),
                  8.horizontalSpace,
                  Text(
                    'Saint Peterburg',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: context.theme.colorScheme.tertiary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  8.horizontalSpace,
                ],
              ),
            ),
          ),
        ),
        ZoomIn(
          delay: Durations.extralong4,
          child: CircleAvatar(
            backgroundImage: AssetImage(
              Strings.avatar,
            ),
          ),
        ),
      ],
    );
  }
}
