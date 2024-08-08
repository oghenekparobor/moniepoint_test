import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:moniepoint_test/core/extensions/context.dart';

class Tile extends StatefulWidget {
  const Tile({
    super.key,
    required this.image,
  });

  final String image;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  Timer? timer;
  double scale = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Durations.extralong4 * 5, () {
      timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
        if (mounted) {
          setState(() {
            if (scale < 1) {
              scale += 0.05;
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
    return LayoutBuilder(builder: (_, size) {
      double width = size.maxWidth - 50;

      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 50.w + (width * scale),
                height: 50.h,
                padding: EdgeInsets.only(
                  top: 2.w,
                  bottom: 2.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: Colors.white30,
                ),
                child: Stack(
                  children: [
                    if (scale > .8) ...{
                      ZoomIn(
                        delay: Durations.medium4,
                        child: Align(
                          alignment: size.maxWidth <
                                  (context.mediaQuery.size.width * .8)
                              ? Alignment.centerLeft
                              : Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              'Gladkoca, St., 25',
                              style: context.textTheme.bodySmall,
                            ),
                          ),
                        ),
                      ),
                    },
                    Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        maxRadius: 25.r,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          weight: .5.w,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ).asGlass(
                tintColor: Colors.white30,
                clipBorderRadius: BorderRadius.circular(50.r),
              ),
            ),
          ),
        ],
      );
    });
  }
}
