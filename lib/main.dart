import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/core/routes/go.dart';

import 'core/theme/theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) {
        final MediaQueryData query = MediaQuery.of(context);
        final MediaQueryData mediaQuery = query.copyWith(
          textScaler: query.textScaler.clamp(
            minScaleFactor: 0.9,
            maxScaleFactor: 1.0,
          ),
        );

        return MediaQuery(
          data: mediaQuery,
          child: MaterialApp.router(
            title: 'MPR',
            debugShowCheckedModeBanner: false,
            theme: theme(context),
            routerConfig: router,
          ),
        );
      },
    );
  }
}
