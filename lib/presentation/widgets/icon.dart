import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.icon, {
    super.key,
    this.color,
    this.size,
  });

  final String icon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      height: size?.sp,
      width: size?.sp,
      // ignore: deprecated_member_use
      color: color,
      theme: SvgTheme(currentColor: color ?? const Color(0xFF000000)),
    );
  }
}
