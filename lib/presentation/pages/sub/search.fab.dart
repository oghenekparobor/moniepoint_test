import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:moniepoint_test/core/app_strings.dart';
import 'package:moniepoint_test/core/extensions/context.dart';
import 'package:moniepoint_test/core/extensions/widget.dart';
import 'package:moniepoint_test/presentation/widgets/icon.dart';

class SearchFloatingButton extends StatefulWidget {
  const SearchFloatingButton({
    super.key,
  });

  @override
  State<SearchFloatingButton> createState() => _SearchFloatingButtonState();
}

class _SearchFloatingButtonState extends State<SearchFloatingButton> {
  final GlobalKey _popupKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PopupMenuButton(
          onSelected: (value) {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          color: Colors.white,
          offset: Offset(0.w, -160.h),
          itemBuilder: (BuildContext bc) {
            return [
              for (var i in [
                {Strings.iShield: 'Cosy areas'},
                {Strings.iWallet: 'Prices'},
                {Strings.iCart: 'Infrastructure'},
                {Strings.iLayers: 'Without any layer'},
              ]) ...{
                PopupMenuItem(
                  value: i.entries.first.value,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      8.horizontalSpace,
                      AppIcon(
                        i.entries.first.key,
                        color: i.entries.first.value == 'Prices'
                            ? context.theme.colorScheme.secondary
                            : context.theme.colorScheme.tertiary,
                      ),
                      12.horizontalSpace,
                      Text(
                        i.entries.first.value,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: i.entries.first.value == 'Prices'
                              ? context.theme.colorScheme.secondary
                              : context.theme.colorScheme.tertiary,
                        ),
                      ),
                    ],
                  ),
                ),
              }
            ];
          },
          child: ZoomIn(
            delay: Durations.extralong1,
            child: GestureDetector(
              child: CircleAvatar(
                maxRadius: 25.r,
                backgroundColor: Colors.white10,
                child: AppIcon(
                  Strings.iLocation,
                  color: Colors.white70,
                ),
              ).asGlass(
                tintColor: Colors.white10,
                clipBorderRadius: BorderRadius.circular(60.r),
              ),
            ),
          ),
        ),
        6.verticalSpace,
        Row(
          children: [
            ZoomIn(
              delay: Durations.extralong1,
              child: CircleAvatar(
                backgroundColor: Colors.white10,
                maxRadius: 25.r,
                child: AppIcon(
                  Strings.iLocationPin,
                  color: Colors.white70,
                ),
              ).asGlass(
                tintColor: Colors.white10,
                clipBorderRadius: BorderRadius.circular(60.r),
              ),
            ),
            const Spacer(),
            ZoomIn(
              delay: Durations.extralong1,
              child: Container(
                key: _popupKey,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppIcon(
                      Strings.iMenu,
                      color: Colors.white70,
                    ),
                    8.horizontalSpace,
                    Text(
                      'List of variants',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ).asGlass(
                tintColor: Colors.white10,
                clipBorderRadius: BorderRadius.circular(60.r),
              ),
            ),
            30.horizontalSpace,
          ],
        ),
        70.verticalSpace,
      ],
    ).padHorizontal;
  }
}
