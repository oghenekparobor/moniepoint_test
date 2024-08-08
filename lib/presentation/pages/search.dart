import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniepoint_test/core/app_strings.dart';
import 'package:moniepoint_test/core/extensions/context.dart';
import 'package:moniepoint_test/presentation/pages/sub/search.bar.dart';

import 'sub/search.fab.dart';
import 'sub/search.tile.dart';

class Search extends ConsumerStatefulWidget {
  const Search({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchState();
}

class _SearchState extends ConsumerState<Search> {
  @override
  Widget build(BuildContext context) {
    final random = Random();

    final screenWidth = context.mediaQuery.size.width;
    final screenHeight = context.mediaQuery.size.height;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: const SearchFloatingButton(),
      body: Container(
        width: context.mediaQuery.size.width,
        height: context.mediaQuery.size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Strings.map),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            for (var i = 0; i < 6; i++) ...{
              MapTile(
                bottom: random.nextDouble() * (screenHeight - 200),
                left: random.nextDouble() * (screenWidth - 100),
              ),
            },
            const MySearchBar(),
          ],
        ),
      ),
    );
  }
}
