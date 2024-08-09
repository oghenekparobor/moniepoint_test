import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_test/core/extensions/context.dart';
import 'package:moniepoint_test/presentation/notifier/app.notifier.dart';

import 'icon.dart';

class FloatingBottomNav extends ConsumerWidget {
  const FloatingBottomNav({
    super.key,
    required this.screens,
  });

  final List<Map<String, Widget>> screens;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final app = ref.watch(appNotifierProvider);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.h),
        child: SlideInUp(
          delay: Durations.extralong4 * 6.5,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2B2B2B).withOpacity(.95),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: StreamBuilder<int>(
              stream: app.activeScreen.stream,
              builder: (context, snapshot) {
                if (snapshot.data == null) return const SizedBox.shrink();

                final active = snapshot.data!;

                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: screens
                      .asMap()
                      .map((index, e) => MapEntry(
                            index,
                            Padding(
                              padding: EdgeInsets.all(4.sp),
                              child: GestureDetector(
                                onTap: () {
                                  app.activeScreen.emit(index);
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  width: index == active ? 50.r : 40.r,
                                  height: index == active ? 50.r : 40.r,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: index == active
                                        ? context.theme.colorScheme.secondary
                                        : context.theme.colorScheme.primary,
                                  ),
                                  margin: index == active
                                      ? EdgeInsets.zero
                                      : EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Padding(
                                    padding: EdgeInsets.all(12.sp),
                                    child: AppIcon(
                                      e.entries.first.key,
                                      size: index == active ? 24.sp : 20.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .values
                      .toList(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
