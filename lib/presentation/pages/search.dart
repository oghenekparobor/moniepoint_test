import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniepoint_test/core/app_strings.dart';
import 'package:moniepoint_test/core/extensions/context.dart';

class Search extends ConsumerStatefulWidget {
  const Search({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchState();
}

class _SearchState extends ConsumerState<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mediaQuery.size.width,
      height: context.mediaQuery.size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Strings.map),
        ),
      ),
    );
  }
}
