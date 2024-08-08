import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniepoint_test/core/extensions/context.dart';
import 'package:moniepoint_test/presentation/notifier/app.notifier.dart';
import 'package:moniepoint_test/presentation/pages/home.dart';
import 'package:moniepoint_test/presentation/pages/search.dart';
import 'package:moniepoint_test/presentation/widgets/app.background.dart';
import 'package:moniepoint_test/presentation/widgets/app.bottomnav.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final app = ref.watch(appNotifierProvider);

    return Scaffold(
      body: StreamBuilder<int>(
        stream: app.activeScreen.stream,
        builder: (context, snapshot) {
          if (snapshot.data == null) return const SizedBox.shrink();

          final active = snapshot.data!;

          final List<Map<IconData, Widget>> screens = [
            {CupertinoIcons.search: const Search()},
            {
              CupertinoIcons.chat_bubble_fill: Container(
                color: context.theme.colorScheme.secondary,
              )
            },
            {Icons.home: const Home()},
            {
              CupertinoIcons.heart_fill: Container(
                color: context.theme.colorScheme.primary,
              )
            },
            {
              CupertinoIcons.person_fill: Container(
                color: context.theme.colorScheme.tertiary,
              )
            },
          ];

          return Stack(
            children: [
              const AppBackground(),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                switchInCurve: Curves.easeInQuad,
                switchOutCurve: Curves.easeOutQuad,
                child: screens[active].entries.first.value,
              ),
              FloatingBottomNav(screens: screens),
            ],
          );
        },
      ),
    );
  }
}
