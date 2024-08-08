import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/core/extensions/context.dart';
import 'dart:async';

class MapTile extends StatefulWidget {
  const MapTile({
    super.key,
    this.bottom,
    this.left,
    this.right,
    this.top,
  });

  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  @override
  State<MapTile> createState() => _MapTileState();
}

class _MapTileState extends State<MapTile> {
  double width = 120;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 2000) + Durations.extralong4,
        () {
      timer = Timer.periodic(const Duration(milliseconds: 15), (timer) {
        if (mounted) {
          setState(() {
            if (width > 50.w) {
              width -= 1.w;
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
    return Positioned(
      top: widget.top?.h,
      left: widget.left?.w,
      right: widget.right?.w,
      bottom: widget.bottom?.h,
      child: ZoomIn(
        delay: Durations.extralong4,
        child: AnimatedContainer(
          width: width.w,
          duration: const Duration(milliseconds: 50), // Animation duration
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.secondary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r),
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.satellite_alt_rounded,
                  size: 18.sp,
                  color: Colors.white,
                ),
                if (width > 60.w) ...{
                  SizedBox(width: 8.w),
                  Text(
                    '11mn ℙ',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}
