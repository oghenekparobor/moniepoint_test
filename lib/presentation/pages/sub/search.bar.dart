import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/core/app_strings.dart';
import 'package:moniepoint_test/core/extensions/context.dart';
import 'package:moniepoint_test/presentation/widgets/icon.dart';

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
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: AppIcon(
                      Strings.iSearchLine,
                      color: Colors.black,
                    ),
                  ),
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
              child: AppIcon(
                Strings.iSettings,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
