import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/core/extensions/context.dart';
import 'package:moniepoint_test/core/extensions/string.dart';
import 'package:moniepoint_test/presentation/notifier/app.notifier.dart';

class RentWidget extends ConsumerStatefulWidget {
  const RentWidget({
    super.key,
  });

  @override
  ConsumerState<RentWidget> createState() => _RentWidgetState();
}

class _RentWidgetState extends ConsumerState<RentWidget> {
  Timer? timer;
  int maxExtent = 2212;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final app = ref.watch(appNotifierProvider);

      timer = Timer.periodic(const Duration(milliseconds: 6), (timer) {
        if (app.rentCounter.value < maxExtent) {
          app.rentCounter.emit(app.rentCounter.value + 4);
        } else {
          timer.cancel();
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
    final app = ref.watch(appNotifierProvider);

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
              StreamBuilder<int>(
                stream: app.rentCounter.stream,
                builder: (context, snapshot) {
                  if (snapshot.data == null) return const SizedBox.shrink();
                  final int current = snapshot.data!;

                  return Text(
                    '$current'.addSpaceBetweenFirstAndFourthDigit,
                    style: context.textTheme.displayLarge!.copyWith(
                      color: context.theme.colorScheme.tertiary,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
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
