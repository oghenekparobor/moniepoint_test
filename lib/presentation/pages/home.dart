import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:moniepoint_test/core/extensions/context.dart';
import 'package:moniepoint_test/core/extensions/widget.dart';
import 'package:moniepoint_test/presentation/notifier/app.notifier.dart';

import 'sub/home.appbar.dart';
import 'sub/home.buy.dart';
import 'sub/home.rent.dart';
import 'sub/home.tile.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  ScrollController? scrollCtrl;
  double topExtent = 1;

  @override
  void initState() {
    scrollCtrl = ScrollController();
    super.initState();

    Future.delayed(Durations.extralong4 * 4, () {
      if (scrollCtrl != null && scrollCtrl!.hasClients) {
        scrollCtrl!.animateTo(
          scrollCtrl!.position.maxScrollExtent,
          duration: Durations.extralong4,
          curve: Curves.linear,
        );
      }
    });

    scrollCtrl?.addListener(() {
      if (scrollCtrl != null) {
        if (scrollCtrl!.position.pixels ==
            scrollCtrl!.position.maxScrollExtent) {
          if (topExtent == 1) {
            setState(() => topExtent = .6);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final app = ref.watch(appNotifierProvider);

    return SizedBox(
      width: context.mediaQuery.size.width,
      height: context.mediaQuery.size.height,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              context.mediaQuery.padding.top.verticalSpace,
              12.verticalSpace,
              const HomeAppbar(),
              32.verticalSpace,
              FadeIn(
                delay: Durations.extralong4 * 2,
                child: Text(
                  'Hi, Marina',
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: context.theme.colorScheme.tertiary,
                  ),
                ),
              ),
              4.verticalSpace,
              Text(
                'let\'s select your\nperfect place',
                style: context.textTheme.displayLarge!.copyWith(
                  height: 1,
                ),
              ),
              40.verticalSpace,
              const Row(
                children: [
                  BuyWidget(),
                  RentWidget(),
                ],
              ),
              40.verticalSpace,
            ],
          ).padHorizontal,
          SlideInUp(
            delay: Durations.extralong4 * 4,
            child: SingleChildScrollView(
              controller: scrollCtrl,
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  (context.mediaQuery.size.height * topExtent).verticalSpace,
                  Container(
                    width: context.mediaQuery.size.width,
                    padding: EdgeInsets.all(8.sp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                      child: StaggeredGrid.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        children: [
                          for (int i = 0;
                              i < app.images.take(4).length;
                              i++) ...{
                            StaggeredGridTile.count(
                              crossAxisCellCount: i % 3 == 0 ? 4 : 2,
                              mainAxisCellCount: 2,
                              child: Tile(
                                image: app.images[i],
                              ),
                            ),
                          },
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
