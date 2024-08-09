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

class _MapTileState extends State<MapTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 8000),
      vsync: this,
    );

    _heightAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 50, end: 50),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ConstantTween(50),
        weight: 1,
      ),
    ]).animate(_controller);

    _widthAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: ConstantTween(0),
        weight: 5,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0, end: 120),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: ConstantTween(120),
        weight: 15,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 120, end: 50),
        weight: 2,
      ),
    ]).animate(_controller);

    Future.delayed(Durations.extralong1, () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top?.h,
      left: widget.left?.w,
      right: widget.right?.w,
      bottom: widget.bottom?.h,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: _widthAnimation.value.w,
            height: _heightAnimation.value.h,
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
                  if (_heightAnimation.value > 40) ...{
                    Icon(
                      Icons.satellite_alt_rounded,
                      size: 18.sp,
                      color: Colors.white,
                    ),
                  },
                  if (_widthAnimation.value > 60.w) ...{
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
          );
        },
      ),
    );
  }
}
