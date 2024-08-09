import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/core/extensions/context.dart';
import 'package:moniepoint_test/core/extensions/string.dart';
import 'package:moniepoint_test/presentation/notifier/app.notifier.dart';

class BuyWidget extends ConsumerStatefulWidget {
  const BuyWidget({
    super.key,
  });

  @override
  ConsumerState<BuyWidget> createState() => _BuyWidgetState();
}

class _BuyWidgetState extends ConsumerState<BuyWidget> {
  Timer? timer;
  int maxExtent = 1034;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final app = ref.watch(appNotifierProvider);

      Future.delayed(Durations.extralong4 * 2, () {
        timer = Timer.periodic(const Duration(milliseconds: 6), (timer) {
          if (app.buyCounter.value < maxExtent) {
            app.buyCounter.emit(app.buyCounter.value + 2);
          } else {
            timer.cancel();
          }
        });
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
              StreamBuilder<int>(
                stream: app.buyCounter.stream,
                builder: (context, snapshot) {
                  if (snapshot.data == null) return const SizedBox.shrink();
                  final int current = snapshot.data!;

                  return Text(
                    '$current'.addSpaceBetweenFirstAndFourthDigit,
                    style: context.textTheme.displayLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
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
