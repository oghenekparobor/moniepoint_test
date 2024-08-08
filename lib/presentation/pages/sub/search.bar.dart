import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/core/extensions/context.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.mediaQuery.padding.top * 1.2,
      right: 30.w,
      left: 30.w,
      child: Row(
        children: [
          Expanded(
            child: ZoomIn(
              delay: Durations.extralong3,
              child: TextField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.search),
                  hintText: 'Saint Peterburg',
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
          8.horizontalSpace,
          ZoomIn(
            delay: Durations.extralong4,
            child: CircleAvatar(
              maxRadius: 23.r,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.graphic_eq_outlined,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
